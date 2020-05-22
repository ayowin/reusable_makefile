
TARGET = $(notdir $(PWD))
CC = g++
# Tips: if you want to build release target , it is suggested to remove '-g' flag.
CFLAGS = -std=c++11 -g
INCLUDEPATH = $(addprefix -I,$(ALL_DIRS))
LIBS = 
BUILD_PATH = build
EXCLUDE_DIRS = ./.git ./.svn
EXCLUDE_DIRS := $(foreach dir,$(EXCLUDE_DIRS),-path $(dir) -prune -o)
ALL_DIRS := $(shell find . -maxdepth 5 $(EXCLUDE_DIRS) -type d -print)
SOURCE_FILES = $(foreach dir,$(ALL_DIRS),$(wildcard $(dir)/*.cpp))
OBJECT_FILES = $(notdir $(patsubst %.cpp,%.o, $(SOURCE_FILES)))
HEDAER_DEPENDS = $(patsubst %o,%d,$(OBJECT_FILES))
HEDAER_DEPENDS := $(addprefix $(BUILD_PATH)/,$(HEDAER_DEPENDS))

# VPATH update
VPATH += $(ALL_DIRS)

# all
all: pre compile link

# link
link: $(TARGET)
$(TARGET): compile
	$(CC) $(BUILD_PATH)/*.o -o $(BUILD_PATH)/$(TARGET) $(LIBS) $(CFLAGS)

# compile
compile: pre $(OBJECT_FILES)
$(OBJECT_FILES): %.o : %.cpp %.d
	$(CC) -c $< -o $(BUILD_PATH)/$@ $(INCLUDEPATH) $(LIBS) $(CFLAGS)

# header files modified defection
-include $(HEDAER_DEPENDS)
%.d: %.cpp
	@set -e;
	@rm -f $(BUILD_PATH)/$@;
	@$(CC) $(CFLAGS) $(INCLUDEPATH) -MM $< > $(BUILD_PATH)/$@.$$$$; \
		sed 's,\($*\)\.o[ :]*,\1.o $@ : ,g' < $(BUILD_PATH)/$@.$$$$ > $(BUILD_PATH)/$@; \
		rm -f $(BUILD_PATH)/$@.$$$$

# clean
.PHONY:
clean:
	rm -rf $(BUILD_PATH)
	@echo "Clean success."

# pre
pre:
ifneq ($(BUILD_PATH), $(wildcard $(BUILD_PATH)))
	mkdir -p $(BUILD_PATH)
endif

