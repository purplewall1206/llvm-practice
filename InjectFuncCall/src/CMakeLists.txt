add_library(injectfuncall MODULE
    InjectFuncCall.cpp
    InjectFuncCall.h
)

target_compile_features(injectfuncall
    PRIVATE
        cxx_range_for cxx_auto_type
)

set_target_properties(injectfuncall PROPERTIES
    COMPILE_FLAGS "-fno-rtti"
)

add_executable(input_for_hello
    input_for_hello.c
)
