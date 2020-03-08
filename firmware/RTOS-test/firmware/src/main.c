
#include <stddef.h>                     // Defines NULL
#include <stdbool.h>                    // Defines true
#include <stdlib.h>                     // Defines EXIT_FAILURE
#include "definitions.h"                // SYS function prototypes
#include <string.h>
#include "analogFrontEnd.h"
#include "wirelessCom.h"
#include "processControl.h"

#define eADC_OFF    0
#define eADC_4WIRES 1
#define eADC_2WIRES 2
#define eADC_3WIRES 3
#define eADC_THCOUP 4


QueueHandle_t xQueueDataFrmPID;


//////TASKS////////
void taskBlink(void *pvParam){
    TickType_t xLastWakeTime;
    xLastWakeTime=xTaskGetTickCount();// solo es necesario almacenar este tiempo en esta etapa
    while(true){
        //LED1_Toggle();
        vTaskDelayUntil(&xLastWakeTime,pdMS_TO_TICKS(500));
    }
    vTaskDelete(NULL);
}




void taskButtonPolling(void *pvParam){
    bool bSW1_pres=false;


    
  

    
    
    
    while(true){
        if((SW1_Get()==0)&&(bSW1_pres==false)){
            bSW1_pres=true;
            xSemaphoreGive(xBinarySemaphoreWirelessInit);
        }
        if(SW1_Get()==1){
            bSW1_pres=false;
        }
//        if((TRM_nDRDY_Get()==0)&&(aahhhhh==false)){
//
//            TRM_nCS_Clear();
//            SPI2_WriteRead(&addr,1,tr_CRreg,3);
//            while(SPI2_IsBusy());
//            TRM_nCS_Set();
//            aahhhhh=true;
//        }
//        if(TRM_nDRDY_Get()==1){
//            aahhhhh=false;
//        }
//        vTaskDelay(pdMS_TO_TICKS(20));
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
    TMR2_Start();
    OCMP5_Enable();
    OCMP5_CompareSecondaryValueSet(0);
    GPIO_PinInterruptDisable(TRM_nDRDY_PIN);
    GPIO_PinInterruptCallbackRegister(TRM_nDRDY_PIN,TRM_dataReady_handler,0);
    GPIO_PinInterruptEnable(TRM_nDRDY_PIN);
    //TODO ADD verification of good creation of all the tasks and required resources
    
    ADC_nCS_Set();
    ADC_nRST_Set();
    ADC_STRT_Clear();
    RTD_3W_Clear();
    TRM_nCS_Set();
    
    
    
    xQueueAnalogOutput=xQueueCreate(5,sizeof(analog_data_t));
    
    
    xTaskCreate(taskBlink,  //Pointer to function
            "Blinky",       //Text name for debugging 
            128,            //Stack dept
            NULL,           //Task parameter, no used now
            2,              //priority
            NULL);          //Task handle, not used in this case
    
    xBinarySemaphoreTRM2dReady = xSemaphoreCreateBinary();
    
    if(xBinarySemaphoreTRM2dReady == NULL){
        return false; //TODO add error handling and reporting
        
    }
    
    
    
    xTaskCreate(taskButtonPolling,"button_polling",128,NULL,2,NULL);
    
    xTaskCreate(taskThermocoupleRead,"analog_frntnd",1024,NULL,5,NULL);
    
    xQueueDataFrmPID=xQueueCreate(5,sizeof(float));
    
    pidControllerInit();
    wirelessInit();
    
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

