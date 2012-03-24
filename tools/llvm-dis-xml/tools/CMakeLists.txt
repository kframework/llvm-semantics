include_directories(${LLVM_INCLUDE_DIR})

set ( CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -D__STDC_LIMIT_MACROS=1 -D__STDC_CONSTANT_MACROS=1" )

add_executable (llvm-dis-xml llvm-dis-xml.cc)
set_target_properties (llvm-dis-xml PROPERTIES LINK_FLAGS ${LLVM_LFLAGS})
target_link_libraries (llvm-dis-xml AsmXMLWriter ${LLVM_LIBS})
