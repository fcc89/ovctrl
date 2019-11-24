/*******************************************************************************
  Main Source File

  Company:
    Microchip Technology Inc.

  File Name:
    main.c

  Summary:
    This file contains the "main" function for a project.

  Description:
    This file contains the "main" function for a project.  The
    "main" function calls the "SYS_Initialize" function to initialize the state
    machines of all modules in the system
 *******************************************************************************/

// *****************************************************************************
// *****************************************************************************
// Section: Included Files
// *****************************************************************************
// *****************************************************************************

#include <stddef.h>                     // Defines NULL
#include <stdbool.h>                    // Defines true
#include <stdlib.h>                     // Defines EXIT_FAILURE
#include "definitions.h"                // SYS function prototypes
#include <string.h>

#define eADC_OFF    0
#define eADC_4WIRES 1
#define eADC_2WIRES 2
#define eADC_3WIRES 3
#define eADC_THCOUP 4


SemaphoreHandle_t xBinarySemaphore;
QueueHandle_t xQueueAnalogOutput;

struct AnalogData {
    double  dTC_1;      //temperature thermocouple 1 (read by ADC)
    double  dTC_2;      //temperature thermocouple 2 (read by MAX31856)
    double  dJC_1;      //junction temperature for thermocouple 1 read by TMP112AIDRLT
    double  dJC_2;      //junction temperature for thermocouple 2 (internal MAX31856)
    double  dRTD_tmp;   //rtd reading in celcius
    double  dRTD_res;   //rtd reading in ohms
    double  dIch1;      //Current in mA channel 1
    double  dIch2;      //Current in mA channel 2
    double  dVch1;      //Voltage across shunt channel 1
    double  dVch2;      //Voltage across shunt channel 2
    bool    bENtc_1;    //Is Thermocouple 1 enabled?
    bool    bENtc_2;    //Is thermocouple 2 enabled?
    bool    bENrtd;     //Is RTD enabled
    //TODO consider to add a time stamp
};


//////TASKS////////
void taskBlink(void *pvParam){
    TickType_t xLastWakeTime;
    xLastWakeTime=xTaskGetTickCount();// solo es necesario almacenar este tiempo en esta etapa
    while(true){
        LED1_Toggle();
        vTaskDelayUntil(&xLastWakeTime,pdMS_TO_TICKS(500));
    }
    vTaskDelete(NULL);
}


