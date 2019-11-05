
message( "This is a project example" )

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++17 -pthread -fPIC")
set(CMAKE_CXX_FLAGS_DEBUG "-O0 -ggdb -D_DEBUG")
set(CMAKE_CXX_FLAGS_RELEASE "-O1 -DNDEBUG")


include_directories(${CMAKE_SOURCE_DIR})
link_directories(${CMAKE_SOURCE_DIR})

add_executable(test test.cc Parser.cc)
target_link_libraries(test gtest)
