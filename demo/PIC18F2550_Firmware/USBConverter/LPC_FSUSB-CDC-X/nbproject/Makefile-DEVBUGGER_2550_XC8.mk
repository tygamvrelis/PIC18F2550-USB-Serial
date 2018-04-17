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
ifeq "$(wildcard nbproject/Makefile-local-DEVBUGGER_2550_XC8.mk)" "nbproject/Makefile-local-DEVBUGGER_2550_XC8.mk"
include nbproject/Makefile-local-DEVBUGGER_2550_XC8.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=DEVBUGGER_2550_XC8
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/LPC_FSUSB-CDC-X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/LPC_FSUSB-CDC-X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=--mafrlcsj
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
SOURCEFILES_QUOTED_IF_SPACED=usb_descriptors.c system.c main_cdc.c main.c ../BSP-FILES/pdusb_2550.c ../mla/v2017_03_06/framework/usb/src/usb_device.c ../mla/v2017_03_06/framework/usb/src/usb_device_cdc.c ../mla/v2017_03_06/framework/usb/src/app_device_cdc_to_uart.c ../mla/v2017_03_06/framework/usb/src/usart.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/usb_descriptors.p1 ${OBJECTDIR}/system.p1 ${OBJECTDIR}/main_cdc.p1 ${OBJECTDIR}/main.p1 ${OBJECTDIR}/_ext/1126228070/pdusb_2550.p1 ${OBJECTDIR}/_ext/475364710/usb_device.p1 ${OBJECTDIR}/_ext/475364710/usb_device_cdc.p1 ${OBJECTDIR}/_ext/475364710/app_device_cdc_to_uart.p1 ${OBJECTDIR}/_ext/475364710/usart.p1
POSSIBLE_DEPFILES=${OBJECTDIR}/usb_descriptors.p1.d ${OBJECTDIR}/system.p1.d ${OBJECTDIR}/main_cdc.p1.d ${OBJECTDIR}/main.p1.d ${OBJECTDIR}/_ext/1126228070/pdusb_2550.p1.d ${OBJECTDIR}/_ext/475364710/usb_device.p1.d ${OBJECTDIR}/_ext/475364710/usb_device_cdc.p1.d ${OBJECTDIR}/_ext/475364710/app_device_cdc_to_uart.p1.d ${OBJECTDIR}/_ext/475364710/usart.p1.d

# Object Files
OBJECTFILES=${OBJECTDIR}/usb_descriptors.p1 ${OBJECTDIR}/system.p1 ${OBJECTDIR}/main_cdc.p1 ${OBJECTDIR}/main.p1 ${OBJECTDIR}/_ext/1126228070/pdusb_2550.p1 ${OBJECTDIR}/_ext/475364710/usb_device.p1 ${OBJECTDIR}/_ext/475364710/usb_device_cdc.p1 ${OBJECTDIR}/_ext/475364710/app_device_cdc_to_uart.p1 ${OBJECTDIR}/_ext/475364710/usart.p1

# Source Files
SOURCEFILES=usb_descriptors.c system.c main_cdc.c main.c ../BSP-FILES/pdusb_2550.c ../mla/v2017_03_06/framework/usb/src/usb_device.c ../mla/v2017_03_06/framework/usb/src/usb_device_cdc.c ../mla/v2017_03_06/framework/usb/src/app_device_cdc_to_uart.c ../mla/v2017_03_06/framework/usb/src/usart.c


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
	${MAKE}  -f nbproject/Makefile-DEVBUGGER_2550_XC8.mk dist/${CND_CONF}/${IMAGE_TYPE}/LPC_FSUSB-CDC-X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=18F2550
# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/usb_descriptors.p1: usb_descriptors.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/usb_descriptors.p1.d 
	@${RM} ${OBJECTDIR}/usb_descriptors.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=pickit3  --double=24 --float=24 --emi=wordwrite --opt=+asm,+asmfile,-speed,+space,-debug,-local --addrqual=ignore --mode=free -P -N255 -I"../mla/v2017_03_06/framework/usb/inc" -I"./plib" -I"./" --warn=0 --asmlist -DXPRJ_DEVBUGGER_2550_XC8=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,+plib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/usb_descriptors.p1  usb_descriptors.c 
	@-${MV} ${OBJECTDIR}/usb_descriptors.d ${OBJECTDIR}/usb_descriptors.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/usb_descriptors.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/system.p1: system.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/system.p1.d 
	@${RM} ${OBJECTDIR}/system.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=pickit3  --double=24 --float=24 --emi=wordwrite --opt=+asm,+asmfile,-speed,+space,-debug,-local --addrqual=ignore --mode=free -P -N255 -I"../mla/v2017_03_06/framework/usb/inc" -I"./plib" -I"./" --warn=0 --asmlist -DXPRJ_DEVBUGGER_2550_XC8=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,+plib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/system.p1  system.c 
	@-${MV} ${OBJECTDIR}/system.d ${OBJECTDIR}/system.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/system.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/main_cdc.p1: main_cdc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main_cdc.p1.d 
	@${RM} ${OBJECTDIR}/main_cdc.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=pickit3  --double=24 --float=24 --emi=wordwrite --opt=+asm,+asmfile,-speed,+space,-debug,-local --addrqual=ignore --mode=free -P -N255 -I"../mla/v2017_03_06/framework/usb/inc" -I"./plib" -I"./" --warn=0 --asmlist -DXPRJ_DEVBUGGER_2550_XC8=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,+plib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/main_cdc.p1  main_cdc.c 
	@-${MV} ${OBJECTDIR}/main_cdc.d ${OBJECTDIR}/main_cdc.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/main_cdc.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/main.p1: main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.p1.d 
	@${RM} ${OBJECTDIR}/main.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=pickit3  --double=24 --float=24 --emi=wordwrite --opt=+asm,+asmfile,-speed,+space,-debug,-local --addrqual=ignore --mode=free -P -N255 -I"../mla/v2017_03_06/framework/usb/inc" -I"./plib" -I"./" --warn=0 --asmlist -DXPRJ_DEVBUGGER_2550_XC8=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,+plib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/main.p1  main.c 
	@-${MV} ${OBJECTDIR}/main.d ${OBJECTDIR}/main.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/main.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1126228070/pdusb_2550.p1: ../BSP-FILES/pdusb_2550.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1126228070" 
	@${RM} ${OBJECTDIR}/_ext/1126228070/pdusb_2550.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1126228070/pdusb_2550.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=pickit3  --double=24 --float=24 --emi=wordwrite --opt=+asm,+asmfile,-speed,+space,-debug,-local --addrqual=ignore --mode=free -P -N255 -I"../mla/v2017_03_06/framework/usb/inc" -I"./plib" -I"./" --warn=0 --asmlist -DXPRJ_DEVBUGGER_2550_XC8=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,+plib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/_ext/1126228070/pdusb_2550.p1  ../BSP-FILES/pdusb_2550.c 
	@-${MV} ${OBJECTDIR}/_ext/1126228070/pdusb_2550.d ${OBJECTDIR}/_ext/1126228070/pdusb_2550.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1126228070/pdusb_2550.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/475364710/usb_device.p1: ../mla/v2017_03_06/framework/usb/src/usb_device.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/475364710" 
	@${RM} ${OBJECTDIR}/_ext/475364710/usb_device.p1.d 
	@${RM} ${OBJECTDIR}/_ext/475364710/usb_device.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=pickit3  --double=24 --float=24 --emi=wordwrite --opt=+asm,+asmfile,-speed,+space,-debug,-local --addrqual=ignore --mode=free -P -N255 -I"../mla/v2017_03_06/framework/usb/inc" -I"./plib" -I"./" --warn=0 --asmlist -DXPRJ_DEVBUGGER_2550_XC8=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,+plib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/_ext/475364710/usb_device.p1  ../mla/v2017_03_06/framework/usb/src/usb_device.c 
	@-${MV} ${OBJECTDIR}/_ext/475364710/usb_device.d ${OBJECTDIR}/_ext/475364710/usb_device.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/475364710/usb_device.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/475364710/usb_device_cdc.p1: ../mla/v2017_03_06/framework/usb/src/usb_device_cdc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/475364710" 
	@${RM} ${OBJECTDIR}/_ext/475364710/usb_device_cdc.p1.d 
	@${RM} ${OBJECTDIR}/_ext/475364710/usb_device_cdc.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=pickit3  --double=24 --float=24 --emi=wordwrite --opt=+asm,+asmfile,-speed,+space,-debug,-local --addrqual=ignore --mode=free -P -N255 -I"../mla/v2017_03_06/framework/usb/inc" -I"./plib" -I"./" --warn=0 --asmlist -DXPRJ_DEVBUGGER_2550_XC8=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,+plib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/_ext/475364710/usb_device_cdc.p1  ../mla/v2017_03_06/framework/usb/src/usb_device_cdc.c 
	@-${MV} ${OBJECTDIR}/_ext/475364710/usb_device_cdc.d ${OBJECTDIR}/_ext/475364710/usb_device_cdc.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/475364710/usb_device_cdc.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/475364710/app_device_cdc_to_uart.p1: ../mla/v2017_03_06/framework/usb/src/app_device_cdc_to_uart.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/475364710" 
	@${RM} ${OBJECTDIR}/_ext/475364710/app_device_cdc_to_uart.p1.d 
	@${RM} ${OBJECTDIR}/_ext/475364710/app_device_cdc_to_uart.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=pickit3  --double=24 --float=24 --emi=wordwrite --opt=+asm,+asmfile,-speed,+space,-debug,-local --addrqual=ignore --mode=free -P -N255 -I"../mla/v2017_03_06/framework/usb/inc" -I"./plib" -I"./" --warn=0 --asmlist -DXPRJ_DEVBUGGER_2550_XC8=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,+plib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/_ext/475364710/app_device_cdc_to_uart.p1  ../mla/v2017_03_06/framework/usb/src/app_device_cdc_to_uart.c 
	@-${MV} ${OBJECTDIR}/_ext/475364710/app_device_cdc_to_uart.d ${OBJECTDIR}/_ext/475364710/app_device_cdc_to_uart.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/475364710/app_device_cdc_to_uart.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/475364710/usart.p1: ../mla/v2017_03_06/framework/usb/src/usart.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/475364710" 
	@${RM} ${OBJECTDIR}/_ext/475364710/usart.p1.d 
	@${RM} ${OBJECTDIR}/_ext/475364710/usart.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=pickit3  --double=24 --float=24 --emi=wordwrite --opt=+asm,+asmfile,-speed,+space,-debug,-local --addrqual=ignore --mode=free -P -N255 -I"../mla/v2017_03_06/framework/usb/inc" -I"./plib" -I"./" --warn=0 --asmlist -DXPRJ_DEVBUGGER_2550_XC8=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,+plib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/_ext/475364710/usart.p1  ../mla/v2017_03_06/framework/usb/src/usart.c 
	@-${MV} ${OBJECTDIR}/_ext/475364710/usart.d ${OBJECTDIR}/_ext/475364710/usart.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/475364710/usart.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