void taskWireless(void *pvParam){
    DRV_HANDLE handle_uWifi;
    bool bIsPortOpen=false;
    bool bWifi_nBLE=true; //WiFi mode preselected contemplate configuration using pvParam
    bool bWireless_rdy=false;
    bool bWireless_cnctd=false;
    bool bWTX_nRX=false;//variable to tell event handler which process was running, reception as default state
    
    char sndBuff[500];
    char rcvBuff[500];
    
    handle_uWifi=DRV_USART_Open(DRV_USART_INDEX_0, DRV_IO_INTENT_READWRITE);
    if(handle_uWifi==DRV_HANDLE_INVALID){
        
        
        //TODO report error
    }else{
        
        bIsPortOpen=true;
    }
    
        
    DRV_USART_BUFFER_HANDLE sendBufferHandle;
    
    while(true){
        if(!bIsPortOpen){
            handle_uWifi=DRV_USART_Open(DRV_USART_INDEX_0, DRV_IO_INTENT_EXCLUSIVE|DRV_IO_INTENT_NONBLOCKING|DRV_IO_INTENT_READWRITE);
            if(handle_uWifi==DRV_HANDLE_INVALID){
                //TODO report error
                
            }else{
                
                bIsPortOpen=true;
            }
        }
        
        if(bIsPortOpen&&(!bWireless_rdy)){
            W_BOOT_Set();
            W_EN_Set();
            vTaskDelay(pdMS_TO_TICKS(4000)); //allow wireless module to boot
            /////////clear read buffer from wireless module boot data(non thread safe and non portable adjust if changing platform)
            uint8_t disscard;
            while(_U1STA_URXDA_MASK == (U1STA & _U1STA_URXDA_MASK)){
                disscard=(uint8_t )(U1RXREG);
            }
            /////////
            
            if(bWifi_nBLE){     //WiFi setup
                
                
               
                sprintf(sndBuff,"AT\r\n");         
                DRV_USART_WriteBuffer(handle_uWifi,sndBuff,strlen(sndBuff));
                vTaskDelay(pdMS_TO_TICKS(1000));
                
                BaseType_t semBtn;
                semBtn=xSemaphoreTake(xBinarySemaphore,portMAX_DELAY); //wait until buton is presed
                if(semBtn==pdPASS){
                    sprintf(sndBuff,"AT+CIPSTART=\"TCP\",\"192.168.1.104\",100\r\n");         //ESP module as BT server
                    DRV_USART_WriteBuffer(handle_uWifi,sndBuff,strlen(sndBuff));
                    vTaskDelay(pdMS_TO_TICKS(1000));
                    LED2_Set();
                    sprintf(sndBuff,"AT+CIPMODE=1\r\n");         //
                    DRV_USART_WriteBuffer(handle_uWifi,sndBuff,strlen(sndBuff));
                    vTaskDelay(pdMS_TO_TICKS(500));
                    sprintf(sndBuff,"AT+CIPSEND\r\n");
                    DRV_USART_WriteBuffer(handle_uWifi,sndBuff,strlen(sndBuff));
                    vTaskDelay(pdMS_TO_TICKS(1500));
                    bWireless_rdy=true;
                    bWireless_cnctd=true;
                    
                    
                }else{
                    
                }
                
            }else{              //BLE setup
                
            }
        }

        
        if(bWireless_cnctd){
            //DRV_USART_ReadBuffer(handle_uWifi,rcvBuff,1);
            struct AnalogData analogToPrint;
            
            BaseType_t statAnRec = xQueueReceive(xQueueAnalogOutput,&analogToPrint,pdMS_TO_TICKS(1500));
            
            if(statAnRec==pdPASS){
                sprintf(sndBuff,"Byte1: %f\r\nByte2: %f\r\nByte3: %f\r\nByte4: %f\r\n",analogToPrint.dIch1,analogToPrint.dIch2,analogToPrint.dJC_1,analogToPrint.dJC_2);
            }else if(statAnRec==errQUEUE_EMPTY){
                sprintf(sndBuff,"Sin Datos!!!\r\n");
            }
            
            
            DRV_USART_WriteBuffer(handle_uWifi,sndBuff,strlen(sndBuff));
            
        }
        
        
    }
    vTaskDelete(NULL);
}


