cmake_minimum_required(VERSION 4.0)

project(QtWorkflowTest)

find_package(Qt6 REQUIRED COMPONENTS Core)

qt_standard_project_setup()

qt_add_executable(Program main.cpp)
