#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-rtos.mk)" "nbproject/Makefile-local-rtos.mk"
include nbproject/Makefile-local-rtos.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=rtos
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/RTOS-test.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/RTOS-test.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

ifdef SUB_IMAGE_ADDRESS

else
SUB_IMAGE_ADDRESS_COMMAND=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=../src/config/rtos/driver/i2c/src/drv_i2c.c ../src/config/rtos/driver/spi/src/drv_spi.c ../src/config/rtos/driver/usart/src/drv_usart.c ../src/config/rtos/peripheral/clk/plib_clk.c ../src/config/rtos/peripheral/evic/plib_evic.c ../src/config/rtos/peripheral/gpio/plib_gpio.c ../src/config/rtos/peripheral/i2c/plib_i2c4.c ../src/config/rtos/peripheral/rtcc/plib_rtcc.c ../src/config/rtos/peripheral/spi/plib_spi2.c ../src/config/rtos/peripheral/uart/plib_uart1.c ../src/config/rtos/stdio/xc32_monitor.c ../src/config/rtos/system/dma/sys_dma.c ../src/config/rtos/system/int/src/sys_int.c ../src/config/rtos/initialization.c ../src/config/rtos/interrupts.c ../src/config/rtos/interrupts_a.S ../src/config/rtos/exceptions.c ../src/config/rtos/freertos_hooks.c ../src/config/rtos/tasks.c ../src/third_party/rtos/FreeRTOS/Source/portable/MemMang/heap_1.c ../src/third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MZ/port.c ../src/third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MZ/port_asm.S ../src/third_party/rtos/FreeRTOS/Source/croutine.c ../src/third_party/rtos/FreeRTOS/Source/list.c ../src/third_party/rtos/FreeRTOS/Source/queue.c ../src/third_party/rtos/FreeRTOS/Source/FreeRTOS_tasks.c ../src/third_party/rtos/FreeRTOS/Source/timers.c ../src/third_party/rtos/FreeRTOS/Source/event_groups.c ../src/third_party/rtos/FreeRTOS/Source/stream_buffer.c ../src/config/rtos/osal/osal_freertos.c ../src/analogFrontEnd.c ../src/wirelessCom.c ../src/PIDcontroller.c ../src/main.c ../src/app.c ../src/processControl.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/576118910/drv_i2c.o ${OBJECTDIR}/_ext/1653197680/drv_spi.o ${OBJECTDIR}/_ext/1140488617/drv_usart.o ${OBJECTDIR}/_ext/477899397/plib_clk.o ${OBJECTDIR}/_ext/1930048648/plib_evic.o ${OBJECTDIR}/_ext/1930102476/plib_gpio.o ${OBJECTDIR}/_ext/477903357/plib_i2c4.o ${OBJECTDIR}/_ext/1930433823/plib_rtcc.o ${OBJECTDIR}/_ext/477914895/plib_spi2.o ${OBJECTDIR}/_ext/1930505419/plib_uart1.o ${OBJECTDIR}/_ext/1216287405/xc32_monitor.o ${OBJECTDIR}/_ext/689976462/sys_dma.o ${OBJECTDIR}/_ext/1995564966/sys_int.o ${OBJECTDIR}/_ext/779632551/initialization.o ${OBJECTDIR}/_ext/779632551/interrupts.o ${OBJECTDIR}/_ext/779632551/interrupts_a.o ${OBJECTDIR}/_ext/779632551/exceptions.o ${OBJECTDIR}/_ext/779632551/freertos_hooks.o ${OBJECTDIR}/_ext/779632551/tasks.o ${OBJECTDIR}/_ext/1665200909/heap_1.o ${OBJECTDIR}/_ext/951553246/port.o ${OBJECTDIR}/_ext/951553246/port_asm.o ${OBJECTDIR}/_ext/404212886/croutine.o ${OBJECTDIR}/_ext/404212886/list.o ${OBJECTDIR}/_ext/404212886/queue.o ${OBJECTDIR}/_ext/404212886/FreeRTOS_tasks.o ${OBJECTDIR}/_ext/404212886/timers.o ${OBJECTDIR}/_ext/404212886/event_groups.o ${OBJECTDIR}/_ext/404212886/stream_buffer.o ${OBJECTDIR}/_ext/1207570693/osal_freertos.o ${OBJECTDIR}/_ext/1360937237/analogFrontEnd.o ${OBJECTDIR}/_ext/1360937237/wirelessCom.o ${OBJECTDIR}/_ext/1360937237/PIDcontroller.o ${OBJECTDIR}/_ext/1360937237/main.o ${OBJECTDIR}/_ext/1360937237/app.o ${OBJECTDIR}/_ext/1360937237/processControl.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/576118910/drv_i2c.o.d ${OBJECTDIR}/_ext/1653197680/drv_spi.o.d ${OBJECTDIR}/_ext/1140488617/drv_usart.o.d ${OBJECTDIR}/_ext/477899397/plib_clk.o.d ${OBJECTDIR}/_ext/1930048648/plib_evic.o.d ${OBJECTDIR}/_ext/1930102476/plib_gpio.o.d ${OBJECTDIR}/_ext/477903357/plib_i2c4.o.d ${OBJECTDIR}/_ext/1930433823/plib_rtcc.o.d ${OBJECTDIR}/_ext/477914895/plib_spi2.o.d ${OBJECTDIR}/_ext/1930505419/plib_uart1.o.d ${OBJECTDIR}/_ext/1216287405/xc32_monitor.o.d ${OBJECTDIR}/_ext/689976462/sys_dma.o.d ${OBJECTDIR}/_ext/1995564966/sys_int.o.d ${OBJECTDIR}/_ext/779632551/initialization.o.d ${OBJECTDIR}/_ext/779632551/interrupts.o.d ${OBJECTDIR}/_ext/779632551/interrupts_a.o.d ${OBJECTDIR}/_ext/779632551/exceptions.o.d ${OBJECTDIR}/_ext/779632551/freertos_hooks.o.d ${OBJECTDIR}/_ext/779632551/tasks.o.d ${OBJECTDIR}/_ext/1665200909/heap_1.o.d ${OBJECTDIR}/_ext/951553246/port.o.d ${OBJECTDIR}/_ext/951553246/port_asm.o.d ${OBJECTDIR}/_ext/404212886/croutine.o.d ${OBJECTDIR}/_ext/404212886/list.o.d ${OBJECTDIR}/_ext/404212886/queue.o.d ${OBJECTDIR}/_ext/404212886/FreeRTOS_tasks.o.d ${OBJECTDIR}/_ext/404212886/timers.o.d ${OBJECTDIR}/_ext/404212886/event_groups.o.d ${OBJECTDIR}/_ext/404212886/stream_buffer.o.d ${OBJECTDIR}/_ext/1207570693/osal_freertos.o.d ${OBJECTDIR}/_ext/1360937237/analogFrontEnd.o.d ${OBJECTDIR}/_ext/1360937237/wirelessCom.o.d ${OBJECTDIR}/_ext/1360937237/PIDcontroller.o.d ${OBJECTDIR}/_ext/1360937237/main.o.d ${OBJECTDIR}/_ext/1360937237/app.o.d ${OBJECTDIR}/_ext/1360937237/processControl.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/576118910/drv_i2c.o ${OBJECTDIR}/_ext/1653197680/drv_spi.o ${OBJECTDIR}/_ext/1140488617/drv_usart.o ${OBJECTDIR}/_ext/477899397/plib_clk.o ${OBJECTDIR}/_ext/1930048648/plib_evic.o ${OBJECTDIR}/_ext/1930102476/plib_gpio.o ${OBJECTDIR}/_ext/477903357/plib_i2c4.o ${OBJECTDIR}/_ext/1930433823/plib_rtcc.o ${OBJECTDIR}/_ext/477914895/plib_spi2.o ${OBJECTDIR}/_ext/1930505419/plib_uart1.o ${OBJECTDIR}/_ext/1216287405/xc32_monitor.o ${OBJECTDIR}/_ext/689976462/sys_dma.o ${OBJECTDIR}/_ext/1995564966/sys_int.o ${OBJECTDIR}/_ext/779632551/initialization.o ${OBJECTDIR}/_ext/779632551/interrupts.o ${OBJECTDIR}/_ext/779632551/interrupts_a.o ${OBJECTDIR}/_ext/779632551/exceptions.o ${OBJECTDIR}/_ext/779632551/freertos_hooks.o ${OBJECTDIR}/_ext/779632551/tasks.o ${OBJECTDIR}/_ext/1665200909/heap_1.o ${OBJECTDIR}/_ext/951553246/port.o ${OBJECTDIR}/_ext/951553246/port_asm.o ${OBJECTDIR}/_ext/404212886/croutine.o ${OBJECTDIR}/_ext/404212886/list.o ${OBJECTDIR}/_ext/404212886/queue.o ${OBJECTDIR}/_ext/404212886/FreeRTOS_tasks.o ${OBJECTDIR}/_ext/404212886/timers.o ${OBJECTDIR}/_ext/404212886/event_groups.o ${OBJECTDIR}/_ext/404212886/stream_buffer.o ${OBJECTDIR}/_ext/1207570693/osal_freertos.o ${OBJECTDIR}/_ext/1360937237/analogFrontEnd.o ${OBJECTDIR}/_ext/1360937237/wirelessCom.o ${OBJECTDIR}/_ext/1360937237/PIDcontroller.o ${OBJECTDIR}/_ext/1360937237/main.o ${OBJECTDIR}/_ext/1360937237/app.o ${OBJECTDIR}/_ext/1360937237/processControl.o

