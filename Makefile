
CC = g++
INC_FLAGS = $(shell find Package -type d -name "include" | xargs printf -- "-I%s ")
LIB_FLAGS = -lpthread

DEBUG_FLAGS = -D _DEBUG -O0 -g
RELEASE_FLAGS = -D _RELEASE -O3

SRC_DIR = ./Package
BUILD_DIR = ./build

CPP_SRC_FILE := $(wildcard $(SRC_DIR)/*/src/*.cpp)
CPP_OBJ_FILE := $(patsubst %.cpp, %.o, $(CPP_SRC_FILE))
CPP_OBJ_FILE := $(addprefix $(BUILD_DIR)/, $(CPP_OBJ_FILE))

all: executable

release: FLAGS := $(RELEASE_FLAGS)
release: executable
debug: FLAGS := $(DEBUG_FLAGS)
debug: executable

executable: $(CPP_OBJ_FILE)
	$(CC) $(FLAGS) $(INC_FLAGS) main.cpp $(CPP_OBJ_FILE) $(LIB_FLAGS) -o main
$(CPP_OBJ_FILE): $(BUILD_DIR)/%.o : %.cpp
	@mkdir -p $(dir $@)
	$(CC) $(FLAGS) $(INC_FLAGS) -c $< -o $@
.PHONY: clean
clean:
	@rm -rf main build
