
cmake_minimum_required(VERSION 3.0)

project(AutoVersioning)

include_directories(inc)
include_directories(ver)

file(GLOB_RECURSE HEADER "inc/*.h" "inc/*.hpp")
file(GLOB_RECURSE SOURCE "src/*.cpp" "src/*.c")

set(CMAKE_CXX_FLAGS '-g')
# set(CMAKE_CXX_STANDARD 20)
# set(CMAKE_CXX_STANDARD_REQUIRED ON)


add_custom_command(
    OUTPUT    ${CMAKE_HOME_DIRECTORY}/ver/version.h
    COMMENT   "version.h updated..."
    COMMAND   ${CMAKE_HOME_DIRECTORY}/ver/vergen.sh  ${CMAKE_HOME_DIRECTORY}/ver/patch  ${CMAKE_HOME_DIRECTORY}/ver/version.h
    DEPENDS   ${SOURCE} ${HEADER}
)
add_custom_target(
  vergen
  DEPENDS ${CMAKE_HOME_DIRECTORY}/ver/version.h
)


add_executable(${PROJECT_NAME} ${SOURCE} ${HEADER})
add_dependencies(${PROJECT_NAME} vergen)

# link libraries
# target_link_libraries(${PROJECT_NAME} -lpthread -lboost_system -lssl -lcrypto -lrt)
