cmake_minimum_required(VERSION 4.0)

project(QtWorkflowTest VERSION 1.0.0)

set(CMAKE_AUTOMOC)

find_package(Qt6 REQUIRED COMPONENTS Core)

qt_standard_project_setup()

qt_add_executable(Program main.cpp)

qt_generate_deploy_app_script(TARGET Program OUTPUT_SCRIPT DEPLOY_SCRIPT NO_TRANSLATIONS)

install(TARGETS Program RUNTIME DESTINATION bin)
install(SCRIPT ${DEPLOY_SCRIPT})

include(cmake/WorkflowSetup.cmake)
