SRCS = main.c
SRCS+= $(shell find device/stm32f30x/ -name '*.c')
SRCS+= $(shell find suzuha/ -name '*.c')

CXX_SRCS = kodama/kodama.cpp
CXX_SRCS+= $(shell find kodama/system/ -name '*.cpp')
CXX_SRCS+= $(shell find kodama/controll/ -name '*.cpp')
CXX_SRCS+= $(shell find kodama/robot_aeris/ -name '*.cpp')
CXX_SRCS+= $(shell find usr/ -name '*.cpp')


INC = -I"./device/"
INC+= -I"./device/stm32f30x/"
INC+= -I"./suzuha/"
INC+= -I"./kodama/robot_aeris/"

INC+= -I"./kodama/"
INC+= -I"./kodama/system/"
INC+= -I"./kodama/controll/"


TARGET = -mcpu=cortex-m4 -mthumb  -mfpu=fpv4-sp-d16 -mfloat-abi=hard -fsingle-precision-constant



DEVICE_LIBS = device/stm32f30x

#GCCPREFIX=~/bin/arm-none-eabi/bin/
GCCPREFIX=arm-none-eabi-

LDSCRIPT = $(DEVICE_LIBS)/ldscript.ld
ELF = bin/main.elf

CC = $(GCCPREFIX)gcc
CXX = $(GCCPREFIX)g++
LD = $(GCCPREFIX)g++
OBJCOPY = $(GCCPREFIX)objcopy
OBJDUMP = $(GCCPREFIX)objdump
SIZE = $(GCCPREFIX)size

CFLAGS = -O2 -Os -s -Wall -Wextra -pedantic -std=c99 $(INC)
CFLAGS+= -Wshadow -Wpointer-arith -Wcast-qual -Wcast-align
CFLAGS+= $(TARGET) -fdata-sections -ffunction-sections

CXXFLAGS = -O2 -Os -s -Wall -Wextra -pedantic -std=c++11  -fno-rtti -fno-exceptions $(INC)
CXXFLAGS+= -Wshadow -Wpointer-arith -Wcast-qual -Wcast-align
CXXFLAGS+= $(TARGET) -fdata-sections -ffunction-sections

#LDFLAGS+= -T$(LDSCRIPT) $(TARGET) --specs=rdimon.specs -Wl,--start-group -lgcc -stdlib -lc -lm -lrdimon -mthumb -Wl,--gc-sections
LDFLAGS+= -T$(LDSCRIPT) $(TARGET) -mthumb -Wl,--gc-sections --specs=nosys.specs



OBJS = $(SRCS:.c=.o)
CXX_OBJS = $(CXX_SRCS:.cpp=.o)

all: $(ELF)
	$(OBJDUMP) --disassemble $< > bin/main.asm
	$(OBJCOPY) -O srec $< bin/main.s19
	$(OBJCOPY) -O ihex $< bin/main.hex
	$(OBJCOPY) -O binary $< bin/main.bin
	$(SIZE) $(ELF)

$(ELF): $(OBJS) $(CXX_OBJS)
	$(LD) $(LDFLAGS) -o $@ $(CXX_OBJS) $(OBJS)

%.o: %.c
	$(CC) -c $(CFLAGS) $< -o $@

%.o: %.cpp
	$(CXX) -c $(CXXFLAGS) $< -o $@

%.o: %.s
	$(CC) -c $(CFLAGS) $< -o $@

CLEAN_FILES = $(shell find -name '*.o')
CLEAN_FILES+= bin/main*
clean:
	rm $(CLEAN_FILES) -rf
	#rm device/device.h
	#rm Makefile
