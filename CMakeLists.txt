PROJECT(main)

CMAKE_MINIMUM_REQUIRED(VERSION 2.6) 

SET(CMAKE_CXX_COMPILER "g++")

include_directories(${HELLO_SOURCE_DIR}/.)

link_directories (${HELLO_BINARY_DIR}/.) 

add_definitions(-Wall -std=c++11)

include( CheckCXXCompilerFlag )
check_cxx_compiler_flag( "-std=c++11"   COMPILER_SUPPORTS_CXX11 )
check_cxx_compiler_flag( "-std=c++0x"   COMPILER_SUPPORTS_CXX0X )
if( COMPILER_SUPPORTS_CXX11 )
    if( CMAKE_COMPILER_IS_GNUCXX )
        set( CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=gnu++11" )
    else()
        set( CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11" )
    endif()
elseif( COMPILER_SUPPORTS_CXX0X)
    set( CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++0x" )
else()
    # MSVC, On by default (if available)
endif()

AUX_SOURCE_DIRECTORY(src/ DIR_SRCS)

add_executable( ${PROJECT_NAME} ${DIR_SRCS} )
