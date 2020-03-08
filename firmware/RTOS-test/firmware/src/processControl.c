
#include "processControl.h"
#include "wirelessCom.h"
#include <stddef.h>
#include "analogFrontEnd.h"
#include <stdbool.h>
#include <stdlib.h> 
#include <string.h>
#include "definitions.h"  
#include <math.h>

QueueHandle_t xQueueProcessComands;      
QueueHandle_t xQueueProcessFeedback;     
QueueHandle_t xQueuePIDControll;         
QueueHandle_t xQueuePIDState;
QueueHandle_t xQueueAutoPCupdateData;
QueueHandle_t xQueueDataFrmPID;
float prueba =0;
float setPoint = 32.00;
analog_data_t anDT;
io_report_t repA;
process_cmnd_t command_PID;
pid_cmnd_t  pidCommand_PID;

pid_cmnd_t pid_command;
process_cmnd_t  process_command;

bool isProcessRunning = false;
process_cmnd_t  runningProcess;  


uint32_t deriv=0;
float err=0;
float err_prev=0;
uint32_t integral=0;

uint32_t kp = 800;
uint32_t ki = 0;
uint32_t kd = 0;
uint32_t pInterval = 2;

uint32_t az=0;


uint32_t PID_output=0;

int pidControllerInit(void){
    
    xQueueProcessComands = xQueueCreate(5,sizeof(process_cmnd_t));
    xQueueProcessFeedback = xQueueCreate(5,sizeof(process_cmnd_t));
    xQueuePIDControll = xQueueCreate(5,sizeof(pid_cmnd_t));

    
    xTaskCreate(taskPID,"pid",2048,NULL,4,NULL);
    xTaskCreate(taskProcessControl,"process_c",512,NULL,3,NULL);
    
    return 1; //TODO add error report
}


//
//static int commandProcessor(process_cmnd_t c){
//    
//    return 1;
//}



void taskPID(void *pvParam) {
    bool bPidEN=false;
 
    TickType_t xLastWakeTPID;






    xLastWakeTPID = xTaskGetTickCount();
    while(true){

                                                  //Read the whole queue of data max wait of 500 ms
        BaseType_t statAnRec = xQueueReceive(xQueueAnalogOutput,&anDT,pdMS_TO_TICKS(100)); 
        if(statAnRec==pdPASS){
            LED2_Toggle();
            //prueba=anDT.fTC_2;
            if(anDT.fTC_2>=setPoint){
                RLY3_Set();
            }else{
                RLY3_Clear();
            }
            
            if(bPidEN==true){
                err=setPoint-anDT.fTC_2;
                deriv=(err-err_prev)*2;
                PID_output = kp*err+integral*ki;
                err_prev=err;
                if(PID_output<193360){
                    integral+=err/2;
                }else{
                    PID_output = 193361;
                }
                if(PID_output<0){
                    PID_output=0;
                }
                az = PID_output;
                OCMP5_CompareSecondaryValueSet(PID_output);
                prueba=az;
                
            }
            
            
            
            

            //TODO add averaging of all sensor data   
            BaseType_t nn = xQueueSend(xQueueDataFrmPID,&prueba,pdMS_TO_TICKS(1));
            if(nn==pdPASS){
                //LED1_Toggle();
            }
            //TODO add checkup for full queue
        }else{
            
        }


        //TODO ADD averaging function
        
        //Check for command
        BaseType_t statCmdRec = xQueueReceive(xQueuePIDControll,&pidCommand_PID,pdMS_TO_TICKS(5)); 
        if(statCmdRec==pdPASS){
            switch(pidCommand_PID.state){
                case PID_ENABLE:
                    TMR2_Start();
                    OCMP5_Enable();
                    setPoint=220.00;
                    //OCMP5_CompareSecondaryValueSet(64453);
                    //setPoint=pidCommand_PID.temperature;
                    bPidEN=true;
                    break;
                case PID_DISABLE:
                    TMR2_Stop();
                    OCMP5_Disable();
                    OCMP5_CompareSecondaryValueSet(0);
                    setPoint=0;
                    bPidEN=false;
                    deriv=0;
                    err=0;
                    err_prev=0;
                    integral=0;
                    break;
            }
        }

        
        //TODO read command queue
        
        vTaskDelayUntil(&xLastWakeTPID,pdMS_TO_TICKS(500));
    }
    vTaskDelete(NULL);
}


void taskProcessControl(void *pvParam) {

        
    TickType_t xLastWakeT;
    xLastWakeT = xTaskGetTickCount();
    
           //used for storing current running process and temperatures
    runningProcess.cmnd=PROCESS_STATE_IDLE;
    
    //disable PID driver
    pid_command.state = PID_DISABLE;
    pid_command.temperature = 0;
    xQueueSendToBack(xQueuePIDControll,&pid_command,0);    
    
    while(true){
        //look for instructions
        BaseType_t statAnRec = xQueueReceive(xQueueProcessComands,&process_command,pdMS_TO_TICKS(15));
        if(statAnRec==pdPASS){
            switch (process_command.cmnd){
                case PROCESS_CMND_FIXEDTEMP_START:
                    //TODO add copy of current command
                    pid_command.state = PID_DISABLE;
                    pid_command.temperature = 0;
                    xQueueSendToBack(xQueuePIDControll,&pid_command,0); 
                    break;
                case PROCESS_CMND_REFLOW_START:
                    pid_command.state = PID_ENABLE;
                    pid_command.temperature = 220;
                    xQueueSendToBack(xQueuePIDControll,&pid_command,0);
                    break;
                case PROCESS_CMND_STOP:
                    pid_command.state = PID_DISABLE;
                    pid_command.temperature = 220;
                    xQueueSendToBack(xQueuePIDControll,&pid_command,0);
                    break;
            }
            //TODO command process
        }else{
            //TODO see if it's needed to do something if no command is received for toolong
        }
        if(isProcessRunning){
            //TODO run state machine for the process
        }else{
            
        }
        
        vTaskDelayUntil(&xLastWakeT,pdMS_TO_TICKS(250));
    }
    vTaskDelete(NULL);
}

