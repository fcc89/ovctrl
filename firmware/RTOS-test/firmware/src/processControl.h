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

#ifndef _PROCESS_CONTROL_H    /* Guard against multiple inclusion */
#define _PROCESS_CONTROL_H


/* ************************************************************************** */
/* ************************************************************************** */
/* Section: Included Files                                                    */
/* ************************************************************************** */
/* ************************************************************************** */

/* This section lists the other files that are included in this file.
 */

/* TODO:  Include other files here if needed. */


/* Provide C++ Compatibility */
#ifdef __cplusplus
extern "C" {
#endif
    
    typedef struct _process_cmnd_t {
        unsigned int cmnd;
        float preHeatTemp;
        float soackingTemp;
        float reflowTemp;
        float fixedTemp;
        unsigned int preheatTime;
        unsigned int soackingTime;
        unsigned int reflowTime;
        unsigned int timeLimit; //put 0 for dissable time limit for fixed temperature, ignored for reflow
        //TODO consider to add a time stamp
    } process_cmnd_t;


#define PROCESS_CMND_REFLOW_START           1
#define PROCESS_CMND_REFLOW_PARAM_CHANGE    2
#define PROCESS_CMND_FIXEDTEMP_START        3
#define PROCESS_CMND_STOP                   4
    
#define PROCESS_STATE_IDLE                  0
#define PROCESS_STATE_PREHEAT               1
#define PROCESS_STATE_SOACKING              2
#define PROCESS_STATE_REFLOW                3
#define PROCESS_STATE_COOLING               4
#define PROCESS_STATE_ERROR                 5
    
    void taskPID(void *pvParam);
    void taskProcessControl(void *pvParam);


    /* Provide C++ Compatibility */
#ifdef __cplusplus
}
#endif

#endif /* _EXAMPLE_FILE_NAME_H */

/* *****************************************************************************
 End of File
 */