# Source Files
SOURCEFILES=../src/config/rtos/driver/i2c/src/drv_i2c.c ../src/config/rtos/driver/spi/src/drv_spi.c ../src/config/rtos/driver/usart/src/drv_usart.c ../src/config/rtos/peripheral/clk/plib_clk.c ../src/config/rtos/peripheral/evic/plib_evic.c ../src/config/rtos/peripheral/gpio/plib_gpio.c ../src/config/rtos/peripheral/i2c/plib_i2c4.c ../src/config/rtos/peripheral/rtcc/plib_rtcc.c ../src/config/rtos/peripheral/spi/plib_spi2.c ../src/config/rtos/peripheral/uart/plib_uart1.c ../src/config/rtos/stdio/xc32_monitor.c ../src/config/rtos/system/dma/sys_dma.c ../src/config/rtos/system/int/src/sys_int.c ../src/config/rtos/initialization.c ../src/config/rtos/interrupts.c ../src/config/rtos/interrupts_a.S ../src/config/rtos/exceptions.c ../src/config/rtos/freertos_hooks.c ../src/config/rtos/tasks.c ../src/third_party/rtos/FreeRTOS/Source/portable/MemMang/heap_1.c ../src/third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MZ/port.c ../src/third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MZ/port_asm.S ../src/third_party/rtos/FreeRTOS/Source/croutine.c ../src/third_party/rtos/FreeRTOS/Source/list.c ../src/third_party/rtos/FreeRTOS/Source/queue.c ../src/third_party/rtos/FreeRTOS/Source/FreeRTOS_tasks.c ../src/third_party/rtos/FreeRTOS/Source/timers.c ../src/third_party/rtos/FreeRTOS/Source/event_groups.c ../src/third_party/rtos/FreeRTOS/Source/stream_buffer.c ../src/config/rtos/osal/osal_freertos.c ../src/analogFrontEnd.c ../src/wirelessCom.c ../src/PIDcontroller.c ../src/main.c ../src/app.c ../src/processControl.c



CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-rtos.mk dist/${CND_CONF}/${IMAGE_TYPE}/RTOS-test.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=32MZ1024EFK100
MP_LINKER_FILE_OPTION=
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/779632551/interrupts_a.o: ../src/config/rtos/interrupts_a.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/779632551" 
	@${RM} ${OBJECTDIR}/_ext/779632551/interrupts_a.o.d 
	@${RM} ${OBJECTDIR}/_ext/779632551/interrupts_a.o 
	@${RM} ${OBJECTDIR}/_ext/779632551/interrupts_a.o.ok ${OBJECTDIR}/_ext/779632551/interrupts_a.o.err 
	@${FIXDEPS} "${OBJECTDIR}/_ext/779632551/interrupts_a.o.d" "${OBJECTDIR}/_ext/779632551/interrupts_a.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC} $(MP_EXTRA_AS_PRE)  -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../src/third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MZ" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/config/rtos" -MMD -MF "${OBJECTDIR}/_ext/779632551/interrupts_a.o.d"  -o ${OBJECTDIR}/_ext/779632551/interrupts_a.o ../src/config/rtos/interrupts_a.S  -DXPRJ_rtos=$(CND_CONF)  -no-legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/_ext/779632551/interrupts_a.o.asm.d",--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--gdwarf-2,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_PK3=1,-I"../src/third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MZ" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/config/rtos" -mdfp=${DFP_DIR}
	
${OBJECTDIR}/_ext/951553246/port_asm.o: ../src/third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MZ/port_asm.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/951553246" 
	@${RM} ${OBJECTDIR}/_ext/951553246/port_asm.o.d 
	@${RM} ${OBJECTDIR}/_ext/951553246/port_asm.o 
	@${RM} ${OBJECTDIR}/_ext/951553246/port_asm.o.ok ${OBJECTDIR}/_ext/951553246/port_asm.o.err 
	@${FIXDEPS} "${OBJECTDIR}/_ext/951553246/port_asm.o.d" "${OBJECTDIR}/_ext/951553246/port_asm.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC} $(MP_EXTRA_AS_PRE)  -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../src/third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MZ" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/config/rtos" -MMD -MF "${OBJECTDIR}/_ext/951553246/port_asm.o.d"  -o ${OBJECTDIR}/_ext/951553246/port_asm.o ../src/third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MZ/port_asm.S  -DXPRJ_rtos=$(CND_CONF)  -no-legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/_ext/951553246/port_asm.o.asm.d",--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--gdwarf-2,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_PK3=1,-I"../src/third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MZ" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/config/rtos" -mdfp=${DFP_DIR}
	
else
${OBJECTDIR}/_ext/779632551/interrupts_a.o: ../src/config/rtos/interrupts_a.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/779632551" 
	@${RM} ${OBJECTDIR}/_ext/779632551/interrupts_a.o.d 
	@${RM} ${OBJECTDIR}/_ext/779632551/interrupts_a.o 
	@${RM} ${OBJECTDIR}/_ext/779632551/interrupts_a.o.ok ${OBJECTDIR}/_ext/779632551/interrupts_a.o.err 
	@${FIXDEPS} "${OBJECTDIR}/_ext/779632551/interrupts_a.o.d" "${OBJECTDIR}/_ext/779632551/interrupts_a.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC} $(MP_EXTRA_AS_PRE)  -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../src/third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MZ" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/config/rtos" -MMD -MF "${OBJECTDIR}/_ext/779632551/interrupts_a.o.d"  -o ${OBJECTDIR}/_ext/779632551/interrupts_a.o ../src/config/rtos/interrupts_a.S  -DXPRJ_rtos=$(CND_CONF)  -no-legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/_ext/779632551/interrupts_a.o.asm.d",--gdwarf-2,-I"../src/third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MZ" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/config/rtos" -mdfp=${DFP_DIR}
	