void taskAnalogGet(void *pvParam){
    
    bool bEADC_EN=false;
    bool bfirst_rcvd=false;
    unsigned int iSampleCount=0;
    char eADC_SDATAC=0x16;
    char eADC_gSettings[]={0x40,0x03,0b00001000,0b00000000,0b00110011,0b00000010};
    char eADC_IDAC[]={0x2A,0x01,0b00000100,0b10001100};
    char eADC_sync[]={0x04,0x04};
    char eADC_RDATA=0x12;
    char eADC_RDATAC=0x15;
    char eADC_RREG[]={0x20,0x03};
    char eADC_RESET=0x06;
    DRV_HANDLE AN_SPI_handle=DRV_SPI_Open(DRV_SPI_INDEX_0,DRV_IO_INTENT_BLOCKING|DRV_IO_INTENT_READWRITE);
    char eADC_rcvBuff[]={0,0,0,0,0,0,0};
    
    
    
    struct AnalogData SampleData;
    SampleData.bENrtd=false;
    SampleData.bENtc_1=false;
    SampleData.bENtc_2=false;
    SampleData.dIch1=0;
    SampleData.dIch2=0;
    SampleData.dJC_1=0;
    SampleData.dJC_2=0;
    SampleData.dRTD_res=0;
    SampleData.dRTD_tmp=0;
    SampleData.dTC_1=0;
    SampleData.dTC_2=0;
    SampleData.dVch1=0;
    SampleData.dVch2=0;
    while(true){
        if(!bEADC_EN){
            vTaskDelay(pdMS_TO_TICKS(16));
            ADC_nCS_Set();
            ADC_STRT_Set();
            ADC_nRST_Set(); //release ADC from reset 
            vTaskDelay(pdMS_TO_TICKS(30));
            ADC_nCS_Clear();
            DRV_SPI_WriteTransfer(AN_SPI_handle,&eADC_RESET,1);
            vTaskDelay(pdMS_TO_TICKS(10));
            DRV_SPI_WriteTransfer(AN_SPI_handle,&eADC_SDATAC,1);
            vTaskDelay(pdMS_TO_TICKS(1));
            DRV_SPI_WriteTransfer(AN_SPI_handle,eADC_gSettings,6);
            vTaskDelay(pdMS_TO_TICKS(1));
            //DRV_SPI_WriteTransfer(AN_SPI_handle,eADC_IDAC,4);
            vTaskDelay(pdMS_TO_TICKS(1));
            DRV_SPI_WriteTransfer(AN_SPI_handle,eADC_sync,2);
            vTaskDelay(pdMS_TO_TICKS(1));
            ADC_nCS_Set();
            
            
            
            bEADC_EN=true;
        }else{
            if(ADC_DRDY_Get()==0){
                if(iSampleCount<20){
                    if(bfirst_rcvd){
                        ADC_nCS_Clear();
                        DRV_SPI_ReadTransfer(AN_SPI_handle,eADC_rcvBuff,4);
                        //DRV_SPI_WriteReadTransfer(AN_SPI_handle,eADC_RREG,2,eADC_rcvBuff,6);
                        vTaskDelay(pdMS_TO_TICKS(1));
                        ADC_nCS_Set();
                        iSampleCount++;
                    }else{
                        ADC_nCS_Clear();
                        DRV_SPI_WriteTransfer(AN_SPI_handle,&eADC_RDATAC,1);
                        
                        bfirst_rcvd=true;
                        vTaskDelay(pdMS_TO_TICKS(1));
                        ADC_nCS_Set();
                    }
                    
                }else{
                    LED2_Toggle();
                    //promediar valores
                    iSampleCount=0;
                    SampleData.dIch1=(double)eADC_rcvBuff[0];
                    SampleData.dIch2=(double)eADC_rcvBuff[1];
                    SampleData.dJC_1=(double)eADC_rcvBuff[2];
                    SampleData.dJC_2=(double)eADC_rcvBuff[3];
                    BaseType_t resSend = xQueueSendToBack(xQueueAnalogOutput,&SampleData,0);
                }
            }
        }
        
        
        
        
        vTaskDelay(pdMS_TO_TICKS(20));
    }
    vTaskDelete(NULL);
}

void taskButtonPolling(void *pvParam){
    bool bSW1_pres=false;
    bool bSW2_pres=false;
    bool bSW3_pres=false;
    bool bSW4_pres=false;
    while(true){
        if(!SW1_Get()&&!bSW1_pres){
            bSW1_pres=1;
            xSemaphoreGive(xBinarySemaphore);
        }
        if(SW1_Get()==false){
            bSW1_pres=false;
        }
        
        vTaskDelay(pdMS_TO_TICKS(20));
    }
}

// *****************************************************************************
// *****************************************************************************
// Section: Main Entry Point
// *****************************************************************************
// *****************************************************************************

int main ( void )
{
    /* Initialize all modules */
    SYS_Initialize ( NULL );
    
    
    //TODO ADD verification of good creation of all the tasks and required resources
    
    ADC_nCS_Set();
    ADC_nRST_Clear();
    ADC_STRT_Clear();
    RTD_3W_Clear();
    
    xBinarySemaphore = xSemaphoreCreateBinary();
    
    xQueueAnalogOutput=xQueueCreate(5,sizeof(struct AnalogData));
    
    xTaskCreate(taskBlink,  //Pointer to function
            "Blinky",       //Text name for debugging 
            128,            //Stack dept
            NULL,           //Task parameter, no used now
            2,              //priority
            NULL);          //Task handle, not used in this case
    
    xTaskCreate(taskWireless,"wifi_Man",1500,NULL,3,NULL);
    
    xTaskCreate(taskButtonPolling,"button_polling",120,NULL,3,NULL);
    
    xTaskCreate(taskAnalogGet,"Analog_frontend",1000,NULL,4,NULL);
    
    while ( true )
    {
        /* Maintain state machines of all polled MPLAB Harmony modules. */
        SYS_Tasks ( );
    }

    /* Execution should not come here during normal operation */

    return ( EXIT_FAILURE );
}


/*******************************************************************************
 End of File
*/