else
${OBJECTDIR}/usb_descriptors.p1: usb_descriptors.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/usb_descriptors.p1.d 
	@${RM} ${OBJECTDIR}/usb_descriptors.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=24 --float=24 --emi=wordwrite --opt=+asm,+asmfile,-speed,+space,-debug,-local --addrqual=ignore --mode=free -P -N255 -I"../mla/v2017_03_06/framework/usb/inc" -I"./plib" -I"./" --warn=0 --asmlist -DXPRJ_DEVBUGGER_2550_XC8=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,+plib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/usb_descriptors.p1  usb_descriptors.c 
	@-${MV} ${OBJECTDIR}/usb_descriptors.d ${OBJECTDIR}/usb_descriptors.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/usb_descriptors.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/system.p1: system.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/system.p1.d 
	@${RM} ${OBJECTDIR}/system.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=24 --float=24 --emi=wordwrite --opt=+asm,+asmfile,-speed,+space,-debug,-local --addrqual=ignore --mode=free -P -N255 -I"../mla/v2017_03_06/framework/usb/inc" -I"./plib" -I"./" --warn=0 --asmlist -DXPRJ_DEVBUGGER_2550_XC8=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,+plib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/system.p1  system.c 
	@-${MV} ${OBJECTDIR}/system.d ${OBJECTDIR}/system.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/system.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/main_cdc.p1: main_cdc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main_cdc.p1.d 
	@${RM} ${OBJECTDIR}/main_cdc.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=24 --float=24 --emi=wordwrite --opt=+asm,+asmfile,-speed,+space,-debug,-local --addrqual=ignore --mode=free -P -N255 -I"../mla/v2017_03_06/framework/usb/inc" -I"./plib" -I"./" --warn=0 --asmlist -DXPRJ_DEVBUGGER_2550_XC8=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,+plib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/main_cdc.p1  main_cdc.c 
	@-${MV} ${OBJECTDIR}/main_cdc.d ${OBJECTDIR}/main_cdc.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/main_cdc.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/main.p1: main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.p1.d 
	@${RM} ${OBJECTDIR}/main.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=24 --float=24 --emi=wordwrite --opt=+asm,+asmfile,-speed,+space,-debug,-local --addrqual=ignore --mode=free -P -N255 -I"../mla/v2017_03_06/framework/usb/inc" -I"./plib" -I"./" --warn=0 --asmlist -DXPRJ_DEVBUGGER_2550_XC8=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,+plib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/main.p1  main.c 
	@-${MV} ${OBJECTDIR}/main.d ${OBJECTDIR}/main.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/main.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1126228070/pdusb_2550.p1: ../BSP-FILES/pdusb_2550.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1126228070" 
	@${RM} ${OBJECTDIR}/_ext/1126228070/pdusb_2550.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1126228070/pdusb_2550.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=24 --float=24 --emi=wordwrite --opt=+asm,+asmfile,-speed,+space,-debug,-local --addrqual=ignore --mode=free -P -N255 -I"../mla/v2017_03_06/framework/usb/inc" -I"./plib" -I"./" --warn=0 --asmlist -DXPRJ_DEVBUGGER_2550_XC8=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,+plib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/_ext/1126228070/pdusb_2550.p1  ../BSP-FILES/pdusb_2550.c 
	@-${MV} ${OBJECTDIR}/_ext/1126228070/pdusb_2550.d ${OBJECTDIR}/_ext/1126228070/pdusb_2550.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1126228070/pdusb_2550.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/475364710/usb_device.p1: ../mla/v2017_03_06/framework/usb/src/usb_device.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/475364710" 
	@${RM} ${OBJECTDIR}/_ext/475364710/usb_device.p1.d 
	@${RM} ${OBJECTDIR}/_ext/475364710/usb_device.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=24 --float=24 --emi=wordwrite --opt=+asm,+asmfile,-speed,+space,-debug,-local --addrqual=ignore --mode=free -P -N255 -I"../mla/v2017_03_06/framework/usb/inc" -I"./plib" -I"./" --warn=0 --asmlist -DXPRJ_DEVBUGGER_2550_XC8=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,+plib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/_ext/475364710/usb_device.p1  ../mla/v2017_03_06/framework/usb/src/usb_device.c 
	@-${MV} ${OBJECTDIR}/_ext/475364710/usb_device.d ${OBJECTDIR}/_ext/475364710/usb_device.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/475364710/usb_device.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/475364710/usb_device_cdc.p1: ../mla/v2017_03_06/framework/usb/src/usb_device_cdc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/475364710" 
	@${RM} ${OBJECTDIR}/_ext/475364710/usb_device_cdc.p1.d 
	@${RM} ${OBJECTDIR}/_ext/475364710/usb_device_cdc.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=24 --float=24 --emi=wordwrite --opt=+asm,+asmfile,-speed,+space,-debug,-local --addrqual=ignore --mode=free -P -N255 -I"../mla/v2017_03_06/framework/usb/inc" -I"./plib" -I"./" --warn=0 --asmlist -DXPRJ_DEVBUGGER_2550_XC8=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,+plib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/_ext/475364710/usb_device_cdc.p1  ../mla/v2017_03_06/framework/usb/src/usb_device_cdc.c 
	@-${MV} ${OBJECTDIR}/_ext/475364710/usb_device_cdc.d ${OBJECTDIR}/_ext/475364710/usb_device_cdc.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/475364710/usb_device_cdc.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/475364710/app_device_cdc_to_uart.p1: ../mla/v2017_03_06/framework/usb/src/app_device_cdc_to_uart.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/475364710" 
	@${RM} ${OBJECTDIR}/_ext/475364710/app_device_cdc_to_uart.p1.d 
	@${RM} ${OBJECTDIR}/_ext/475364710/app_device_cdc_to_uart.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=24 --float=24 --emi=wordwrite --opt=+asm,+asmfile,-speed,+space,-debug,-local --addrqual=ignore --mode=free -P -N255 -I"../mla/v2017_03_06/framework/usb/inc" -I"./plib" -I"./" --warn=0 --asmlist -DXPRJ_DEVBUGGER_2550_XC8=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,+plib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/_ext/475364710/app_device_cdc_to_uart.p1  ../mla/v2017_03_06/framework/usb/src/app_device_cdc_to_uart.c 
	@-${MV} ${OBJECTDIR}/_ext/475364710/app_device_cdc_to_uart.d ${OBJECTDIR}/_ext/475364710/app_device_cdc_to_uart.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/475364710/app_device_cdc_to_uart.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/475364710/usart.p1: ../mla/v2017_03_06/framework/usb/src/usart.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/475364710" 
	@${RM} ${OBJECTDIR}/_ext/475364710/usart.p1.d 
	@${RM} ${OBJECTDIR}/_ext/475364710/usart.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=24 --float=24 --emi=wordwrite --opt=+asm,+asmfile,-speed,+space,-debug,-local --addrqual=ignore --mode=free -P -N255 -I"../mla/v2017_03_06/framework/usb/inc" -I"./plib" -I"./" --warn=0 --asmlist -DXPRJ_DEVBUGGER_2550_XC8=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,+plib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/_ext/475364710/usart.p1  ../mla/v2017_03_06/framework/usb/src/usart.c 
	@-${MV} ${OBJECTDIR}/_ext/475364710/usart.d ${OBJECTDIR}/_ext/475364710/usart.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/475364710/usart.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/LPC_FSUSB-CDC-X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE) --chip=$(MP_PROCESSOR_OPTION) -G -mdist/${CND_CONF}/${IMAGE_TYPE}/LPC_FSUSB-CDC-X.${IMAGE_TYPE}.map  -D__DEBUG=1 --debugger=pickit3  --double=24 --float=24 --emi=wordwrite --opt=+asm,+asmfile,-speed,+space,-debug,-local --addrqual=ignore --mode=free -P -N255 -I"../mla/v2017_03_06/framework/usb/inc" -I"./plib" -I"./" --warn=0 --asmlist -DXPRJ_DEVBUGGER_2550_XC8=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,+plib --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"     --rom=default,-7dc0-7fff --ram=default,-3f4-3ff,-f9c-f9c,-fd4-fd4,-fdb-fdf,-fe3-fe7,-feb-fef,-ffd-fff  $(COMPARISON_BUILD) --memorysummary dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml -odist/${CND_CONF}/${IMAGE_TYPE}/LPC_FSUSB-CDC-X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}     
	@${RM} dist/${CND_CONF}/${IMAGE_TYPE}/LPC_FSUSB-CDC-X.${IMAGE_TYPE}.hex 
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/LPC_FSUSB-CDC-X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE) --chip=$(MP_PROCESSOR_OPTION) -G -mdist/${CND_CONF}/${IMAGE_TYPE}/LPC_FSUSB-CDC-X.${IMAGE_TYPE}.map  --double=24 --float=24 --emi=wordwrite --opt=+asm,+asmfile,-speed,+space,-debug,-local --addrqual=ignore --mode=free -P -N255 -I"../mla/v2017_03_06/framework/usb/inc" -I"./plib" -I"./" --warn=0 --asmlist -DXPRJ_DEVBUGGER_2550_XC8=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,+plib --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"     $(COMPARISON_BUILD) --memorysummary dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml -odist/${CND_CONF}/${IMAGE_TYPE}/LPC_FSUSB-CDC-X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}     
	
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/DEVBUGGER_2550_XC8
	${RM} -r dist/DEVBUGGER_2550_XC8

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