${OBJECTDIR}/_ext/951553246/port_asm.o: ../src/third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MZ/port_asm.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/951553246" 
	@${RM} ${OBJECTDIR}/_ext/951553246/port_asm.o.d 
	@${RM} ${OBJECTDIR}/_ext/951553246/port_asm.o 
	@${RM} ${OBJECTDIR}/_ext/951553246/port_asm.o.ok ${OBJECTDIR}/_ext/951553246/port_asm.o.err 
	@${FIXDEPS} "${OBJECTDIR}/_ext/951553246/port_asm.o.d" "${OBJECTDIR}/_ext/951553246/port_asm.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC} $(MP_EXTRA_AS_PRE)  -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"../src/third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MZ" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/config/rtos" -MMD -MF "${OBJECTDIR}/_ext/951553246/port_asm.o.d"  -o ${OBJECTDIR}/_ext/951553246/port_asm.o ../src/third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MZ/port_asm.S  -DXPRJ_rtos=$(CND_CONF)  -no-legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/_ext/951553246/port_asm.o.asm.d",--gdwarf-2,-I"../src/third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MZ" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/config/rtos" -mdfp=${DFP_DIR}
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/576118910/drv_i2c.o: ../src/config/rtos/driver/i2c/src/drv_i2c.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/576118910" 
	@${RM} ${OBJECTDIR}/_ext/576118910/drv_i2c.o.d 
	@${RM} ${OBJECTDIR}/_ext/576118910/drv_i2c.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/576118910/drv_i2c.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/rtos" -I"../src/packs/PIC32MZ1024EFK100_DFP" -I"../src/mips" -I"../src/third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MZ" -I"../src/third_party/rtos/FreeRTOS/Source/include" -Wall -MMD -MF "${OBJECTDIR}/_ext/576118910/drv_i2c.o.d" -o ${OBJECTDIR}/_ext/576118910/drv_i2c.o ../src/config/rtos/driver/i2c/src/drv_i2c.c    -DXPRJ_rtos=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/_ext/1653197680/drv_spi.o: ../src/config/rtos/driver/spi/src/drv_spi.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1653197680" 
	@${RM} ${OBJECTDIR}/_ext/1653197680/drv_spi.o.d 
	@${RM} ${OBJECTDIR}/_ext/1653197680/drv_spi.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1653197680/drv_spi.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/rtos" -I"../src/packs/PIC32MZ1024EFK100_DFP" -I"../src/mips" -I"../src/third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MZ" -I"../src/third_party/rtos/FreeRTOS/Source/include" -Wall -MMD -MF "${OBJECTDIR}/_ext/1653197680/drv_spi.o.d" -o ${OBJECTDIR}/_ext/1653197680/drv_spi.o ../src/config/rtos/driver/spi/src/drv_spi.c    -DXPRJ_rtos=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/_ext/1140488617/drv_usart.o: ../src/config/rtos/driver/usart/src/drv_usart.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1140488617" 
	@${RM} ${OBJECTDIR}/_ext/1140488617/drv_usart.o.d 
	@${RM} ${OBJECTDIR}/_ext/1140488617/drv_usart.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1140488617/drv_usart.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/rtos" -I"../src/packs/PIC32MZ1024EFK100_DFP" -I"../src/mips" -I"../src/third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MZ" -I"../src/third_party/rtos/FreeRTOS/Source/include" -Wall -MMD -MF "${OBJECTDIR}/_ext/1140488617/drv_usart.o.d" -o ${OBJECTDIR}/_ext/1140488617/drv_usart.o ../src/config/rtos/driver/usart/src/drv_usart.c    -DXPRJ_rtos=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/_ext/477899397/plib_clk.o: ../src/config/rtos/peripheral/clk/plib_clk.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/477899397" 
	@${RM} ${OBJECTDIR}/_ext/477899397/plib_clk.o.d 
	@${RM} ${OBJECTDIR}/_ext/477899397/plib_clk.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/477899397/plib_clk.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/rtos" -I"../src/packs/PIC32MZ1024EFK100_DFP" -I"../src/mips" -I"../src/third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MZ" -I"../src/third_party/rtos/FreeRTOS/Source/include" -Wall -MMD -MF "${OBJECTDIR}/_ext/477899397/plib_clk.o.d" -o ${OBJECTDIR}/_ext/477899397/plib_clk.o ../src/config/rtos/peripheral/clk/plib_clk.c    -DXPRJ_rtos=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/_ext/1930048648/plib_evic.o: ../src/config/rtos/peripheral/evic/plib_evic.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1930048648" 
	@${RM} ${OBJECTDIR}/_ext/1930048648/plib_evic.o.d 
	@${RM} ${OBJECTDIR}/_ext/1930048648/plib_evic.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1930048648/plib_evic.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/rtos" -I"../src/packs/PIC32MZ1024EFK100_DFP" -I"../src/mips" -I"../src/third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MZ" -I"../src/third_party/rtos/FreeRTOS/Source/include" -Wall -MMD -MF "${OBJECTDIR}/_ext/1930048648/plib_evic.o.d" -o ${OBJECTDIR}/_ext/1930048648/plib_evic.o ../src/config/rtos/peripheral/evic/plib_evic.c    -DXPRJ_rtos=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/_ext/1930102476/plib_gpio.o: ../src/config/rtos/peripheral/gpio/plib_gpio.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1930102476" 
	@${RM} ${OBJECTDIR}/_ext/1930102476/plib_gpio.o.d 
	@${RM} ${OBJECTDIR}/_ext/1930102476/plib_gpio.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1930102476/plib_gpio.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/rtos" -I"../src/packs/PIC32MZ1024EFK100_DFP" -I"../src/mips" -I"../src/third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MZ" -I"../src/third_party/rtos/FreeRTOS/Source/include" -Wall -MMD -MF "${OBJECTDIR}/_ext/1930102476/plib_gpio.o.d" -o ${OBJECTDIR}/_ext/1930102476/plib_gpio.o ../src/config/rtos/peripheral/gpio/plib_gpio.c    -DXPRJ_rtos=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/_ext/477903357/plib_i2c4.o: ../src/config/rtos/peripheral/i2c/plib_i2c4.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/477903357" 
	@${RM} ${OBJECTDIR}/_ext/477903357/plib_i2c4.o.d 
	@${RM} ${OBJECTDIR}/_ext/477903357/plib_i2c4.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/477903357/plib_i2c4.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/rtos" -I"../src/packs/PIC32MZ1024EFK100_DFP" -I"../src/mips" -I"../src/third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MZ" -I"../src/third_party/rtos/FreeRTOS/Source/include" -Wall -MMD -MF "${OBJECTDIR}/_ext/477903357/plib_i2c4.o.d" -o ${OBJECTDIR}/_ext/477903357/plib_i2c4.o ../src/config/rtos/peripheral/i2c/plib_i2c4.c    -DXPRJ_rtos=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/_ext/1930433823/plib_rtcc.o: ../src/config/rtos/peripheral/rtcc/plib_rtcc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1930433823" 
	@${RM} ${OBJECTDIR}/_ext/1930433823/plib_rtcc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1930433823/plib_rtcc.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1930433823/plib_rtcc.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/rtos" -I"../src/packs/PIC32MZ1024EFK100_DFP" -I"../src/mips" -I"../src/third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MZ" -I"../src/third_party/rtos/FreeRTOS/Source/include" -Wall -MMD -MF "${OBJECTDIR}/_ext/1930433823/plib_rtcc.o.d" -o ${OBJECTDIR}/_ext/1930433823/plib_rtcc.o ../src/config/rtos/peripheral/rtcc/plib_rtcc.c    -DXPRJ_rtos=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/_ext/477914895/plib_spi2.o: ../src/config/rtos/peripheral/spi/plib_spi2.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/477914895" 
	@${RM} ${OBJECTDIR}/_ext/477914895/plib_spi2.o.d 
	@${RM} ${OBJECTDIR}/_ext/477914895/plib_spi2.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/477914895/plib_spi2.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/rtos" -I"../src/packs/PIC32MZ1024EFK100_DFP" -I"../src/mips" -I"../src/third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MZ" -I"../src/third_party/rtos/FreeRTOS/Source/include" -Wall -MMD -MF "${OBJECTDIR}/_ext/477914895/plib_spi2.o.d" -o ${OBJECTDIR}/_ext/477914895/plib_spi2.o ../src/config/rtos/peripheral/spi/plib_spi2.c    -DXPRJ_rtos=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/_ext/1930505419/plib_uart1.o: ../src/config/rtos/peripheral/uart/plib_uart1.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1930505419" 
	@${RM} ${OBJECTDIR}/_ext/1930505419/plib_uart1.o.d 
	@${RM} ${OBJECTDIR}/_ext/1930505419/plib_uart1.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1930505419/plib_uart1.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/rtos" -I"../src/packs/PIC32MZ1024EFK100_DFP" -I"../src/mips" -I"../src/third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MZ" -I"../src/third_party/rtos/FreeRTOS/Source/include" -Wall -MMD -MF "${OBJECTDIR}/_ext/1930505419/plib_uart1.o.d" -o ${OBJECTDIR}/_ext/1930505419/plib_uart1.o ../src/config/rtos/peripheral/uart/plib_uart1.c    -DXPRJ_rtos=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/_ext/1216287405/xc32_monitor.o: ../src/config/rtos/stdio/xc32_monitor.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1216287405" 
	@${RM} ${OBJECTDIR}/_ext/1216287405/xc32_monitor.o.d 
	@${RM} ${OBJECTDIR}/_ext/1216287405/xc32_monitor.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1216287405/xc32_monitor.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/rtos" -I"../src/packs/PIC32MZ1024EFK100_DFP" -I"../src/mips" -I"../src/third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MZ" -I"../src/third_party/rtos/FreeRTOS/Source/include" -Wall -MMD -MF "${OBJECTDIR}/_ext/1216287405/xc32_monitor.o.d" -o ${OBJECTDIR}/_ext/1216287405/xc32_monitor.o ../src/config/rtos/stdio/xc32_monitor.c    -DXPRJ_rtos=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/_ext/689976462/sys_dma.o: ../src/config/rtos/system/dma/sys_dma.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/689976462" 
	@${RM} ${OBJECTDIR}/_ext/689976462/sys_dma.o.d 
	@${RM} ${OBJECTDIR}/_ext/689976462/sys_dma.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/689976462/sys_dma.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/rtos" -I"../src/packs/PIC32MZ1024EFK100_DFP" -I"../src/mips" -I"../src/third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MZ" -I"../src/third_party/rtos/FreeRTOS/Source/include" -Wall -MMD -MF "${OBJECTDIR}/_ext/689976462/sys_dma.o.d" -o ${OBJECTDIR}/_ext/689976462/sys_dma.o ../src/config/rtos/system/dma/sys_dma.c    -DXPRJ_rtos=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/_ext/1995564966/sys_int.o: ../src/config/rtos/system/int/src/sys_int.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1995564966" 
	@${RM} ${OBJECTDIR}/_ext/1995564966/sys_int.o.d 
	@${RM} ${OBJECTDIR}/_ext/1995564966/sys_int.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1995564966/sys_int.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/rtos" -I"../src/packs/PIC32MZ1024EFK100_DFP" -I"../src/mips" -I"../src/third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MZ" -I"../src/third_party/rtos/FreeRTOS/Source/include" -Wall -MMD -MF "${OBJECTDIR}/_ext/1995564966/sys_int.o.d" -o ${OBJECTDIR}/_ext/1995564966/sys_int.o ../src/config/rtos/system/int/src/sys_int.c    -DXPRJ_rtos=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/_ext/779632551/initialization.o: ../src/config/rtos/initialization.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/779632551" 
	@${RM} ${OBJECTDIR}/_ext/779632551/initialization.o.d 
	@${RM} ${OBJECTDIR}/_ext/779632551/initialization.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/779632551/initialization.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/rtos" -I"../src/packs/PIC32MZ1024EFK100_DFP" -I"../src/mips" -I"../src/third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MZ" -I"../src/third_party/rtos/FreeRTOS/Source/include" -Wall -MMD -MF "${OBJECTDIR}/_ext/779632551/initialization.o.d" -o ${OBJECTDIR}/_ext/779632551/initialization.o ../src/config/rtos/initialization.c    -DXPRJ_rtos=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/_ext/779632551/interrupts.o: ../src/config/rtos/interrupts.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/779632551" 
	@${RM} ${OBJECTDIR}/_ext/779632551/interrupts.o.d 
	@${RM} ${OBJECTDIR}/_ext/779632551/interrupts.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/779632551/interrupts.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/rtos" -I"../src/packs/PIC32MZ1024EFK100_DFP" -I"../src/mips" -I"../src/third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MZ" -I"../src/third_party/rtos/FreeRTOS/Source/include" -Wall -MMD -MF "${OBJECTDIR}/_ext/779632551/interrupts.o.d" -o ${OBJECTDIR}/_ext/779632551/interrupts.o ../src/config/rtos/interrupts.c    -DXPRJ_rtos=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/_ext/779632551/exceptions.o: ../src/config/rtos/exceptions.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/779632551" 
	@${RM} ${OBJECTDIR}/_ext/779632551/exceptions.o.d 
	@${RM} ${OBJECTDIR}/_ext/779632551/exceptions.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/779632551/exceptions.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/rtos" -I"../src/packs/PIC32MZ1024EFK100_DFP" -I"../src/mips" -I"../src/third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MZ" -I"../src/third_party/rtos/FreeRTOS/Source/include" -Wall -MMD -MF "${OBJECTDIR}/_ext/779632551/exceptions.o.d" -o ${OBJECTDIR}/_ext/779632551/exceptions.o ../src/config/rtos/exceptions.c    -DXPRJ_rtos=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/_ext/779632551/freertos_hooks.o: ../src/config/rtos/freertos_hooks.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/779632551" 
	@${RM} ${OBJECTDIR}/_ext/779632551/freertos_hooks.o.d 
	@${RM} ${OBJECTDIR}/_ext/779632551/freertos_hooks.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/779632551/freertos_hooks.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/rtos" -I"../src/packs/PIC32MZ1024EFK100_DFP" -I"../src/mips" -I"../src/third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MZ" -I"../src/third_party/rtos/FreeRTOS/Source/include" -Wall -MMD -MF "${OBJECTDIR}/_ext/779632551/freertos_hooks.o.d" -o ${OBJECTDIR}/_ext/779632551/freertos_hooks.o ../src/config/rtos/freertos_hooks.c    -DXPRJ_rtos=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/_ext/779632551/tasks.o: ../src/config/rtos/tasks.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/779632551" 
	@${RM} ${OBJECTDIR}/_ext/779632551/tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/779632551/tasks.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/779632551/tasks.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/rtos" -I"../src/packs/PIC32MZ1024EFK100_DFP" -I"../src/mips" -I"../src/third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MZ" -I"../src/third_party/rtos/FreeRTOS/Source/include" -Wall -MMD -MF "${OBJECTDIR}/_ext/779632551/tasks.o.d" -o ${OBJECTDIR}/_ext/779632551/tasks.o ../src/config/rtos/tasks.c    -DXPRJ_rtos=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/_ext/1665200909/heap_1.o: ../src/third_party/rtos/FreeRTOS/Source/portable/MemMang/heap_1.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1665200909" 
	@${RM} ${OBJECTDIR}/_ext/1665200909/heap_1.o.d 
	@${RM} ${OBJECTDIR}/_ext/1665200909/heap_1.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1665200909/heap_1.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/rtos" -I"../src/packs/PIC32MZ1024EFK100_DFP" -I"../src/mips" -I"../src/third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MZ" -I"../src/third_party/rtos/FreeRTOS/Source/include" -Wall -MMD -MF "${OBJECTDIR}/_ext/1665200909/heap_1.o.d" -o ${OBJECTDIR}/_ext/1665200909/heap_1.o ../src/third_party/rtos/FreeRTOS/Source/portable/MemMang/heap_1.c    -DXPRJ_rtos=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/_ext/951553246/port.o: ../src/third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MZ/port.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/951553246" 
	@${RM} ${OBJECTDIR}/_ext/951553246/port.o.d 
	@${RM} ${OBJECTDIR}/_ext/951553246/port.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/951553246/port.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/rtos" -I"../src/packs/PIC32MZ1024EFK100_DFP" -I"../src/mips" -I"../src/third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MZ" -I"../src/third_party/rtos/FreeRTOS/Source/include" -Wall -MMD -MF "${OBJECTDIR}/_ext/951553246/port.o.d" -o ${OBJECTDIR}/_ext/951553246/port.o ../src/third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MZ/port.c    -DXPRJ_rtos=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/_ext/404212886/croutine.o: ../src/third_party/rtos/FreeRTOS/Source/croutine.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/croutine.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/croutine.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/404212886/croutine.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/rtos" -I"../src/packs/PIC32MZ1024EFK100_DFP" -I"../src/mips" -I"../src/third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MZ" -I"../src/third_party/rtos/FreeRTOS/Source/include" -Wall -MMD -MF "${OBJECTDIR}/_ext/404212886/croutine.o.d" -o ${OBJECTDIR}/_ext/404212886/croutine.o ../src/third_party/rtos/FreeRTOS/Source/croutine.c    -DXPRJ_rtos=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/_ext/404212886/list.o: ../src/third_party/rtos/FreeRTOS/Source/list.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/list.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/list.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/404212886/list.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/rtos" -I"../src/packs/PIC32MZ1024EFK100_DFP" -I"../src/mips" -I"../src/third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MZ" -I"../src/third_party/rtos/FreeRTOS/Source/include" -Wall -MMD -MF "${OBJECTDIR}/_ext/404212886/list.o.d" -o ${OBJECTDIR}/_ext/404212886/list.o ../src/third_party/rtos/FreeRTOS/Source/list.c    -DXPRJ_rtos=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/_ext/404212886/queue.o: ../src/third_party/rtos/FreeRTOS/Source/queue.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/queue.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/queue.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/404212886/queue.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/rtos" -I"../src/packs/PIC32MZ1024EFK100_DFP" -I"../src/mips" -I"../src/third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MZ" -I"../src/third_party/rtos/FreeRTOS/Source/include" -Wall -MMD -MF "${OBJECTDIR}/_ext/404212886/queue.o.d" -o ${OBJECTDIR}/_ext/404212886/queue.o ../src/third_party/rtos/FreeRTOS/Source/queue.c    -DXPRJ_rtos=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/_ext/404212886/FreeRTOS_tasks.o: ../src/third_party/rtos/FreeRTOS/Source/FreeRTOS_tasks.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/FreeRTOS_tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/FreeRTOS_tasks.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/404212886/FreeRTOS_tasks.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/rtos" -I"../src/packs/PIC32MZ1024EFK100_DFP" -I"../src/mips" -I"../src/third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MZ" -I"../src/third_party/rtos/FreeRTOS/Source/include" -Wall -MMD -MF "${OBJECTDIR}/_ext/404212886/FreeRTOS_tasks.o.d" -o ${OBJECTDIR}/_ext/404212886/FreeRTOS_tasks.o ../src/third_party/rtos/FreeRTOS/Source/FreeRTOS_tasks.c    -DXPRJ_rtos=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/_ext/404212886/timers.o: ../src/third_party/rtos/FreeRTOS/Source/timers.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/timers.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/timers.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/404212886/timers.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/rtos" -I"../src/packs/PIC32MZ1024EFK100_DFP" -I"../src/mips" -I"../src/third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MZ" -I"../src/third_party/rtos/FreeRTOS/Source/include" -Wall -MMD -MF "${OBJECTDIR}/_ext/404212886/timers.o.d" -o ${OBJECTDIR}/_ext/404212886/timers.o ../src/third_party/rtos/FreeRTOS/Source/timers.c    -DXPRJ_rtos=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/_ext/404212886/event_groups.o: ../src/third_party/rtos/FreeRTOS/Source/event_groups.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/event_groups.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/event_groups.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/404212886/event_groups.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/rtos" -I"../src/packs/PIC32MZ1024EFK100_DFP" -I"../src/mips" -I"../src/third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MZ" -I"../src/third_party/rtos/FreeRTOS/Source/include" -Wall -MMD -MF "${OBJECTDIR}/_ext/404212886/event_groups.o.d" -o ${OBJECTDIR}/_ext/404212886/event_groups.o ../src/third_party/rtos/FreeRTOS/Source/event_groups.c    -DXPRJ_rtos=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/_ext/404212886/stream_buffer.o: ../src/third_party/rtos/FreeRTOS/Source/stream_buffer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/stream_buffer.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/stream_buffer.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/404212886/stream_buffer.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/rtos" -I"../src/packs/PIC32MZ1024EFK100_DFP" -I"../src/mips" -I"../src/third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MZ" -I"../src/third_party/rtos/FreeRTOS/Source/include" -Wall -MMD -MF "${OBJECTDIR}/_ext/404212886/stream_buffer.o.d" -o ${OBJECTDIR}/_ext/404212886/stream_buffer.o ../src/third_party/rtos/FreeRTOS/Source/stream_buffer.c    -DXPRJ_rtos=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/_ext/1207570693/osal_freertos.o: ../src/config/rtos/osal/osal_freertos.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1207570693" 
	@${RM} ${OBJECTDIR}/_ext/1207570693/osal_freertos.o.d 
	@${RM} ${OBJECTDIR}/_ext/1207570693/osal_freertos.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1207570693/osal_freertos.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/rtos" -I"../src/packs/PIC32MZ1024EFK100_DFP" -I"../src/mips" -I"../src/third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MZ" -I"../src/third_party/rtos/FreeRTOS/Source/include" -Wall -MMD -MF "${OBJECTDIR}/_ext/1207570693/osal_freertos.o.d" -o ${OBJECTDIR}/_ext/1207570693/osal_freertos.o ../src/config/rtos/osal/osal_freertos.c    -DXPRJ_rtos=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/_ext/1360937237/analogFrontEnd.o: ../src/analogFrontEnd.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/analogFrontEnd.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/analogFrontEnd.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360937237/analogFrontEnd.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/rtos" -I"../src/packs/PIC32MZ1024EFK100_DFP" -I"../src/mips" -I"../src/third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MZ" -I"../src/third_party/rtos/FreeRTOS/Source/include" -Wall -MMD -MF "${OBJECTDIR}/_ext/1360937237/analogFrontEnd.o.d" -o ${OBJECTDIR}/_ext/1360937237/analogFrontEnd.o ../src/analogFrontEnd.c    -DXPRJ_rtos=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/_ext/1360937237/wirelessCom.o: ../src/wirelessCom.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/wirelessCom.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/wirelessCom.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360937237/wirelessCom.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/rtos" -I"../src/packs/PIC32MZ1024EFK100_DFP" -I"../src/mips" -I"../src/third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MZ" -I"../src/third_party/rtos/FreeRTOS/Source/include" -Wall -MMD -MF "${OBJECTDIR}/_ext/1360937237/wirelessCom.o.d" -o ${OBJECTDIR}/_ext/1360937237/wirelessCom.o ../src/wirelessCom.c    -DXPRJ_rtos=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/_ext/1360937237/PIDcontroller.o: ../src/PIDcontroller.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/PIDcontroller.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/PIDcontroller.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360937237/PIDcontroller.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/rtos" -I"../src/packs/PIC32MZ1024EFK100_DFP" -I"../src/mips" -I"../src/third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MZ" -I"../src/third_party/rtos/FreeRTOS/Source/include" -Wall -MMD -MF "${OBJECTDIR}/_ext/1360937237/PIDcontroller.o.d" -o ${OBJECTDIR}/_ext/1360937237/PIDcontroller.o ../src/PIDcontroller.c    -DXPRJ_rtos=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/_ext/1360937237/main.o: ../src/main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360937237/main.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/rtos" -I"../src/packs/PIC32MZ1024EFK100_DFP" -I"../src/mips" -I"../src/third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MZ" -I"../src/third_party/rtos/FreeRTOS/Source/include" -Wall -MMD -MF "${OBJECTDIR}/_ext/1360937237/main.o.d" -o ${OBJECTDIR}/_ext/1360937237/main.o ../src/main.c    -DXPRJ_rtos=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/_ext/1360937237/app.o: ../src/app.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360937237/app.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/rtos" -I"../src/packs/PIC32MZ1024EFK100_DFP" -I"../src/mips" -I"../src/third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MZ" -I"../src/third_party/rtos/FreeRTOS/Source/include" -Wall -MMD -MF "${OBJECTDIR}/_ext/1360937237/app.o.d" -o ${OBJECTDIR}/_ext/1360937237/app.o ../src/app.c    -DXPRJ_rtos=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/_ext/1360937237/processControl.o: ../src/processControl.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/processControl.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/processControl.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360937237/processControl.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/rtos" -I"../src/packs/PIC32MZ1024EFK100_DFP" -I"../src/mips" -I"../src/third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MZ" -I"../src/third_party/rtos/FreeRTOS/Source/include" -Wall -MMD -MF "${OBJECTDIR}/_ext/1360937237/processControl.o.d" -o ${OBJECTDIR}/_ext/1360937237/processControl.o ../src/processControl.c    -DXPRJ_rtos=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
