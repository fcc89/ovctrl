
#include "processControl.h"
#include "wirelessCom.h"
#include <stddef.h>
#include "analogFrontEnd.h"
#include <stdbool.h>
#include <stdlib.h> 
#include <string.h>
#include "definitions.h"  


void taskPID(void *pvParam) {
    bool bPidEN=false;
    TickType_t xLastWakeT;
    BaseType_t statAnRec;
    process_cmnd_t command;
    
    analog_data_t analogData;
    unsigned int readQueue = 0;
    unsigned int itemsRead = 0;
    analog_data_t anDataBuff[20];
    
    
    
    xLastWakeT = xTaskGetTickCount();
    while(true){
        readQueue = 1;
        itemsRead = 0;
        while(readQueue==1){                                                    //Read the whole queue of data max wait of 500 ms
            BaseType_t statAnRec = xQueueReceive(xQueueAnalogOutput,&analogData,pdMS_TO_TICKS(5)); 
            if(statAnRec==pdPASS){
                anDataBuff[itemsRead]=analogData;
            }else{
                readQueue=0;
            }
        }
        if(itemsRead>0){
            //TODO ADD averaging function
            //TODO send data to PID controller
        }else{
            //TODO check and report problem 
        }
        
        //TODO read command queue
        //Check if controller is running to avoid commands outside state machine requisites
        //TODO if valid command received send it to PID controller

        if(bPidEN){
            //TODO run routines 
            
            
            
        }
        
        
        
        vTaskDelayUntil(&xLastWakeT,pdMS_TO_TICKS(500));
    }
    vTaskDelete(NULL);
}


void taskProcessControl(void *pvParam) {
    

    
    while(true){

        
        
    }
    vTaskDelete(NULL);
}

