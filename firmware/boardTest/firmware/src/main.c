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

// *****************************************************************************
// *****************************************************************************
// Section: Main Entry Point
// *****************************************************************************
// *****************************************************************************

static bool volatile bLED=false;
static bool volatile bWir_stp=false;
static bool volatile bWir_en=false;
static bool volatile bSwitch=false;
static bool volatile bjunct=false;

bool sw1_press=false;
bool sw2_press=false;
bool sw3_press=false;
bool sw4_press=false;
bool junct_en=false;

bool w_cnctd=false;

char tmp_rcvbuff[2];
unsigned char tmp_sndbuff[4];
char th_rcvbuff[10];

static unsigned int volatile  t_count=0;
static unsigned int volatile  wt_count=0;
static unsigned int volatile  t_delay=0;
static unsigned int volatile  t_junct=0;

void T2_TimerInterrupHandler(uintptr_t status, uintptr_t context){
    t_count++;
    wt_count++;
    t_delay++;
    t_junct++;
    if(t_junct>=500){
        bjunct=true;
        t_junct=0;
    }
    
    if(t_delay>4000000) t_delay=0;
    if(t_count>=25){
        bLED=true;
        t_count=0;
    }
    if(wt_count>=25){
        bWir_stp=true;
        wt_count=0;
    }

    bSwitch=true;
}

void wait_ms(unsigned int t){
    t_delay=0;
    while(t_delay<t);
}

