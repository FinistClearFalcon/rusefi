# Combine the related files for a specific platform and MCU.

# Target ECU board design
BOARDCPPSRC = $(BOARDS_DIR)/hellen/hellen72/board_configuration.cpp

BOARDINC = $(BOARDS_DIR)/hellen/hellen72

# Set this if you want a default engine type other than normal Hellen72
ifeq ($(DEFAULT_ENGINE_TYPE),)
  DEFAULT_ENGINE_TYPE = -DDEFAULT_ENGINE_TYPE=HELLEN_NB2
endif

# 176 package MCU
ifeq ($(LED_CRITICAL_ERROR_BRAIN_PIN),)
  LED_CRITICAL_ERROR_BRAIN_PIN = -DLED_CRITICAL_ERROR_BRAIN_PIN=GPIOH_8
endif

DDEFS += -DEFI_MAIN_RELAY_CONTROL=TRUE

# Disable serial ports on this board as UART3 causes a DMA conflict with the SD card
DDEFS += -DTS_NO_PRIMARY=1

# Add them all together
DDEFS += -DFIRMWARE_ID=\"hellen72\" $(DEFAULT_ENGINE_TYPE) $(LED_CRITICAL_ERROR_BRAIN_PIN) $(LED_COMMUNICATION_BRAIN_PIN)
DDEFS += -DEFI_SOFTWARE_KNOCK=TRUE -DSTM32_ADC_USE_ADC3=TRUE
DDEFS += -DHAL_TRIGGER_USE_PAL=TRUE



include $(BOARDS_DIR)/hellen/hellen-common.mk
