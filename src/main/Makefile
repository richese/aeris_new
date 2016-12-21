SUBDIRS = common server visualisation
SUBDIRS+= mode_bot border arena line
SUBDIRS+= agent_test base food pheromone ant

all: $(SUBDIRS)

$(SUBDIRS):
	$(MAKE) -C $@


.PHONY: $(SUBDIRS)


SRCS = $(shell find -name '*.cpp')
OBJS = $(SRCS:.cpp=.o)

ELFS = $(shell find -name '*.elf')

clean:
	rm $(OBJS) -rf
	rm $(ELFS) -rf
