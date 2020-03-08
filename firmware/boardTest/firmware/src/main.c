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
//    char buff[100];
//    long eadc_resAcu=0;
//    int eadc_count=0;
    RLY3_Clear();
    
    TMR2_CallbackRegister(T2_TimerInterrupHandler,(uintptr_t)NULL);
    
    W_BOOT_Set();
    W_EN_Set();
    
    ADC_nRST_Clear();
    ADC_nCS_Set();
    ADC_STRT_Clear();
    
    TRM_nCS_Set();
    
    TMR2_Start();
//    bool therm_en=false;
//    bool wifi_connected=false;
//    
//    unsigned char w_stp= 0;
    unsigned char tr_CRreg[]={0x80,0b10010001,0b00100011}; //Configuration bits for max31856
    unsigned char addr=12;
    TRM_nCS_Clear();
    SPI2_Write(tr_CRreg,3);
    while(SPI2_IsBusy());
    TRM_nCS_Set();
    bool dato = true;
    int c=0;
    while ( true )
    {
        if((TRM_nDRDY_Get()==0)&&(dato==true)){
            LED2_Toggle();
            TRM_nCS_Clear();
            SPI2_WriteRead(&addr,1,tr_CRreg,3);
            while(SPI2_IsBusy());
            TRM_nCS_Set();
            dato=false;
        }
        if(TRM_nDRDY_Get()==1){
            dato=true;
        }
        c++;
        wait_ms(10);
        
        if(c>50){
            LED1_Toggle();
            c=0;
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