else
${OBJECTDIR}/_ext/576118910/drv_i2c.o: ../src/config/rtos/driver/i2c/src/drv_i2c.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/576118910" 
	@${RM} ${OBJECTDIR}/_ext/576118910/drv_i2c.o.d 
	@${RM} ${OBJECTDIR}/_ext/576118910/drv_i2c.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/576118910/drv_i2c.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/rtos" -I"../src/packs/PIC32MZ1024EFK100_DFP" -I"../src/mips" -I"../src/third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MZ" -I"../src/third_party/rtos/FreeRTOS/Source/include" -Wall -MMD -MF "${OBJECTDIR}/_ext/576118910/drv_i2c.o.d" -o ${OBJECTDIR}/_ext/576118910/drv_i2c.o ../src/config/rtos/driver/i2c/src/drv_i2c.c    -DXPRJ_rtos=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/_ext/1653197680/drv_spi.o: ../src/config/rtos/driver/spi/src/drv_spi.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1653197680" 
	@${RM} ${OBJECTDIR}/_ext/1653197680/drv_spi.o.d 
	@${RM} ${OBJECTDIR}/_ext/1653197680/drv_spi.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1653197680/drv_spi.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/rtos" -I"../src/packs/PIC32MZ1024EFK100_DFP" -I"../src/mips" -I"../src/third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MZ" -I"../src/third_party/rtos/FreeRTOS/Source/include" -Wall -MMD -MF "${OBJECTDIR}/_ext/1653197680/drv_spi.o.d" -o ${OBJECTDIR}/_ext/1653197680/drv_spi.o ../src/config/rtos/driver/spi/src/drv_spi.c    -DXPRJ_rtos=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/_ext/1140488617/drv_usart.o: ../src/config/rtos/driver/usart/src/drv_usart.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1140488617" 
	@${RM} ${OBJECTDIR}/_ext/1140488617/drv_usart.o.d 
	@${RM} ${OBJECTDIR}/_ext/1140488617/drv_usart.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1140488617/drv_usart.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/rtos" -I"../src/packs/PIC32MZ1024EFK100_DFP" -I"../src/mips" -I"../src/third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MZ" -I"../src/third_party/rtos/FreeRTOS/Source/include" -Wall -MMD -MF "${OBJECTDIR}/_ext/1140488617/drv_usart.o.d" -o ${OBJECTDIR}/_ext/1140488617/drv_usart.o ../src/config/rtos/driver/usart/src/drv_usart.c    -DXPRJ_rtos=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/_ext/477899397/plib_clk.o: ../src/config/rtos/peripheral/clk/plib_clk.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/477899397" 
	@${RM} ${OBJECTDIR}/_ext/477899397/plib_clk.o.d 
	@${RM} ${OBJECTDIR}/_ext/477899397/plib_clk.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/477899397/plib_clk.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/rtos" -I"../src/packs/PIC32MZ1024EFK100_DFP" -I"../src/mips" -I"../src/third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MZ" -I"../src/third_party/rtos/FreeRTOS/Source/include" -Wall -MMD -MF "${OBJECTDIR}/_ext/477899397/plib_clk.o.d" -o ${OBJECTDIR}/_ext/477899397/plib_clk.o ../src/config/rtos/peripheral/clk/plib_clk.c    -DXPRJ_rtos=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/_ext/1930048648/plib_evic.o: ../src/config/rtos/peripheral/evic/plib_evic.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1930048648" 
	@${RM} ${OBJECTDIR}/_ext/1930048648/plib_evic.o.d 
	@${RM} ${OBJECTDIR}/_ext/1930048648/plib_evic.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1930048648/plib_evic.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/rtos" -I"../src/packs/PIC32MZ1024EFK100_DFP" -I"../src/mips" -I"../src/third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MZ" -I"../src/third_party/rtos/FreeRTOS/Source/include" -Wall -MMD -MF "${OBJECTDIR}/_ext/1930048648/plib_evic.o.d" -o ${OBJECTDIR}/_ext/1930048648/plib_evic.o ../src/config/rtos/peripheral/evic/plib_evic.c    -DXPRJ_rtos=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/_ext/1930102476/plib_gpio.o: ../src/config/rtos/peripheral/gpio/plib_gpio.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1930102476" 
	@${RM} ${OBJECTDIR}/_ext/1930102476/plib_gpio.o.d 
	@${RM} ${OBJECTDIR}/_ext/1930102476/plib_gpio.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1930102476/plib_gpio.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/rtos" -I"../src/packs/PIC32MZ1024EFK100_DFP" -I"../src/mips" -I"../src/third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MZ" -I"../src/third_party/rtos/FreeRTOS/Source/include" -Wall -MMD -MF "${OBJECTDIR}/_ext/1930102476/plib_gpio.o.d" -o ${OBJECTDIR}/_ext/1930102476/plib_gpio.o ../src/config/rtos/peripheral/gpio/plib_gpio.c    -DXPRJ_rtos=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/_ext/477903357/plib_i2c4.o: ../src/config/rtos/peripheral/i2c/plib_i2c4.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/477903357" 
	@${RM} ${OBJECTDIR}/_ext/477903357/plib_i2c4.o.d 
	@${RM} ${OBJECTDIR}/_ext/477903357/plib_i2c4.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/477903357/plib_i2c4.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/rtos" -I"../src/packs/PIC32MZ1024EFK100_DFP" -I"../src/mips" -I"../src/third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MZ" -I"../src/third_party/rtos/FreeRTOS/Source/include" -Wall -MMD -MF "${OBJECTDIR}/_ext/477903357/plib_i2c4.o.d" -o ${OBJECTDIR}/_ext/477903357/plib_i2c4.o ../src/config/rtos/peripheral/i2c/plib_i2c4.c    -DXPRJ_rtos=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/_ext/1930433823/plib_rtcc.o: ../src/config/rtos/peripheral/rtcc/plib_rtcc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1930433823" 
	@${RM} ${OBJECTDIR}/_ext/1930433823/plib_rtcc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1930433823/plib_rtcc.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1930433823/plib_rtcc.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/rtos" -I"../src/packs/PIC32MZ1024EFK100_DFP" -I"../src/mips" -I"../src/third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MZ" -I"../src/third_party/rtos/FreeRTOS/Source/include" -Wall -MMD -MF "${OBJECTDIR}/_ext/1930433823/plib_rtcc.o.d" -o ${OBJECTDIR}/_ext/1930433823/plib_rtcc.o ../src/config/rtos/peripheral/rtcc/plib_rtcc.c    -DXPRJ_rtos=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/_ext/477914895/plib_spi2.o: ../src/config/rtos/peripheral/spi/plib_spi2.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/477914895" 
	@${RM} ${OBJECTDIR}/_ext/477914895/plib_spi2.o.d 
	@${RM} ${OBJECTDIR}/_ext/477914895/plib_spi2.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/477914895/plib_spi2.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/rtos" -I"../src/packs/PIC32MZ1024EFK100_DFP" -I"../src/mips" -I"../src/third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MZ" -I"../src/third_party/rtos/FreeRTOS/Source/include" -Wall -MMD -MF "${OBJECTDIR}/_ext/477914895/plib_spi2.o.d" -o ${OBJECTDIR}/_ext/477914895/plib_spi2.o ../src/config/rtos/peripheral/spi/plib_spi2.c    -DXPRJ_rtos=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/_ext/1930505419/plib_uart1.o: ../src/config/rtos/peripheral/uart/plib_uart1.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1930505419" 
	@${RM} ${OBJECTDIR}/_ext/1930505419/plib_uart1.o.d 
	@${RM} ${OBJECTDIR}/_ext/1930505419/plib_uart1.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1930505419/plib_uart1.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/rtos" -I"../src/packs/PIC32MZ1024EFK100_DFP" -I"../src/mips" -I"../src/third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MZ" -I"../src/third_party/rtos/FreeRTOS/Source/include" -Wall -MMD -MF "${OBJECTDIR}/_ext/1930505419/plib_uart1.o.d" -o ${OBJECTDIR}/_ext/1930505419/plib_uart1.o ../src/config/rtos/peripheral/uart/plib_uart1.c    -DXPRJ_rtos=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/_ext/1216287405/xc32_monitor.o: ../src/config/rtos/stdio/xc32_monitor.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1216287405" 
	@${RM} ${OBJECTDIR}/_ext/1216287405/xc32_monitor.o.d 
	@${RM} ${OBJECTDIR}/_ext/1216287405/xc32_monitor.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1216287405/xc32_monitor.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/rtos" -I"../src/packs/PIC32MZ1024EFK100_DFP" -I"../src/mips" -I"../src/third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MZ" -I"../src/third_party/rtos/FreeRTOS/Source/include" -Wall -MMD -MF "${OBJECTDIR}/_ext/1216287405/xc32_monitor.o.d" -o ${OBJECTDIR}/_ext/1216287405/xc32_monitor.o ../src/config/rtos/stdio/xc32_monitor.c    -DXPRJ_rtos=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/_ext/689976462/sys_dma.o: ../src/config/rtos/system/dma/sys_dma.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/689976462" 
	@${RM} ${OBJECTDIR}/_ext/689976462/sys_dma.o.d 
	@${RM} ${OBJECTDIR}/_ext/689976462/sys_dma.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/689976462/sys_dma.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/rtos" -I"../src/packs/PIC32MZ1024EFK100_DFP" -I"../src/mips" -I"../src/third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MZ" -I"../src/third_party/rtos/FreeRTOS/Source/include" -Wall -MMD -MF "${OBJECTDIR}/_ext/689976462/sys_dma.o.d" -o ${OBJECTDIR}/_ext/689976462/sys_dma.o ../src/config/rtos/system/dma/sys_dma.c    -DXPRJ_rtos=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/_ext/1995564966/sys_int.o: ../src/config/rtos/system/int/src/sys_int.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1995564966" 
	@${RM} ${OBJECTDIR}/_ext/1995564966/sys_int.o.d 
	@${RM} ${OBJECTDIR}/_ext/1995564966/sys_int.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1995564966/sys_int.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/rtos" -I"../src/packs/PIC32MZ1024EFK100_DFP" -I"../src/mips" -I"../src/third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MZ" -I"../src/third_party/rtos/FreeRTOS/Source/include" -Wall -MMD -MF "${OBJECTDIR}/_ext/1995564966/sys_int.o.d" -o ${OBJECTDIR}/_ext/1995564966/sys_int.o ../src/config/rtos/system/int/src/sys_int.c    -DXPRJ_rtos=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/_ext/779632551/initialization.o: ../src/config/rtos/initialization.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/779632551" 
	@${RM} ${OBJECTDIR}/_ext/779632551/initialization.o.d 
	@${RM} ${OBJECTDIR}/_ext/779632551/initialization.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/779632551/initialization.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/rtos" -I"../src/packs/PIC32MZ1024EFK100_DFP" -I"../src/mips" -I"../src/third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MZ" -I"../src/third_party/rtos/FreeRTOS/Source/include" -Wall -MMD -MF "${OBJECTDIR}/_ext/779632551/initialization.o.d" -o ${OBJECTDIR}/_ext/779632551/initialization.o ../src/config/rtos/initialization.c    -DXPRJ_rtos=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/_ext/779632551/interrupts.o: ../src/config/rtos/interrupts.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/779632551" 
	@${RM} ${OBJECTDIR}/_ext/779632551/interrupts.o.d 
	@${RM} ${OBJECTDIR}/_ext/779632551/interrupts.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/779632551/interrupts.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/rtos" -I"../src/packs/PIC32MZ1024EFK100_DFP" -I"../src/mips" -I"../src/third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MZ" -I"../src/third_party/rtos/FreeRTOS/Source/include" -Wall -MMD -MF "${OBJECTDIR}/_ext/779632551/interrupts.o.d" -o ${OBJECTDIR}/_ext/779632551/interrupts.o ../src/config/rtos/interrupts.c    -DXPRJ_rtos=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/_ext/779632551/exceptions.o: ../src/config/rtos/exceptions.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/779632551" 
	@${RM} ${OBJECTDIR}/_ext/779632551/exceptions.o.d 
	@${RM} ${OBJECTDIR}/_ext/779632551/exceptions.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/779632551/exceptions.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/rtos" -I"../src/packs/PIC32MZ1024EFK100_DFP" -I"../src/mips" -I"../src/third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MZ" -I"../src/third_party/rtos/FreeRTOS/Source/include" -Wall -MMD -MF "${OBJECTDIR}/_ext/779632551/exceptions.o.d" -o ${OBJECTDIR}/_ext/779632551/exceptions.o ../src/config/rtos/exceptions.c    -DXPRJ_rtos=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/_ext/779632551/freertos_hooks.o: ../src/config/rtos/freertos_hooks.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/779632551" 
	@${RM} ${OBJECTDIR}/_ext/779632551/freertos_hooks.o.d 
	@${RM} ${OBJECTDIR}/_ext/779632551/freertos_hooks.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/779632551/freertos_hooks.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/rtos" -I"../src/packs/PIC32MZ1024EFK100_DFP" -I"../src/mips" -I"../src/third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MZ" -I"../src/third_party/rtos/FreeRTOS/Source/include" -Wall -MMD -MF "${OBJECTDIR}/_ext/779632551/freertos_hooks.o.d" -o ${OBJECTDIR}/_ext/779632551/freertos_hooks.o ../src/config/rtos/freertos_hooks.c    -DXPRJ_rtos=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/_ext/779632551/tasks.o: ../src/config/rtos/tasks.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/779632551" 
	@${RM} ${OBJECTDIR}/_ext/779632551/tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/779632551/tasks.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/779632551/tasks.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/rtos" -I"../src/packs/PIC32MZ1024EFK100_DFP" -I"../src/mips" -I"../src/third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MZ" -I"../src/third_party/rtos/FreeRTOS/Source/include" -Wall -MMD -MF "${OBJECTDIR}/_ext/779632551/tasks.o.d" -o ${OBJECTDIR}/_ext/779632551/tasks.o ../src/config/rtos/tasks.c    -DXPRJ_rtos=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/_ext/1665200909/heap_1.o: ../src/third_party/rtos/FreeRTOS/Source/portable/MemMang/heap_1.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1665200909" 
	@${RM} ${OBJECTDIR}/_ext/1665200909/heap_1.o.d 
	@${RM} ${OBJECTDIR}/_ext/1665200909/heap_1.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1665200909/heap_1.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/rtos" -I"../src/packs/PIC32MZ1024EFK100_DFP" -I"../src/mips" -I"../src/third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MZ" -I"../src/third_party/rtos/FreeRTOS/Source/include" -Wall -MMD -MF "${OBJECTDIR}/_ext/1665200909/heap_1.o.d" -o ${OBJECTDIR}/_ext/1665200909/heap_1.o ../src/third_party/rtos/FreeRTOS/Source/portable/MemMang/heap_1.c    -DXPRJ_rtos=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/_ext/951553246/port.o: ../src/third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MZ/port.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/951553246" 
	@${RM} ${OBJECTDIR}/_ext/951553246/port.o.d 
	@${RM} ${OBJECTDIR}/_ext/951553246/port.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/951553246/port.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/rtos" -I"../src/packs/PIC32MZ1024EFK100_DFP" -I"../src/mips" -I"../src/third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MZ" -I"../src/third_party/rtos/FreeRTOS/Source/include" -Wall -MMD -MF "${OBJECTDIR}/_ext/951553246/port.o.d" -o ${OBJECTDIR}/_ext/951553246/port.o ../src/third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MZ/port.c    -DXPRJ_rtos=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/_ext/404212886/croutine.o: ../src/third_party/rtos/FreeRTOS/Source/croutine.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/croutine.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/croutine.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/404212886/croutine.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/rtos" -I"../src/packs/PIC32MZ1024EFK100_DFP" -I"../src/mips" -I"../src/third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MZ" -I"../src/third_party/rtos/FreeRTOS/Source/include" -Wall -MMD -MF "${OBJECTDIR}/_ext/404212886/croutine.o.d" -o ${OBJECTDIR}/_ext/404212886/croutine.o ../src/third_party/rtos/FreeRTOS/Source/croutine.c    -DXPRJ_rtos=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/_ext/404212886/list.o: ../src/third_party/rtos/FreeRTOS/Source/list.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/list.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/list.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/404212886/list.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/rtos" -I"../src/packs/PIC32MZ1024EFK100_DFP" -I"../src/mips" -I"../src/third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MZ" -I"../src/third_party/rtos/FreeRTOS/Source/include" -Wall -MMD -MF "${OBJECTDIR}/_ext/404212886/list.o.d" -o ${OBJECTDIR}/_ext/404212886/list.o ../src/third_party/rtos/FreeRTOS/Source/list.c    -DXPRJ_rtos=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/_ext/404212886/queue.o: ../src/third_party/rtos/FreeRTOS/Source/queue.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/queue.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/queue.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/404212886/queue.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/rtos" -I"../src/packs/PIC32MZ1024EFK100_DFP" -I"../src/mips" -I"../src/third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MZ" -I"../src/third_party/rtos/FreeRTOS/Source/include" -Wall -MMD -MF "${OBJECTDIR}/_ext/404212886/queue.o.d" -o ${OBJECTDIR}/_ext/404212886/queue.o ../src/third_party/rtos/FreeRTOS/Source/queue.c    -DXPRJ_rtos=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/_ext/404212886/FreeRTOS_tasks.o: ../src/third_party/rtos/FreeRTOS/Source/FreeRTOS_tasks.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/FreeRTOS_tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/FreeRTOS_tasks.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/404212886/FreeRTOS_tasks.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/rtos" -I"../src/packs/PIC32MZ1024EFK100_DFP" -I"../src/mips" -I"../src/third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MZ" -I"../src/third_party/rtos/FreeRTOS/Source/include" -Wall -MMD -MF "${OBJECTDIR}/_ext/404212886/FreeRTOS_tasks.o.d" -o ${OBJECTDIR}/_ext/404212886/FreeRTOS_tasks.o ../src/third_party/rtos/FreeRTOS/Source/FreeRTOS_tasks.c    -DXPRJ_rtos=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/_ext/404212886/timers.o: ../src/third_party/rtos/FreeRTOS/Source/timers.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/timers.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/timers.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/404212886/timers.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/rtos" -I"../src/packs/PIC32MZ1024EFK100_DFP" -I"../src/mips" -I"../src/third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MZ" -I"../src/third_party/rtos/FreeRTOS/Source/include" -Wall -MMD -MF "${OBJECTDIR}/_ext/404212886/timers.o.d" -o ${OBJECTDIR}/_ext/404212886/timers.o ../src/third_party/rtos/FreeRTOS/Source/timers.c    -DXPRJ_rtos=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/_ext/404212886/event_groups.o: ../src/third_party/rtos/FreeRTOS/Source/event_groups.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/event_groups.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/event_groups.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/404212886/event_groups.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/rtos" -I"../src/packs/PIC32MZ1024EFK100_DFP" -I"../src/mips" -I"../src/third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MZ" -I"../src/third_party/rtos/FreeRTOS/Source/include" -Wall -MMD -MF "${OBJECTDIR}/_ext/404212886/event_groups.o.d" -o ${OBJECTDIR}/_ext/404212886/event_groups.o ../src/third_party/rtos/FreeRTOS/Source/event_groups.c    -DXPRJ_rtos=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/_ext/404212886/stream_buffer.o: ../src/third_party/rtos/FreeRTOS/Source/stream_buffer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/stream_buffer.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/stream_buffer.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/404212886/stream_buffer.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/rtos" -I"../src/packs/PIC32MZ1024EFK100_DFP" -I"../src/mips" -I"../src/third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MZ" -I"../src/third_party/rtos/FreeRTOS/Source/include" -Wall -MMD -MF "${OBJECTDIR}/_ext/404212886/stream_buffer.o.d" -o ${OBJECTDIR}/_ext/404212886/stream_buffer.o ../src/third_party/rtos/FreeRTOS/Source/stream_buffer.c    -DXPRJ_rtos=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/_ext/1207570693/osal_freertos.o: ../src/config/rtos/osal/osal_freertos.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1207570693" 
	@${RM} ${OBJECTDIR}/_ext/1207570693/osal_freertos.o.d 
	@${RM} ${OBJECTDIR}/_ext/1207570693/osal_freertos.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1207570693/osal_freertos.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/rtos" -I"../src/packs/PIC32MZ1024EFK100_DFP" -I"../src/mips" -I"../src/third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MZ" -I"../src/third_party/rtos/FreeRTOS/Source/include" -Wall -MMD -MF "${OBJECTDIR}/_ext/1207570693/osal_freertos.o.d" -o ${OBJECTDIR}/_ext/1207570693/osal_freertos.o ../src/config/rtos/osal/osal_freertos.c    -DXPRJ_rtos=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/_ext/1360937237/analogFrontEnd.o: ../src/analogFrontEnd.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/analogFrontEnd.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/analogFrontEnd.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360937237/analogFrontEnd.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/rtos" -I"../src/packs/PIC32MZ1024EFK100_DFP" -I"../src/mips" -I"../src/third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MZ" -I"../src/third_party/rtos/FreeRTOS/Source/include" -Wall -MMD -MF "${OBJECTDIR}/_ext/1360937237/analogFrontEnd.o.d" -o ${OBJECTDIR}/_ext/1360937237/analogFrontEnd.o ../src/analogFrontEnd.c    -DXPRJ_rtos=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/_ext/1360937237/wirelessCom.o: ../src/wirelessCom.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/wirelessCom.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/wirelessCom.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360937237/wirelessCom.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/rtos" -I"../src/packs/PIC32MZ1024EFK100_DFP" -I"../src/mips" -I"../src/third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MZ" -I"../src/third_party/rtos/FreeRTOS/Source/include" -Wall -MMD -MF "${OBJECTDIR}/_ext/1360937237/wirelessCom.o.d" -o ${OBJECTDIR}/_ext/1360937237/wirelessCom.o ../src/wirelessCom.c    -DXPRJ_rtos=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/_ext/1360937237/PIDcontroller.o: ../src/PIDcontroller.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/PIDcontroller.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/PIDcontroller.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360937237/PIDcontroller.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/rtos" -I"../src/packs/PIC32MZ1024EFK100_DFP" -I"../src/mips" -I"../src/third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MZ" -I"../src/third_party/rtos/FreeRTOS/Source/include" -Wall -MMD -MF "${OBJECTDIR}/_ext/1360937237/PIDcontroller.o.d" -o ${OBJECTDIR}/_ext/1360937237/PIDcontroller.o ../src/PIDcontroller.c    -DXPRJ_rtos=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/_ext/1360937237/main.o: ../src/main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360937237/main.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/rtos" -I"../src/packs/PIC32MZ1024EFK100_DFP" -I"../src/mips" -I"../src/third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MZ" -I"../src/third_party/rtos/FreeRTOS/Source/include" -Wall -MMD -MF "${OBJECTDIR}/_ext/1360937237/main.o.d" -o ${OBJECTDIR}/_ext/1360937237/main.o ../src/main.c    -DXPRJ_rtos=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/_ext/1360937237/app.o: ../src/app.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360937237/app.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/rtos" -I"../src/packs/PIC32MZ1024EFK100_DFP" -I"../src/mips" -I"../src/third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MZ" -I"../src/third_party/rtos/FreeRTOS/Source/include" -Wall -MMD -MF "${OBJECTDIR}/_ext/1360937237/app.o.d" -o ${OBJECTDIR}/_ext/1360937237/app.o ../src/app.c    -DXPRJ_rtos=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
