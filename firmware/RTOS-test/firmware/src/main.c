
#include <stddef.h>                     // Defines NULL
#include <stdbool.h>                    // Defines true
#include <stdlib.h>                     // Defines EXIT_FAILURE
#include "definitions.h"                // SYS function prototypes
#include <string.h>
#include "analogFrontEnd.h"
#include "wirelessCom.h"


#define eADC_OFF    0
#define eADC_4WIRES 1
#define eADC_2WIRES 2
#define eADC_3WIRES 3
#define eADC_THCOUP 4





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




void taskButtonPolling(void *pvParam){
    bool bSW1_pres=false;
    bool bSW2_pres=false;
    bool bSW3_pres=false;
    bool bSW4_pres=false;
    while(true){
        if(!SW1_Get()&&!bSW1_pres){
            bSW1_pres=1;
            xSemaphoreGive(xBinarySemaphoreWirelessInit);
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
    ADC_nRST_Set();
    ADC_STRT_Clear();
    RTD_3W_Clear();
    TRM_nCS_Set();
    
    
    xBinarySemaphoreWirelessInit = xSemaphoreCreateBinary();
    xBinarySemaphoreWaitForAutosendPause = xSemaphoreCreateBinary();
    
    xQueueAnalogOutput=xQueueCreate(5,sizeof(analog_data_t));
    xQueueAutoPCupdateEnable=xQueueCreate(5,sizeof(bool));
    xQueueAutoPCupdateData=xQueueCreate(5,sizeof(io_report_t));
    
    xTaskCreate(taskBlink,  //Pointer to function
            "Blinky",       //Text name for debugging 
            128,            //Stack dept
            NULL,           //Task parameter, no used now
            2,              //priority
            NULL);          //Task handle, not used in this case
    
    xTaskCreate(taskWireless,"wifi_Man",1500,NULL,3,NULL);
    
    xTaskCreate(taskButtonPolling,"button_polling",120,NULL,3,NULL);
    
    xTaskCreate(taskThermocoupleRead,"Analog_frontend",1500,NULL,4,NULL);
    
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

