# Declaration of variables
CC = g++
C = gcc
CC_FLAGS = -w 
LINKER_FLAGS =

# File names
EXEC = bin/run
SOURCES = $(wildcard *.c)
OBJECTS = $(SOURCES:.cpp=.o)

#ALL
all: $(EXEC)

# Main target
$(EXEC): $(OBJECTS)
	$(C) $(CC_FLAGS) $(OBJECTS) $(LINKER_FLAGS) -o $(EXEC)


# To compile 
%.o: %.cpp
	$(CC) -c $(CC_FLAGS) $(@:%.o=%.cpp) -o bin/$@

%.o: %.c
	$(C) -c $(CC_FLAGS) $(@:%.o=%.c) -o bin/$@

# To link object file to standalone exec files
link-%: 
	$(CC) $(CC_FLAGS) bin/$(@:link-%=%).o $(LINKER_FLAGS) -o bin/$(@:link-%=%)


# To compile and link at once
%: %.cpp
	$(CC) $(CC_FLAGS) $@.cpp $(LINKER_FLAGS) -o bin/$@

%: %.c
	$(C) $(CC_FLAGS) $@.c $(LINKER_FLAGS) -o bin/$@

# To remove generated files
clean:
	rm -f $(EXEC) $(addperfix bin/, $(OBJECTS))

