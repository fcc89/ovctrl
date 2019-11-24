/*******************************************************************************
  GPIO PLIB

  Company:
    Microchip Technology Inc.

  File Name:
    plib_gpio.h

  Summary:
    GPIO PLIB Header File

  Description:
    This library provides an interface to control and interact with Parallel
    Input/Output controller (GPIO) module.

*******************************************************************************/

/*******************************************************************************
* Copyright (C) 2019 Microchip Technology Inc. and its subsidiaries.
*
* Subject to your compliance with these terms, you may use Microchip software
* and any derivatives exclusively with Microchip products. It is your
* responsibility to comply with third party license terms applicable to your
* use of third party software (including open source software) that may
* accompany Microchip software.
*
* THIS SOFTWARE IS SUPPLIED BY MICROCHIP "AS IS". NO WARRANTIES, WHETHER
* EXPRESS, IMPLIED OR STATUTORY, APPLY TO THIS SOFTWARE, INCLUDING ANY IMPLIED
* WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY, AND FITNESS FOR A
* PARTICULAR PURPOSE.
*
* IN NO EVENT WILL MICROCHIP BE LIABLE FOR ANY INDIRECT, SPECIAL, PUNITIVE,
* INCIDENTAL OR CONSEQUENTIAL LOSS, DAMAGE, COST OR EXPENSE OF ANY KIND
* WHATSOEVER RELATED TO THE SOFTWARE, HOWEVER CAUSED, EVEN IF MICROCHIP HAS
* BEEN ADVISED OF THE POSSIBILITY OR THE DAMAGES ARE FORESEEABLE. TO THE
* FULLEST EXTENT ALLOWED BY LAW, MICROCHIP'S TOTAL LIABILITY ON ALL CLAIMS IN
* ANY WAY RELATED TO THIS SOFTWARE WILL NOT EXCEED THE AMOUNT OF FEES, IF ANY,
* THAT YOU HAVE PAID DIRECTLY TO MICROCHIP FOR THIS SOFTWARE.
*******************************************************************************/

#ifndef PLIB_GPIO_H
#define PLIB_GPIO_H

#include <device.h>
#include <stdint.h>
#include <stdbool.h>
#include <stddef.h>