int main ( void )
{
    /* Initialize all modules */
    SYS_Initialize ( NULL );
    char buff[100];
    long eadc_resAcu=0;
    int eadc_count=0;
    RLY3_Clear();
    
    TMR2_CallbackRegister(T2_TimerInterrupHandler,(uintptr_t)NULL);
    
    W_BOOT_Set();
    W_EN_Set();
    
    ADC_nRST_Clear();
    ADC_nCS_Set();
    ADC_STRT_Clear();
    
    TMR2_Start();
    bool therm_en=false;
    bool wifi_connected=false;
    
    unsigned char w_stp= 0;
    
    while ( true )
    {
        if(bjunct&&wifi_connected){
            tmp_sndbuff[0]=0;
            I2C4_Write(0b1001000,tmp_sndbuff,1);
            while(I2C4_IsBusy());
            I2C4_Read(0b1001000,(__uint8_t*)tmp_rcvbuff,2);
            while(I2C4_IsBusy());
            
            short c = (((short)tmp_rcvbuff[0]) << 8) | (0x00ff & tmp_rcvbuff[1]);
            double temperature=(double)c/256.000;
            
            sprintf(buff,"Temperatura: %3.2f C\r\n",temperature);
            UART1_Write(buff,strlen(buff));
            while(UART1_WriteIsBusy());
            
            bjunct=false;
        }
        
        if(ADC_DRDY_Get()==0 && wifi_connected){
            ADC_nCS_Clear();
            unsigned char eadc_rdata=0b00010010;
            char eadc_results[6];
            SPI2_WriteRead(&eadc_rdata,1,eadc_results,3);
            while(SPI2_IsBusy());
            ADC_nCS_Set();
            
            long eadc_res=(((long)eadc_results[1]<<24)|(((long)eadc_results[2]&0x000000FF)<<16)|(((long)eadc_results[3]&0x000000FF)<<8));
            eadc_res=eadc_res/256;
            
            if(eadc_count<20){
                eadc_resAcu+=eadc_res;
                eadc_count++;
            }else{
                double volts=((double)eadc_resAcu)/2.0000000*0.000000149250030518;
                sprintf(buff,"ADC RAW=%li\r\nVoltaje= %4.2f mV\r\n",eadc_res,volts);
                UART1_Write(buff,strlen(buff));
                while(UART1_WriteIsBusy());
                eadc_count=0;
            }

            
        }
        
        if(TRM_nDRDY_Get()==0 && therm_en && wifi_connected){
            unsigned char th_temp_addr=0xA;
            TRM_nCS_Clear();
            SPI2_WriteRead(&th_temp_addr,1,th_rcvbuff,6);
            
            while(SPI2_IsBusy());
            TRM_nCS_Set();
            short tj = (((short)th_rcvbuff[1]) << 8) | (0x00ff & th_rcvbuff[2]);
            double tjp=(double)tj/256.000;
            
            //th_rcvbuff[3]=0b01101100;
            //th_rcvbuff[4]=0b11110000;
            //th_rcvbuff[5]=0b10111101;
            
            long ttth=(((long)th_rcvbuff[3]<<24)|(((long)th_rcvbuff[4]&0x000000FF)<<16)|(((long)th_rcvbuff[5]&0x000000E0)<<8));
            double thermocouple2_temp=(double)ttth/1048576.000;
            //sprintf(buff,"recibido: %i C\r\n",th);
            sprintf(buff,"recibido:\r\nJunction Temp: %3.2f\r\nThermocouple2 Temp: %4.2f\r\nByte2 :%i\r\nByte3 :%i\r\n",tjp,thermocouple2_temp,th_rcvbuff[4],th_rcvbuff[5]);
            UART1_Write(buff,strlen(buff));
            while(UART1_WriteIsBusy());
        }
        
        
        if(bSwitch){
            bSwitch=false;
            if(SW1_Get()==0&&!sw1_press){
                sw1_press=true;
                w_stp=0;
                bWir_en=true;
                LED1_Set();
                unsigned char eadc_sdatac=0b00010110;
                unsigned char eadc_config[]={0b01000000,0b00000011,0b00011010,0b00000000,0b00110000,0b01010010};
                unsigned char eadc_sync[]={0b00000100,0b00000100};
                ADC_nRST_Set();//release adc from reset 
                wait_ms(1);
                ADC_nCS_Clear();
                SPI2_Write(&eadc_sdatac,1);
                while(SPI2_IsBusy());
                SPI2_Write(eadc_config,6);
                while(SPI2_IsBusy());
                wait_ms(1);
                SPI2_Write(eadc_sync,2);
                while(SPI2_IsBusy());
                ADC_nCS_Set();
                ADC_STRT_Set();
                
//                unsigned char tr_CRreg[]={0x80,0b10010001,0b00100011}; //Configuration bits fo max31856
//                
//                TRM_nCS_Clear();
//                SPI2_Write(tr_CRreg,3);
//                while(SPI2_IsBusy());
//                TRM_nCS_Set();
                
                
            }else if(SW1_Get()==1){
                sw1_press=false;
            }
            if(SW2_Get()==0&&!sw2_press){
                
//                if(therm_en) therm_en=false;
//                else therm_en=true;
                
                sw2_press=true;
                LED2_Toggle();
//                tmp_sndbuff[0]=0;
//                I2C4_Write(0b1001000,tmp_sndbuff,1);
//                
//                while(I2C4_IsBusy());
//                I2C4_Read(0b1001000,(__uint8_t*)tmp_rcvbuff,2);
//                while(I2C4_IsBusy());
                
//                short c = (((short)tmp_rcvbuff[0]) << 8) | (0x00ff & tmp_rcvbuff[1]);
//                double temperature=(double)c/256.000;
//                
                //sprintf(buff,"Byte 1= %i Byte 2= %i\r\n",tmp_rcvbuff[0],c);
//                sprintf(buff,"Temperatura: %3.2f C\r\n",temperature);
//                UART1_Write(buff,strlen(buff));
//                while(UART1_WriteIsBusy());
                
                
                
                
                if(TRM_nDRDY_Get()==0){
//                    unsigned char th_temp_addr=12;
//                    TRM_nCS_Clear();
//                    SPI2_WriteRead(&th_temp_addr,1,th_rcvbuff,3);
//                    while(SPI2_IsBusy());
//                    TRM_nCS_Set();
//                    short th = (((short)th_rcvbuff[0]) << 8) | (0x00ff & th_rcvbuff[1]);
//                    sprintf(buff,"recibido: %i C\r\n",th);
//                    UART1_Write(buff,strlen(buff));
                    
                    
                }else{
                    sprintf(buff,"Sin lectura!!\r\n");
                    UART1_Write(buff,strlen(buff));
                }

            }else if(SW2_Get()==1){
                sw2_press=false;
            }
            if(SW3_Get()==0&&!sw3_press){
                sw3_press=true;
                sprintf(buff,"+++");
                UART1_Write(buff,strlen(buff));
                while(UART1_WriteIsBusy());

            }else if(SW3_Get()==1){
                sw3_press=false;
                
            }
            if(SW4_Get()==0&&!sw4_press){
                sw4_press=true;
                w_stp=4;
                bWir_en=true;
            }else if(SW4_Get()==1){
                sw4_press=false;
            }

        }
        if(bWir_stp&&bWir_en){
            bWir_stp=false;
            switch(w_stp){
                case 0:
                    sprintf(buff,"AT\r\n");         
                    UART1_Write(buff,strlen(buff));
                    break;
                case 1:
                    sprintf(buff,"AT+CIPSTART=\"TCP\",\"192.168.1.104\",100\r\n");         //ESP module as BT server
                    UART1_Write(buff,strlen(buff));
                    break;
                case 2:
                    sprintf(buff,"AT+CIPMODE=1\r\n");         //
                    UART1_Write(buff,strlen(buff));
                    break;
                case 3:
                    sprintf(buff,"AT+CIPSEND\r\n");
                    
                    UART1_Write(buff,strlen(buff));
                    while(UART1_WriteIsBusy());
                    wait_ms(1000);
                    wifi_connected=true;
                    bWir_en=false;
                    break;
                case 4:
                    sprintf(buff,"AT+CIPMODE=0\r\n");
                    UART1_Write(buff,strlen(buff));
                    break;
                case 5:
                    sprintf(buff,"AT+CIPCLOSE\r\n");
                    UART1_Write(buff,strlen(buff));
                    bWir_en=false;
                    break;
                    
//                case 4:
//                    sprintf(buff,"YEIIIII\r\n");         //
//                    UART1_Write(buff,strlen(buff));
//                    
//                    break;  
//                case 0:
//                    sprintf(buff,"AT\r\n");         //ESP module as BT server
//                    UART1_Write(buff,strlen(buff));
//                    break;
//                case 1:
//                    sprintf(buff,"AT+CWMODE=1\r\n");
//                    UART1_Write(buff,strlen(buff));
//                    break;
//                case 2:
//                    sprintf(buff,"AT+CWJAP=\"TPA\",\"AyF141211\"\r\n");
//                    UART1_Write(buff,strlen(buff));
//                    bWir_en=false;
//                    break;
//                case 0:
//                    sprintf(buff,"AT\r\n");         //ESP module as BT server
//                    UART1_Write(buff,strlen(buff));
//                    break;
//                case 1:
//                    sprintf(buff,"AT+CWMODE=3\r\n");
//                    UART1_Write(buff,strlen(buff));
//                    break;
//                case 2:
//                    sprintf(buff,"AT+CWSAP=\"VC-ROVEN\",\"Umakerspace\",1,4\r\n");    //Create services
//                    UART1_Write(buff,strlen(buff));
//                    bWir_en=false;
//                    break;
//                case 3:
//                    printf("AT+BLEADVDATA=\"0201060B09457370726573736966030302A0\"\r\n");     //
//                    break;
//                case 4:
//                    printf("AT+BLEADVSTART\r\n");     //
//                    
//                    break;
            }
            w_stp++;
        }
        if(bLED){
            bLED = false;
            
        }
        /* Maintain state machines of all polled MPLAB Harmony modules. */
        SYS_Tasks ();
    }

    /* Execution should not come here during normal operation */

    return ( EXIT_FAILURE );
}


/*******************************************************************************
 End of File
*/

