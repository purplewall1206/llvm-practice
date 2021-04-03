LLVM_CONFIG?=llvm-config

SRC_DIR?=$(PWD)
LD_FLAGS+=$(shell $(LLVM_CONFIG) --ldflags)

COMMON_FLAGS=-Wall -Wextra
CXXFLAGS+=$(COMMON_FLAGS) $(shell $(LLVM_CONFIG) --cxxflags)
CXXFLAGS+=-fPIC
CPPFLAGS+=$(shell $(LLVM_CONFIG) --cppflags) -T$(SRC_DIR)
CPPFLAGS+=-fPIC

ifeq ($(shell uname), Darwin)
LOADABLE_MODULE_OPTIONS=-bundle -undefined dynamic_lookup
else
LOADABLE_MODULE_OPTIONS=-shared -Wl,-O1
endif

HELLOPASS=hellopass.so
HELLOPASS_OBJECTS=Hello.o

default: $(HELLOPASS)

%.o : $(SRC_DIR)/%.cpp
	@echo Compiling $.cpp
	$(CXX) -c $(CPPFLAGS) $(CXXFLAGS) $<

$(HELLOPASS) : $(HELLOPASS_OBJECTS)
	@echo Linking
	$(CXX) -o $@  $(LOADABLE_MODULE_OPTIONS) $(CXXFLAGS) $(LD_FLAGS) $^

clean:
	rm -f $(HELLOPASS) $(HELLOPASS_OBJECTS)