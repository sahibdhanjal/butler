cmake_minimum_required(VERSION 2.8.3)
project(butler)

################################################
# Compile options for debug, multithread, etc #
################################################
add_definitions(-DDEBUG)
add_definitions(-DMULTITHREAD)
add_definitions(-DCUDA)
add_definitions(-DPROJECT_DIR="${PROJECT_SOURCE_DIR}")

################################################
###          Configuration Defaults          ###
################################################
IF(NOT ROS_BUILD_TYPE)
    SET(ROS_BUILD_TYPE Release)
ENDIF()

set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wno-deprecated -Wno-deprecated-declarations -Wno-format -O3 -march=native ")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wno-deprecated -Wno-deprecated-declarations -Wno-format -Wno-conversion-null -O3 -march=native")

include(CheckCXXCompilerFlag)
CHECK_CXX_COMPILER_FLAG("-std=c++11" COMPILER_SUPPORTS_CXX11)
CHECK_CXX_COMPILER_FLAG("-std=c++0x" COMPILER_SUPPORTS_CXX0X)
if(COMPILER_SUPPORTS_CXX11)
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")
    add_definitions(-DCOMPILEDWITHC11)
    message(STATUS "Using flag -std=c++11.")
elseif(COMPILER_SUPPORTS_CXX0X)
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++0x")
    add_definitions(-DCOMPILEDWITHC0X)
    message(STATUS "Using flag -std=c++0x.")
else()
    message(FATAL_ERROR "The compiler ${CMAKE_CXX_COMPILER} has no C++11 support. Please use a different C++ compiler.")
endif()

LIST(APPEND CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/cmake_modules)

find_package(OpenCV 3.0 QUIET)
if(NOT OpenCV_FOUND)
   find_package(OpenCV 2.4.3 QUIET)
   if(NOT OpenCV_FOUND)
      message(FATAL_ERROR "OpenCV > 2.4.3 not found.")
   endif()
endif()
find_package(Eigen3 3.1.0 REQUIRED)
find_package(Boost COMPONENTS system)
find_package(GTest REQUIRED)

################################################
###      Package/Library Configuration       ###
################################################
find_package(
    catkin REQUIRED
    cv_bridge
    geometry_msgs
    image_transport
    nav_msgs
    roscpp
    rospy
    sensor_msgs
    std_msgs
    tf2
)

include_directories(
  ${catkin_INCLUDE_DIRS}
  ${PROJECT_SOURCE_DIR}
  ${PROJECT_SOURCE_DIR}/include
  ${EIGEN3_INCLUDE_DIR}
  ${OpenCV_INCLUDE_DIRS}
  ${GTEST_INCLUDE_DIRS}
)

set(BUTLER_LIBS
  ${OpenCV_LIBS}
  ${EIGEN3_LIBS}
  ${Boost_LIBRARIES}
)

set(BUTLER_ROS_LIBS
  ${catkin_LIBRARIES}
  ${BUTLER_LIBS}
)

################################################
## Declare ROS dynamic reconfigure parameters ##
################################################

## To declare and build dynamic reconfigure parameters within this
## package, follow these steps:
## * In the file package.xml:
##   * add a build_depend and a exec_depend tag for "dynamic_reconfigure"
## * In this file (CMakeLists.txt):
##   * add "dynamic_reconfigure" to
##     find_package(catkin REQUIRED COMPONENTS ...)
##   * uncomment the "generate_dynamic_reconfigure_options" section below
##     and list every .cfg file to be processed

## Generate dynamic reconfigure parameters in the 'cfg' folder
# generate_dynamic_reconfigure_options(
#   cfg/DynReconf1.cfg
#   cfg/DynReconf2.cfg
# )

################################################
##        Catkin Package Configuration        ##
################################################
## The catkin_package macro generates cmake config files for your package
## Declare things to be passed to dependent projects
## INCLUDE_DIRS: uncomment this if your package contains header files
## LIBRARIES: libraries you create in this project that dependent projects also need
## CATKIN_DEPENDS: catkin_packages dependent projects also need
## DEPENDS: system dependencies of this project that dependent projects also need
catkin_package(
#  INCLUDE_DIRS include
#  LIBRARIES butler
#  CATKIN_DEPENDS other_catkin_pkg
#  DEPENDS system_lib
)

## Generate Libraries for every component
# add_library(common SHARED
#   ${PROJECT_SOURCE_DIR}/include/common/math.h
# )
# target_link_libraries(common ${BUTLER_LIBS})

## Add executables for every component
# add_executable(butler src/ros/butler.cpp)
# target_link_libraries(butler ${BUTLER_ROS_LIBS})

################################################
##            Run C++/Python Tests            ##
################################################
## Add gtest based cpp test target and link libraries
# catkin_add_gtest(${PROJECT_NAME}-test test/test_butler.cpp)
# if(TARGET ${PROJECT_NAME}-test)
#   target_link_libraries(${PROJECT_NAME}-test ${PROJECT_NAME})
# endif()

## Add folders to be run by python nosetests
# catkin_add_nosetests(test)