// DOM-IGNORE-BEGIN
#ifdef __cplusplus  // Provide C++ Compatibility

    extern "C" {

#endif
// DOM-IGNORE-END

// *****************************************************************************
// *****************************************************************************
// Section: Data types and constants
// *****************************************************************************
// *****************************************************************************

/*** Macros for ADC_STRT pin ***/
#define ADC_STRT_Set()               (LATGSET = (1<<15))
#define ADC_STRT_Clear()             (LATGCLR = (1<<15))
#define ADC_STRT_Toggle()            (LATGINV= (1<<15))
#define ADC_STRT_Get()               ((PORTG >> 15) & 0x1)
#define ADC_STRT_OutputEnable()      (TRISGCLR = (1<<15))
#define ADC_STRT_InputEnable()       (TRISGSET = (1<<15))
#define ADC_STRT_PIN                  GPIO_PIN_RG15
/*** Macros for ADC_nRST pin ***/
#define ADC_nRST_Set()               (LATASET = (1<<5))
#define ADC_nRST_Clear()             (LATACLR = (1<<5))
#define ADC_nRST_Toggle()            (LATAINV= (1<<5))
#define ADC_nRST_Get()               ((PORTA >> 5) & 0x1)
#define ADC_nRST_OutputEnable()      (TRISACLR = (1<<5))
#define ADC_nRST_InputEnable()       (TRISASET = (1<<5))
#define ADC_nRST_PIN                  GPIO_PIN_RA5
/*** Macros for ADC_DRDY pin ***/
#define ADC_DRDY_Set()               (LATESET = (1<<5))
#define ADC_DRDY_Clear()             (LATECLR = (1<<5))
#define ADC_DRDY_Toggle()            (LATEINV= (1<<5))
#define ADC_DRDY_Get()               ((PORTE >> 5) & 0x1)
#define ADC_DRDY_OutputEnable()      (TRISECLR = (1<<5))
#define ADC_DRDY_InputEnable()       (TRISESET = (1<<5))
#define ADC_DRDY_PIN                  GPIO_PIN_RE5
/*** Macros for TRM_nDRDY pin ***/
#define TRM_nDRDY_Set()               (LATESET = (1<<6))
#define TRM_nDRDY_Clear()             (LATECLR = (1<<6))
#define TRM_nDRDY_Toggle()            (LATEINV= (1<<6))
#define TRM_nDRDY_Get()               ((PORTE >> 6) & 0x1)
#define TRM_nDRDY_OutputEnable()      (TRISECLR = (1<<6))
#define TRM_nDRDY_InputEnable()       (TRISESET = (1<<6))
#define TRM_nDRDY_PIN                  GPIO_PIN_RE6
/*** Macros for TRM_nFAULT pin ***/
#define TRM_nFAULT_Set()               (LATESET = (1<<7))
#define TRM_nFAULT_Clear()             (LATECLR = (1<<7))
#define TRM_nFAULT_Toggle()            (LATEINV= (1<<7))
#define TRM_nFAULT_Get()               ((PORTE >> 7) & 0x1)
#define TRM_nFAULT_OutputEnable()      (TRISECLR = (1<<7))
#define TRM_nFAULT_InputEnable()       (TRISESET = (1<<7))
#define TRM_nFAULT_PIN                  GPIO_PIN_RE7
/*** Macros for ADC_nCS pin ***/
#define ADC_nCS_Set()               (LATCSET = (1<<2))
#define ADC_nCS_Clear()             (LATCCLR = (1<<2))
#define ADC_nCS_Toggle()            (LATCINV= (1<<2))
#define ADC_nCS_Get()               ((PORTC >> 2) & 0x1)
#define ADC_nCS_OutputEnable()      (TRISCCLR = (1<<2))
#define ADC_nCS_InputEnable()       (TRISCSET = (1<<2))
#define ADC_nCS_PIN                  GPIO_PIN_RC2
/*** Macros for TRM_nCS pin ***/
#define TRM_nCS_Set()               (LATCSET = (1<<3))
#define TRM_nCS_Clear()             (LATCCLR = (1<<3))
#define TRM_nCS_Toggle()            (LATCINV= (1<<3))
#define TRM_nCS_Get()               ((PORTC >> 3) & 0x1)
#define TRM_nCS_OutputEnable()      (TRISCCLR = (1<<3))
#define TRM_nCS_InputEnable()       (TRISCSET = (1<<3))
#define TRM_nCS_PIN                  GPIO_PIN_RC3
/*** Macros for RTD_3W pin ***/
#define RTD_3W_Set()               (LATGSET = (1<<9))
#define RTD_3W_Clear()             (LATGCLR = (1<<9))
#define RTD_3W_Toggle()            (LATGINV= (1<<9))
#define RTD_3W_Get()               ((PORTG >> 9) & 0x1)
#define RTD_3W_OutputEnable()      (TRISGCLR = (1<<9))
#define RTD_3W_InputEnable()       (TRISGSET = (1<<9))
#define RTD_3W_PIN                  GPIO_PIN_RG9
/*** Macros for ICH1_EN pin ***/
#define ICH1_EN_Set()               (LATASET = (1<<0))
#define ICH1_EN_Clear()             (LATACLR = (1<<0))
#define ICH1_EN_Toggle()            (LATAINV= (1<<0))
#define ICH1_EN_Get()               ((PORTA >> 0) & 0x1)
#define ICH1_EN_OutputEnable()      (TRISACLR = (1<<0))
#define ICH1_EN_InputEnable()       (TRISASET = (1<<0))
#define ICH1_EN_PIN                  GPIO_PIN_RA0
/*** Macros for ICH2_EN pin ***/
#define ICH2_EN_Set()               (LATESET = (1<<8))
#define ICH2_EN_Clear()             (LATECLR = (1<<8))
#define ICH2_EN_Toggle()            (LATEINV= (1<<8))
#define ICH2_EN_Get()               ((PORTE >> 8) & 0x1)
#define ICH2_EN_OutputEnable()      (TRISECLR = (1<<8))
#define ICH2_EN_InputEnable()       (TRISESET = (1<<8))
#define ICH2_EN_PIN                  GPIO_PIN_RE8
/*** Macros for CJ_ALERT pin ***/
#define CJ_ALERT_Set()               (LATESET = (1<<9))
#define CJ_ALERT_Clear()             (LATECLR = (1<<9))
#define CJ_ALERT_Toggle()            (LATEINV= (1<<9))
#define CJ_ALERT_Get()               ((PORTE >> 9) & 0x1)
#define CJ_ALERT_OutputEnable()      (TRISECLR = (1<<9))
#define CJ_ALERT_InputEnable()       (TRISESET = (1<<9))
#define CJ_ALERT_PIN                  GPIO_PIN_RE9
/*** Macros for SW2 pin ***/
#define SW2_Set()               (LATBSET = (1<<4))
#define SW2_Clear()             (LATBCLR = (1<<4))
#define SW2_Toggle()            (LATBINV= (1<<4))
#define SW2_Get()               ((PORTB >> 4) & 0x1)
#define SW2_OutputEnable()      (TRISBCLR = (1<<4))
#define SW2_InputEnable()       (TRISBSET = (1<<4))
#define SW2_PIN                  GPIO_PIN_RB4
/*** Macros for SW3 pin ***/
#define SW3_Set()               (LATBSET = (1<<2))
#define SW3_Clear()             (LATBCLR = (1<<2))
#define SW3_Toggle()            (LATBINV= (1<<2))
#define SW3_Get()               ((PORTB >> 2) & 0x1)
#define SW3_OutputEnable()      (TRISBCLR = (1<<2))
#define SW3_InputEnable()       (TRISBSET = (1<<2))
#define SW3_PIN                  GPIO_PIN_RB2
/*** Macros for LED1 pin ***/
#define LED1_Set()               (LATBSET = (1<<6))
#define LED1_Clear()             (LATBCLR = (1<<6))
#define LED1_Toggle()            (LATBINV= (1<<6))
#define LED1_Get()               ((PORTB >> 6) & 0x1)
#define LED1_OutputEnable()      (TRISBCLR = (1<<6))
#define LED1_InputEnable()       (TRISBSET = (1<<6))
#define LED1_PIN                  GPIO_PIN_RB6
/*** Macros for LED2 pin ***/
#define LED2_Set()               (LATBSET = (1<<7))
#define LED2_Clear()             (LATBCLR = (1<<7))
#define LED2_Toggle()            (LATBINV= (1<<7))
#define LED2_Get()               ((PORTB >> 7) & 0x1)
#define LED2_OutputEnable()      (TRISBCLR = (1<<7))
#define LED2_InputEnable()       (TRISBSET = (1<<7))
#define LED2_PIN                  GPIO_PIN_RB7
/*** Macros for SW4 pin ***/
#define SW4_Set()               (LATBSET = (1<<8))
#define SW4_Clear()             (LATBCLR = (1<<8))
#define SW4_Toggle()            (LATBINV= (1<<8))
#define SW4_Get()               ((PORTB >> 8) & 0x1)
#define SW4_OutputEnable()      (TRISBCLR = (1<<8))
#define SW4_InputEnable()       (TRISBSET = (1<<8))
#define SW4_PIN                  GPIO_PIN_RB8
/*** Macros for SW1 pin ***/
#define SW1_Set()               (LATBSET = (1<<11))
#define SW1_Clear()             (LATBCLR = (1<<11))
#define SW1_Toggle()            (LATBINV= (1<<11))
#define SW1_Get()               ((PORTB >> 11) & 0x1)
#define SW1_OutputEnable()      (TRISBCLR = (1<<11))
#define SW1_InputEnable()       (TRISBSET = (1<<11))
#define SW1_PIN                  GPIO_PIN_RB11
/*** Macros for W_EN pin ***/
#define W_EN_Set()               (LATBSET = (1<<12))
#define W_EN_Clear()             (LATBCLR = (1<<12))
#define W_EN_Toggle()            (LATBINV= (1<<12))
#define W_EN_Get()               ((PORTB >> 12) & 0x1)
#define W_EN_OutputEnable()      (TRISBCLR = (1<<12))
#define W_EN_InputEnable()       (TRISBSET = (1<<12))
#define W_EN_PIN                  GPIO_PIN_RB12
/*** Macros for W_BOOT pin ***/
#define W_BOOT_Set()               (LATBSET = (1<<13))
#define W_BOOT_Clear()             (LATBCLR = (1<<13))
#define W_BOOT_Toggle()            (LATBINV= (1<<13))
#define W_BOOT_Get()               ((PORTB >> 13) & 0x1)
#define W_BOOT_OutputEnable()      (TRISBCLR = (1<<13))
#define W_BOOT_InputEnable()       (TRISBSET = (1<<13))
#define W_BOOT_PIN                  GPIO_PIN_RB13
/*** Macros for RLY3 pin ***/
#define RLY3_Set()               (LATESET = (1<<0))
#define RLY3_Clear()             (LATECLR = (1<<0))
#define RLY3_Toggle()            (LATEINV= (1<<0))
#define RLY3_Get()               ((PORTE >> 0) & 0x1)
#define RLY3_OutputEnable()      (TRISECLR = (1<<0))
#define RLY3_InputEnable()       (TRISESET = (1<<0))
#define RLY3_PIN                  GPIO_PIN_RE0


// *****************************************************************************
/* GPIO Port

  Summary:
    Identifies the available GPIO Ports.

  Description:
    This enumeration identifies the available GPIO Ports.

  Remarks:
    The caller should not rely on the specific numbers assigned to any of
    these values as they may change from one processor to the next.

    Not all ports are available on all devices.  Refer to the specific
    device data sheet to determine which ports are supported.
*/

typedef enum
{
    GPIO_PORT_A = 0,
    GPIO_PORT_B = 1,
    GPIO_PORT_C = 2,
    GPIO_PORT_D = 3,
    GPIO_PORT_E = 4,
    GPIO_PORT_F = 5,
    GPIO_PORT_G = 6,
} GPIO_PORT;

// *****************************************************************************
/* GPIO Port Pins

  Summary:
    Identifies the available GPIO port pins.

  Description:
    This enumeration identifies the available GPIO port pins.

  Remarks:
    The caller should not rely on the specific numbers assigned to any of
    these values as they may change from one processor to the next.

    Not all pins are available on all devices.  Refer to the specific
    device data sheet to determine which pins are supported.
*/

typedef enum
{
    GPIO_PIN_RA0 = 0,
    GPIO_PIN_RA1 = 1,
    GPIO_PIN_RA2 = 2,
    GPIO_PIN_RA3 = 3,
    GPIO_PIN_RA4 = 4,
    GPIO_PIN_RA5 = 5,
    GPIO_PIN_RA6 = 6,
    GPIO_PIN_RA7 = 7,
    GPIO_PIN_RA9 = 9,
    GPIO_PIN_RA10 = 10,
    GPIO_PIN_RA14 = 14,
    GPIO_PIN_RA15 = 15,
    GPIO_PIN_RB0 = 16,
    GPIO_PIN_RB1 = 17,
    GPIO_PIN_RB2 = 18,
    GPIO_PIN_RB3 = 19,
    GPIO_PIN_RB4 = 20,
    GPIO_PIN_RB5 = 21,
    GPIO_PIN_RB6 = 22,
    GPIO_PIN_RB7 = 23,
    GPIO_PIN_RB8 = 24,
    GPIO_PIN_RB9 = 25,
    GPIO_PIN_RB10 = 26,
    GPIO_PIN_RB11 = 27,
    GPIO_PIN_RB12 = 28,
    GPIO_PIN_RB13 = 29,
    GPIO_PIN_RB14 = 30,
    GPIO_PIN_RB15 = 31,
    GPIO_PIN_RC1 = 33,
    GPIO_PIN_RC2 = 34,
    GPIO_PIN_RC3 = 35,
    GPIO_PIN_RC4 = 36,
    GPIO_PIN_RC12 = 44,
    GPIO_PIN_RC13 = 45,
    GPIO_PIN_RC14 = 46,
    GPIO_PIN_RC15 = 47,
    GPIO_PIN_RD0 = 48,
    GPIO_PIN_RD1 = 49,
    GPIO_PIN_RD2 = 50,
    GPIO_PIN_RD3 = 51,
    GPIO_PIN_RD4 = 52,
    GPIO_PIN_RD5 = 53,
    GPIO_PIN_RD9 = 57,
    GPIO_PIN_RD10 = 58,
    GPIO_PIN_RD11 = 59,
    GPIO_PIN_RD12 = 60,
    GPIO_PIN_RD13 = 61,
    GPIO_PIN_RD14 = 62,
    GPIO_PIN_RD15 = 63,
    GPIO_PIN_RE0 = 64,
    GPIO_PIN_RE1 = 65,
    GPIO_PIN_RE2 = 66,
    GPIO_PIN_RE3 = 67,
    GPIO_PIN_RE4 = 68,
    GPIO_PIN_RE5 = 69,
    GPIO_PIN_RE6 = 70,
    GPIO_PIN_RE7 = 71,
    GPIO_PIN_RE8 = 72,
    GPIO_PIN_RE9 = 73,
    GPIO_PIN_RF0 = 80,
    GPIO_PIN_RF1 = 81,
    GPIO_PIN_RF2 = 82,
    GPIO_PIN_RF3 = 83,
    GPIO_PIN_RF4 = 84,
    GPIO_PIN_RF5 = 85,
    GPIO_PIN_RF8 = 88,
    GPIO_PIN_RF12 = 92,
    GPIO_PIN_RF13 = 93,
    GPIO_PIN_RG0 = 96,
    GPIO_PIN_RG1 = 97,
    GPIO_PIN_RG6 = 102,
    GPIO_PIN_RG7 = 103,
    GPIO_PIN_RG8 = 104,
    GPIO_PIN_RG9 = 105,
    GPIO_PIN_RG12 = 108,
    GPIO_PIN_RG13 = 109,
    GPIO_PIN_RG14 = 110,
    GPIO_PIN_RG15 = 111,

    /* This element should not be used in any of the GPIO APIs.
       It will be used by other modules or application to denote that none of the GPIO Pin is used */
    GPIO_PIN_NONE = -1

} GPIO_PIN;


void GPIO_Initialize(void);

// *****************************************************************************
// *****************************************************************************
// Section: GPIO Functions which operates on multiple pins of a port
// *****************************************************************************
// *****************************************************************************

uint32_t GPIO_PortRead(GPIO_PORT port);

void GPIO_PortWrite(GPIO_PORT port, uint32_t mask, uint32_t value);

uint32_t GPIO_PortLatchRead ( GPIO_PORT port );

void GPIO_PortSet(GPIO_PORT port, uint32_t mask);

void GPIO_PortClear(GPIO_PORT port, uint32_t mask);

void GPIO_PortToggle(GPIO_PORT port, uint32_t mask);

void GPIO_PortInputEnable(GPIO_PORT port, uint32_t mask);

void GPIO_PortOutputEnable(GPIO_PORT port, uint32_t mask);

// *****************************************************************************
// *****************************************************************************
// Section: GPIO Functions which operates on one pin at a time
// *****************************************************************************
// *****************************************************************************

static inline void GPIO_PinWrite(GPIO_PIN pin, bool value)
{
    GPIO_PortWrite(pin>>4, (uint32_t)(0x1) << (pin & 0xF), (uint32_t)(value) << (pin & 0xF));
}

static inline bool GPIO_PinRead(GPIO_PIN pin)
{
    return (bool)(((GPIO_PortRead(pin>>4)) >> (pin & 0xF)) & 0x1);
}

static inline bool GPIO_PinLatchRead(GPIO_PIN pin)
{
    return (bool)((GPIO_PortLatchRead(pin>>4) >> (pin & 0xF)) & 0x1);
}

static inline void GPIO_PinToggle(GPIO_PIN pin)
{
    GPIO_PortToggle(pin>>4, 0x1 << (pin & 0xF));
}

static inline void GPIO_PinSet(GPIO_PIN pin)
{
    GPIO_PortSet(pin>>4, 0x1 << (pin & 0xF));
}

static inline void GPIO_PinClear(GPIO_PIN pin)
{
    GPIO_PortClear(pin>>4, 0x1 << (pin & 0xF));
}

static inline void GPIO_PinInputEnable(GPIO_PIN pin)
{
    GPIO_PortInputEnable(pin>>4, 0x1 << (pin & 0xF));
}

static inline void GPIO_PinOutputEnable(GPIO_PIN pin)
{
    GPIO_PortOutputEnable(pin>>4, 0x1 << (pin & 0xF));
}


// DOM-IGNORE-BEGIN
#ifdef __cplusplus  // Provide C++ Compatibility

    }

#endif
// DOM-IGNORE-END
#endif // PLIB_GPIO_H