${OBJECTDIR}/_ext/1360937237/processControl.o: ../src/processControl.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/processControl.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/processControl.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360937237/processControl.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/config/rtos" -I"../src/packs/PIC32MZ1024EFK100_DFP" -I"../src/mips" -I"../src/third_party/rtos/FreeRTOS/Source/portable/MPLAB/PIC32MZ" -I"../src/third_party/rtos/FreeRTOS/Source/include" -Wall -MMD -MF "${OBJECTDIR}/_ext/1360937237/processControl.o.d" -o ${OBJECTDIR}/_ext/1360937237/processControl.o ../src/processControl.c    -DXPRJ_rtos=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp=${DFP_DIR}
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/RTOS-test.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -g -mdebugger -D__MPLAB_DEBUGGER_PK3=1 -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/RTOS-test.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_rtos=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)   -mreserve=data@0x0:0x37F   -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D=__DEBUG_D,--defsym=__MPLAB_DEBUGGER_PK3=1,--defsym=_min_heap_size=512,--gc-sections,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml -mdfp=${DFP_DIR}
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/RTOS-test.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/RTOS-test.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_rtos=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=_min_heap_size=512,--gc-sections,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml -mdfp=${DFP_DIR}
	${MP_CC_DIR}\\xc32-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/RTOS-test.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/rtos
	${RM} -r dist/rtos

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
