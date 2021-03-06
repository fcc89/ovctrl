

#include <stddef.h>
#include "analogFrontEnd.h"
#include <stdbool.h>
#include <stdlib.h>                     
#include "definitions.h"   
#include "wirelessCom.h"


bool bIs_thrm2_init = false;
DRV_HANDLE analog_SPI_handle;
bool bAnalog_SPI_open = false;
analog_data_t analog_state;
QueueHandle_t xQueueAnalogOutput;
SemaphoreHandle_t xBinarySemaphoreTRM2dReady;


void TRM_dataReady_handler(GPIO_PIN pin,uintptr_t context){
    BaseType_t xHigherPriorityTaskWoken;
    
    xHigherPriorityTaskWoken = pdFALSE;
    
    if(TRM_nDRDY_Get()==0){
        xSemaphoreGiveFromISR(xBinarySemaphoreTRM2dReady,&xHigherPriorityTaskWoken);
        //LED2_Toggle();
    }

}


//TODO add error reporting
//Opens SPI port and write default configuration to Max31856
static bool Thermocouple2_init(void) {

    if(!bAnalog_SPI_open){
        analog_SPI_handle=DRV_SPI_Open(DRV_SPI_INDEX_0,DRV_IO_INTENT_BLOCKING|DRV_IO_INTENT_READWRITE);
        if(analog_SPI_handle!=DRV_HANDLE_INVALID){
            
            bAnalog_SPI_open = true;
        }else{
            return false;
        }
    }
    unsigned char sendBuff[10];
    unsigned char rcvBuff[10];
    
    TRM_nCS_Clear();
    sendBuff[0] = 0x80;
    sendBuff[1] = 0b11000001;
    sendBuff[2] = 0b00110011;
    DRV_SPI_WriteReadTransfer(analog_SPI_handle,sendBuff,3,rcvBuff,3);//usgin write read to ensure read buffer is empty for next operation
    TRM_nCS_Set();
    vTaskDelay(pdMS_TO_TICKS(10));
    TRM_nCS_Clear();
    sendBuff[0] = 0;
    bool b = DRV_SPI_WriteReadTransfer(analog_SPI_handle,sendBuff,1,rcvBuff,3);
    TRM_nCS_Set();
    if((b==true)&&(rcvBuff[1]==0b11000001)&&(rcvBuff[2]==0b00110011)){
        bIs_thrm2_init = true;
        LED2_Set();
    }
    return true;
    vTaskDelay(pdMS_TO_TICKS(50));
}

/*Converts byte array received from Max31856 in to floating point number.
 
 */
static float Max31856ByteArrayToFloat(char *cp){
    cp++;
    char most=(char)*cp;
    cp++;
    char middle=(char)*cp;
    cp++;
    char lower=(char)*cp;;//Max31856 only sends 19 bits of data
    long lth2=(((long)most<<24)|(((long)middle&0x000000FF)<<16)|(((long)lower&0x000000E0)<<8));//displace everything to the left so we don't loose the sign
    float thermocouple2_temp=(float)lth2/1048576.000;
    return thermocouple2_temp;
} 




void taskThermocoupleRead(void *pvParam) {
    
    
    
    analog_state.bENIch1 = false;
    analog_state.bENIch2 = false;
    analog_state.bENrtd = false;
    analog_state.bENtc_1 = false;
    analog_state.bENtc_2 = true;
    analog_state.fIch1 = 0;
    analog_state.fIch2 = 0;
    analog_state.fJC_1 = 0;
    analog_state.fJC_2 = 0;
    analog_state.fRTD_res = 0;
    analog_state.fRTD_tmp = 0;
    analog_state.fTC_1 = 0;
    analog_state.fTC_2 = 0;
    analog_state.fVch1 = 0;
    analog_state.fVch2 = 0;
    
    TRM_nCS_Set();
    vTaskDelay(pdMS_TO_TICKS(50));
    
    
    char rBuff[24];
    char sBuff[8];


    


    
    while(true){
        
        //TODO add queue for reception of commands eg: reading temperature of internal junction compensation 
        if(!bIs_thrm2_init){//
            Thermocouple2_init();
            //TODO add error handling
        }else{
            
            BaseType_t res = xSemaphoreTake(xBinarySemaphoreTRM2dReady, pdMS_TO_TICKS(300));
            
            if(res==pdPASS){
                
                TRM_nCS_Clear();
                Nop();
                sBuff[0]=12;
                bool r = DRV_SPI_WriteReadTransfer(analog_SPI_handle, sBuff, 1, rBuff, 3);
                Nop();
                TRM_nCS_Set();

                if(r){
                    analog_state.fTC_2 = Max31856ByteArrayToFloat(rBuff);
                    xQueueSendToFront(xQueueAnalogOutput,&analog_state,0);
                    //TODO send temperature to PID and wifi controllers
                    
                }else{
                    
                    //TODO add error handling
                }
            }else{
                if(TRM_nDRDY_Get()==0){//in case the first change is not detected by the interruption
                    TRM_nCS_Clear();
                    Nop();   //adding some time for the Max31856 
                    sBuff[0]=12;
                    DRV_SPI_WriteReadTransfer(analog_SPI_handle, sBuff, 1, rBuff, 3);
                    Nop();
                    TRM_nCS_Set();

                }

                //TODO add read time expired error
            }
            //TODO add queue and logic for reception change of configuration 
        }
        
    }
    vTaskDelete(NULL);
}



