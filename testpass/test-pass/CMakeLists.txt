add_library(test-passPass MODULE
    pass-impl.cpp
    header.h
)

target_compile_features(test-passPass 
    PRIVATE
        cxx_range_for cxx_auto_type
)

set_target_properties(test-passPass PROPERTIES
    COMPILE_FLAGS "-fno-rtti"
)

add_executable(test-binary 
    test.cpp
)