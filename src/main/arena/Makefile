ELF = bin/main.elf

COMMON_PATH = ../common
COMMON = $(shell find ../common -name '*.o')









CC = g++
LD = g++
OBJCOPY = objcopy
OBJDUMP = objdump
SIZE = size

CFLAGS = -O2 -Os -s -Wall -Wextra -pedantic -std=c++0x
LDFLAGS = -lm -lpthread -pthread -std=c++11 

SRCS = $(shell find -name '*.cpp')

OBJS = $(SRCS:.cpp=.o)
OBJS+= $(COMMON)


INC = -I .
INC+= -I $(COMMON_PATH)

all: $(ELF)
	$(SIZE) $(ELF)

$(ELF): $(OBJS)
	$(LD) -o $@ $(OBJS) $(LDFLAGS)

%.o: %.cpp
	$(CC) $(INC) -c $(CFLAGS) $< -o $@

clean:
	rm $(OBJS) -rf
