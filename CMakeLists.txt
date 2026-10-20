cmake_minimum_required(VERSION 3.10.0)
project(sp_lab2 VERSION 0.1.0 LANGUAGES CXX)

add_compile_options(-Wall)
add_compile_options(-std=c++20)
add_compile_options(-g)

# та сама програма у двох версіях: без оптимізації і з нею
add_executable(arrays_O0 src/arrays.cpp)
target_compile_options(arrays_O0 PRIVATE -O0)

add_executable(arrays_O3 src/arrays.cpp)
target_compile_options(arrays_O3 PRIVATE -O3)

# асемблерний код обох версій для п. 4.1: cmake --build build --target asm
add_custom_target(asm
    COMMAND ${CMAKE_CXX_COMPILER} -std=c++20 -O0 -S ${CMAKE_SOURCE_DIR}/src/arrays.cpp -o ${CMAKE_SOURCE_DIR}/asm/arrays_O0.s
    COMMAND ${CMAKE_CXX_COMPILER} -std=c++20 -O3 -S ${CMAKE_SOURCE_DIR}/src/arrays.cpp -o ${CMAKE_SOURCE_DIR}/asm/arrays_O3.s
)
