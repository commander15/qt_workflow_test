cmake_minimum_required(VERSION 4.0)

project(QtWorkflowTest
    DESCRIPTION "Testing Github workflows"
    VERSION 1.0.1
)

set(CMAKE_AUTOMOC ON)

find_package(Qt6 REQUIRED COMPONENTS Core)

qt_standard_project_setup()

qt_add_executable(Program main.cpp)

qt_generate_deploy_app_script(TARGET Program OUTPUT_SCRIPT DEPLOY_SCRIPT NO_TRANSLATIONS)

install(TARGETS Program RUNTIME DESTINATION bin COMPONENT Program)
install(SCRIPT ${DEPLOY_SCRIPT} COMPONENT QtDependencies)

set(SOFTWARE_NAME      "Qt Workflow Test")
set(SOFTWARE_EDITOR    "Commander Systems")
set(SOFTWARE_TARGET    Program)
set(SOFTWARE_COMPONENT Program)
include(cmake/CPackConfig.cmake)
