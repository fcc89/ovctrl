/* ************************************************************************** */
/** Descriptive File Name

  @Company
    Company Name

  @File Name
    filename.h

  @Summary
    Brief description of the file.

  @Description
    Describe the purpose of this file.
 */
/* ************************************************************************** */

#ifndef _WIRELESS_COM_H    /* Guard against multiple inclusion */
#define _WIRELESS_COM_H


/* ************************************************************************** */
/* ************************************************************************** */
/* Section: Included Files                                                    */
/* ************************************************************************** */
/* ************************************************************************** */
#include "definitions.h" 

#define REMOTE_MESSAGE_START            0xF0
#define REMOTE_MESSAGE_END              0x0F

#define REMOTE_COMMAND_HADNSHAKE        0x11
#define REMOTE_COMMAND_GETSTATE         0x01
#define REMOTE_COMMAND_REFLOWSTATE      0x02
#define REMOTE_COMMAND_REFLOWSTART      0x03
#define REMOTE_COMMAND_REFLOWEND        0x04

#define REMOTE_PARAMETER_HANDSHAKE      0x6B
#define REMOTE_PARAMETER_READ           0x00
#define REMOTE_PARAMETER_WRITE          0x01
#define REMOTE_PARAMETER_REFLOWREADY    0x01
#define REMOTE_PARAMETER_REFLOWPREHEAT  0x02
#define REMOTE_PARAMETER_REFLOWSOACKING 0x03
#define REMOTE_PARAMETER_REFLOWREFLOW   0x04
#define REMOTE_PARAMETER_REFLOWCOOLING  0x05
#define REMOTE_PARAMETER_START          0x06
#define REMOTE_PARAMETER_ERROR          0x0A



/* Provide C++ Compatibility */
#ifdef __cplusplus
extern "C" {
#endif
    typedef struct _io_repor_t {

        float   fTC_1;          //temperature thermocouple 1 (read by ADC)
        float   fTC_2;          //temperature thermocouple 2 (read by MAX31856)
        float   fJC_1;          //junction temperature for thermocouple 1 read by TMP112AIDRLT
        float   fJC_2;          //junction temperature for thermocouple 2 (internal MAX31856)
        float   fRTD_tmp;       //RTD reading in celcius
        float   fRTD_res;       //RTD reading in ohms
        float   fIch1;          //Current in mA channel 1
        float   fIch2;          //Current in mA channel 2
        float   fVch1;          //Voltage across shunt channel 1
        float   fVch2;          //Voltage across shunt channel 2
        bool    bRelayOutput;   //reflects state of relay output
        bool    bDigitalOut1;
        bool    bDigitalOut2;
        bool    bENtc_1;        //Is Thermocouple 1 enabled?
        bool    bENtc_2;        //Is thermocouple 2 enabled?
        bool    bENrtd;         //Is RTD enabled
        bool    bENIch1;        //Is ich1 en?
        bool    bENIch2;        //Is ich2 en?
        //TODO consider to add a time stamp
    } io_report_t;
    
    
    extern SemaphoreHandle_t xBinarySemaphoreWirelessInit;
    extern QueueHandle_t xQueueAutoPCupdateEnable;
    extern QueueHandle_t xQueueDataFrmPID;
    extern SemaphoreHandle_t xBinarySemaphoreWaitForAutosendPause;
    
    
    int wirelessInit(void);
    void taskWireless(void *pvParam);
    void taskPeriodicReport(void *pvParam);

    /* Provide C++ Compatibility */
#ifdef __cplusplus
}
#endif

#endif /* _EXAMPLE_FILE_NAME_H */

/* *****************************************************************************
 End of File
 */
