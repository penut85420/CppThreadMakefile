
CC = g++
INC_FLAGS = $(shell find Package -type d -name "include" | xargs printf -- "-I%s ")
LIB_FLAGS = -lpthread

DEBUG_FLAGS = -D _DEBUG -O0 -g
RELEASE_FLAGS = -D _RELEASE -O3

SRC_DIR = Package

RELEASE_BUILD_DIR = build/release
DEBUG_BUILD_DIR = build/debug

CPP_SRC_FILE := $(wildcard $(SRC_DIR)/*/src/*.cpp)
CPP_OBJ_FILE := $(patsubst %.cpp, %.o, $(CPP_SRC_FILE))

CPP_RELEASE_OBJ_FILE := $(addprefix $(RELEASE_BUILD_DIR)/, $(CPP_OBJ_FILE))
CPP_DEBUG_OBJ_FILE := $(addprefix $(DEBUG_BUILD_DIR)/, $(CPP_OBJ_FILE))

all: debug
rel: release
release: FLAGS := $(RELEASE_FLAGS)
release: $(CPP_RELEASE_OBJ_FILE)
	$(CC) $(FLAGS) $(INC_FLAGS) main.cpp $(CPP_RELEASE_OBJ_FILE) $(LIB_FLAGS) -o $(RELEASE_BUILD_DIR)/main
debug: FLAGS := $(DEBUG_FLAGS)
debug: $(CPP_DEBUG_OBJ_FILE)
	$(CC) $(FLAGS) $(INC_FLAGS) main.cpp $(CPP_DEBUG_OBJ_FILE) $(LIB_FLAGS) -o $(DEBUG_BUILD_DIR)/main
$(CPP_RELEASE_OBJ_FILE): $(RELEASE_BUILD_DIR)/%.o : %.cpp
	@mkdir -p $(dir $@)
	$(CC) $(FLAGS) $(INC_FLAGS) -c $< -o $@
$(CPP_DEBUG_OBJ_FILE): $(DEBUG_BUILD_DIR)/%.o : %.cpp
	@mkdir -p $(dir $@)
	$(CC) $(FLAGS) $(INC_FLAGS) -c $< -o $@
.PHONY: clean
clean:
	@rm -rf main build
