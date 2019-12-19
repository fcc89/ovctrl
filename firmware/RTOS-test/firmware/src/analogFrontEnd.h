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

#ifndef _ANALOG_FRONT_END_H    
#define _ANALOG_FRONT_END_H


#include "definitions.h" 



/* Provide C++ Compatibility */
#ifdef __cplusplus
extern "C" {
    
#endif


#define MAX31856_CR0_ADDR_READ          0x00
#define MAX31856_CR0_ADDR_WRITE         0x80
    
#define MAX31856_CR1_ADDR_READ          0x01
#define MAX31856_CR1_ADDR_WRITE         0x81
    
#define MAX31856_MASK_ADDR_READ         0x02
#define MAX31856_MASK_ADDR_WRITE        0x82    
    
#define MAX31856_CJHF_ADDR_READ         0x03
#define MAX31856_CJHF_ADDR_WRITE        0x83
    
#define MAX31856_CJLF_ADDR_READ         0x04
#define MAX31856_CJLF_ADDR_WRITE        0x84
    
#define MAX31856_LTHFTH_ADDR_READ       0x05
#define MAX31856_LTHFTH_ADDR_WRITE      0x85
    
#define MAX31856_LTHFTL_ADDR_READ       0x06
#define MAX31856_LTHFTL_ADDR_WRITE      0x86

#define MAX31856_LTLFTH_ADDR_READ       0x07
#define MAX31856_LTLFTH_ADDR_WRITE      0x87
    
#define MAX31856_LTLFTL_ADDR_READ       0x08
#define MAX31856_LTLFTL_ADDR_WRITE      0x88

#define MAX31856_CJTO_ADDR_READ         0x09
#define MAX31856_CJTO_ADDR_WRITE        0x89
    
#define MAX31856_CJTH_ADDR_READ         0x0A
#define MAX31856_CJTH_ADDR_WRITE        0x8A    

#define MAX31856_CJTL_ADDR_READ         0x0B
#define MAX31856_CJTL_ADDR_WRITE        0x8B
    
#define MAX31856_ILTCBH_ADDR_READ       0x0C    
#define MAX31856_ILTCBM_ADDR_READ       0x0D
#define MAX31856_ILTCBL_ADDR_READ       0x0E

#define MAX31856_SR_ADDR_READ           0x0F   
    
    
    

#define MAX31856_CR0_VALUE_DEFAULT      0b10010001  /*Automatic conversion, convertion time aprox. 100[ms]  
                                                    Open circuit detection <5kOhm,
                                                    Junction compensation sensor enabled,
                                                    Fault report in comparator mode,
                                                    50Hz rejection mode
                                                    */

#define MAX31856_CR1_VALUE_DEFAULT      0b00110011  /*8 samples average, k-type thermocouple, drdy changes aprox every 240[ms] */

    typedef struct _analog_data_t {
        float   fTC_1;      //temperature thermocouple 1 (read by ADC)
        float   fTC_2;      //temperature thermocouple 2 (read by MAX31856)
        float   fJC_1;      //junction temperature for thermocouple 1 read by TMP112AIDRLT
        float   fJC_2;      //junction temperature for thermocouple 2 (internal MAX31856)
        float   fRTD_tmp;   //RTD reading in celcius
        float   fRTD_res;   //RTD reading in ohms
        float   fIch1;      //Current in mA channel 1
        float   fIch2;      //Current in mA channel 2
        float   fVch1;      //Voltage across shunt channel 1
        float   fVch2;      //Voltage across shunt channel 2
        bool    bENtc_1;    //Is Thermocouple 1 enabled?
        bool    bENtc_2;    //Is thermocouple 2 enabled?
        bool    bENrtd;     //Is RTD enabled
        bool    bENIch1;    //Is ich1 en?
        bool    bENIch2;    //Is ich2 en?
        //TODO consider to add a time stamp
    } analog_data_t;
    
    extern QueueHandle_t xQueueAnalogOutput;

    void taskThermocoupleRead(void *pvParam);
    
    
    /* Provide C++ Compatibility */
#ifdef __cplusplus
}
#endif

#endif /* _EXAMPLE_FILE_NAME_H */

/* *****************************************************************************
 End of File
 */
