CC = gcc
CFLAGS = -Wall -Werror

.PHONY: all run test clean

DIR1 :=  $(CURDIR)/packet-mutation
DIR2 :=  $(CURDIR)/packetdrill/gtests/net/packetdrill
DIR3 :=  $(CURDIR)/rtos-bridge
TAP_INTERFACE_NAME := tun0

ifeq ($(strip $(target)),)
    TARGET := FreeRTOS
else
    TARGET := $(target)
endif

ifeq ($(strip $(path)),)
    Project_Path := $(CURDIR)/FreeRTOS/FreeRTOS-Plus/Demo/FreeRTOS_Plus_TCP_Echo_Posix
else
    Project_Path := $(path)
endif

ifeq ($(TARGET),FreeRTOS)
    interface := TAP
else ifeq ($(TARGET),Contiki)
    interface := TUN
endif



all: clean
	#for packetdrill building
	cd $(DIR1) && $(MAKE)
	cd $(DIR2) && $(MAKE)
	cd $(DIR3) && $(MAKE)  INTERFACE=${interface}
	#for IPStack building
	#cd $(PATH) && $(MAKE)

clean:
	cd $(DIR1) && $(MAKE) clean
	cd $(DIR2) && $(MAKE) clean
	cd $(DIR3) && $(MAKE) clean

test:
	@echo "Current working directory: $(Project_Path), $(TARGET)"

run:
ifeq ($(TARGET),FreeRTOS)
	$(DIR2)/packetdrill --so_filename=$(DIR3)/libfreertos-bridge.so --fm_filename=$(DIR1)/libmutation-interface.so $(ARGS)
else ifeq ($(TARGET),Contiki)
	TAP_INTERFACE_NAME=tun0 $(DIR2)/packetdrill --so_filename=$(DIR3)/libfreertos-bridge.so --fm_filename=$(DIR1)/libmutation-interface.so $(ARGS)
else
	@echo "The IPStack is undefined"
endif
	cd $(CURDIR)