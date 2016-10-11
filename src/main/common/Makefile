CC = g++
LD = g++

OBJCOPY = objcopy
OBJDUMP = objdump
SIZE = size

CFLAGS = -O2 -Os -s -Wall -Wextra -pedantic -std=c++0x
#CFLAGS = -g -s -Wall -Wextra -pedantic -std=c++0x
LDFLAGS = -lm -lpthread -pthread -std=c++11



SRCS = $(shell find -name '*.cpp')
OBJS = $(SRCS:.cpp=.o)

INC_ = $(shell find -name '*.h')

#TMP = -I
#INC = $(addprefix $(TMP), $(INC_))

#INC = -I .


all: $(OBJS)

%.o: %.cpp
	$(CC) $(INC) -c $(CFLAGS) $< -o $@

clean:
	rm $(OBJS) -rf
