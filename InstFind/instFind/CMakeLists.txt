add_library(instFind MODULE
    instFindPass.cpp
)

target_compile_features(instFind
    PRIVATE
        cxx_range_for cxx_auto_type
)

set_target_properties(instFind PROPERTIES
    COMPILE_FLAGS "-fno-rtti"
)

add_executable(testbinary
    test.c
    header.h
)