#include "wirelessCom.h"
#include <stddef.h>
#include "analogFrontEnd.h"
#include <stdbool.h>
#include <stdlib.h> 
#include <string.h>
#include "definitions.h"  

SemaphoreHandle_t xBinarySemaphoreWirelessInit;
SemaphoreHandle_t xBinarySemaphoreWaitForAutosendPause;
QueueHandle_t xQueueAutoPCupdateEnable;
QueueHandle_t xQueueAutoPCupdateData;

DRV_HANDLE handle_uWifi;
unsigned char lastCommand = 0;
unsigned char lastParam = 0;



//Parses bytes of float in to destination char array starting at index i
static void parseFloatToByteArray(unsigned char* buff, unsigned int i, float f){
    unsigned char* fp = (unsigned char*)&f;
    unsigned char* b = buff + i;
    unsigned int c;
    for(c=0; c<4; c++){
        *b = *fp;
        fp++;
        b++;
    }
}

//clear read buffer from wireless module boot data(non thread safe and non portable adjust if changing platform)
static void clearRxBuffer(void){
    uint8_t disscard;
    while(_U1STA_URXDA_MASK == (U1STA & _U1STA_URXDA_MASK)){
        disscard=(uint8_t )(U1RXREG);
    }
}

//creates and sends PC command data package 
static void remoteCommandSend(unsigned char com, unsigned char par){        //TODO add error handling
    unsigned char sbuff[] = {REMOTE_MESSAGE_START,0,0,REMOTE_MESSAGE_END};
    sbuff[1] = com;
    sbuff[2] = par;
    DRV_USART_WriteBuffer(handle_uWifi, sbuff, 4);
}

//creates and sends data package for PC maximum 253 bytes of data
static void remoteDataPackageSend(unsigned char *dBuff, unsigned char l){
    unsigned char sendBuff[255];
    unsigned char c;
    if(l<=233){
        sendBuff[0] = REMOTE_MESSAGE_START;
        for(c=1;c<=l;c++){
            sendBuff[c] = *dBuff;
            dBuff++;
        }
        sendBuff[l+1] = REMOTE_MESSAGE_END;
        DRV_USART_WriteBuffer(handle_uWifi, sendBuff, l+2);
    }
    
}


//responds to handshake request by PC with inverted param
static void remoteHandShakeRespond(unsigned char c){
    remoteCommandSend(REMOTE_COMMAND_HADNSHAKE,~c);
}


//creates and sends data package with analog and digital io status of unit 
static void remoteSendIoStatus(io_report_t ior){
    unsigned char sB[34];
    remoteCommandSend(REMOTE_COMMAND_GETSTATE,32);
    vTaskDelay(pdMS_TO_TICKS(200));
    sB[0] = REMOTE_MESSAGE_START;
    sB[33] = REMOTE_MESSAGE_END;
    sB[1] = ior.bRelayOutput;
    sB[2] = ior.bDigitalOut1;
    sB[3] = ior.bDigitalOut2;
    parseFloatToByteArray(sB, 4, ior.fTC_1);
    sB[8] = ior.bENtc_1;
    parseFloatToByteArray(sB, 9, ior.fTC_2);
    sB[13] = ior.bENtc_2;
    parseFloatToByteArray(sB, 14, ior.fRTD_tmp);
    parseFloatToByteArray(sB, 18, ior.fRTD_res);
    sB[22] = ior.bENrtd;
    parseFloatToByteArray(sB, 23, ior.fIch1);
    sB[27] = ior.bENIch1;
    parseFloatToByteArray(sB, 28, ior.fIch2);
    sB[32] = ior.bENIch2;
    DRV_USART_WriteBuffer(handle_uWifi, sB, 34); //TODO add error handling
}

//Pauses automatic send and waits for confirmation
static void autoSendPause(void){
    bool b=true;
    BaseType_t rs = xQueueSendToBack(xBinarySemaphoreWaitForAutosendPause,&b,0);
    BaseType_t r = xSemaphoreTake(xBinarySemaphoreTRM2dReady, pdMS_TO_TICKS(100));
    //TODO add error handling
    
}

static void autoSendUnpause(void){
    bool b=false;
    BaseType_t rs = xQueueSendToBack(xBinarySemaphoreWaitForAutosendPause,&b,0);
    BaseType_t r = xSemaphoreTake(xBinarySemaphoreTRM2dReady, pdMS_TO_TICKS(100));
    //TODO add error handling
}


