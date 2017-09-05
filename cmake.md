```shell
/usr/share/cmake/Modules/ 
# This way is for cmake modules
# you can download realted modules like `findXXX.cmake`
# and copy file into this directory
# In CMakeList.txt file, you can use
find_package(XXX REQUIRED)
include_directories($(XXX_INCLUDE_DIR))
target_link_libraries(XXX)
# to include this lib to your environment path
```