//Command reception processor 
static bool commandReceived(unsigned char* b){
    b+=1;
    unsigned char command = *b;
    b+=1;
    unsigned char param = *b;
    switch (command){
        case REMOTE_COMMAND_HADNSHAKE:
            autoSendPause();
            remoteHandShakeRespond(param);
            autoSendUnpause();
            break;
        case REMOTE_COMMAND_GETSTATE:
            
            break;
        case REMOTE_COMMAND_REFLOWSTATE:
            
            break;
        case REMOTE_COMMAND_REFLOWSTART:
            
            break;
        case REMOTE_COMMAND_REFLOWEND:
            
            break;
        default:
            return false;
    }
}

//Data package processor used to write the proper variable
static bool dataPackageReceived(unsigned char* b){
    
}



static bool wifiModuleInit(void){
    char sndBuff[10];
    char rcvBuff[200];
    sprintf(sndBuff,"AT\r\n");         
        DRV_USART_WriteBuffer(handle_uWifi,sndBuff,strlen(sndBuff));
        vTaskDelay(pdMS_TO_TICKS(1000));

        BaseType_t semBtn;
        semBtn=xSemaphoreTake(xBinarySemaphoreWirelessInit,portMAX_DELAY); //wait until buton is presed
        if(semBtn==pdPASS){
            sprintf(sndBuff,"AT+CIPSTART=\"TCP\",\"192.168.1.104\",100\r\n");         //ESP module as BT server
            DRV_USART_WriteBuffer(handle_uWifi,sndBuff,strlen(sndBuff));
            vTaskDelay(pdMS_TO_TICKS(1000));
            sprintf(sndBuff,"AT+CIPMODE=1\r\n");         //
            DRV_USART_WriteBuffer(handle_uWifi,sndBuff,strlen(sndBuff));
            vTaskDelay(pdMS_TO_TICKS(500));
            sprintf(sndBuff,"AT+CIPSEND\r\n");
            DRV_USART_WriteBuffer(handle_uWifi,sndBuff,strlen(sndBuff));
            vTaskDelay(pdMS_TO_TICKS(1500));
            clearRxBuffer();
            
            return true; //TODO add actual checking of correct connection

        }else{
            return false;
        }
}



void taskWireless(void *pvParam){
    
    bool bIsPortOpen=false;
    bool bWifi_nBLE=true; //WiFi mode preselected contemplate configuration using pvParam
    bool bWireless_rdy=false;
    bool bWireless_cnctd=false;
    bool bWTX_nRX=false;//variable to tell event handler which process was running, reception as default state
    
    char sndBuff[50];
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
            
            clearRxBuffer();

            if(bWifi_nBLE){     //WiFi setup
                bool b = wifiModuleInit();
                if (b){
                    bWireless_rdy=true;
                    bWireless_cnctd=true;
                }
            }else{              //BLE setup
                
            }
        }

        if(bWireless_cnctd){
            //DRV_USART_ReadBuffer(handle_uWifi,rcvBuff,1);
            analog_data_t analogToPrint;
            
            BaseType_t statAnRec = xQueueReceive(xQueueAnalogOutput,&analogToPrint,pdMS_TO_TICKS(1500));
            
            if(statAnRec==pdPASS){
                sprintf(sndBuff,"Temperatura: %f\r\n",(double)analogToPrint.fTC_2);
            }else if(statAnRec==errQUEUE_EMPTY){
                sprintf(sndBuff,"Sin Datos!!!\r\n");
            }
            
            
            DRV_USART_WriteBuffer(handle_uWifi,sndBuff,strlen(sndBuff));
            
        }
        
        
    }
    vTaskDelete(NULL);
}

void taskPeriodicReport(void *pvParam){
    bool paused = true;
    bool pause  = true;
    io_report_t rep;
    
    while(true){
        
        if(!paused){
            //TODO send current status of device, PID task will send the data
            
            BaseType_t ar = xQueueReceive(xQueueAutoPCupdateData,&rep,pdMS_TO_TICKS(1000));
            if(ar==pdPASS){
                 remoteSendIoStatus(rep);
            }else{
                //TODO error report
            }
            
        }
        BaseType_t r = xQueueReceive(xQueueAutoPCupdateEnable,&pause,pdMS_TO_TICKS(5));
        if(r==pdPASS){
            paused = pause;
            xSemaphoreGive(xBinarySemaphoreWaitForAutosendPause);
        }
    }
    
}
