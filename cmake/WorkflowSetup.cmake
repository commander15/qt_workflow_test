set(CPACK_PACKAGE_NAME        "Qt-Workflow-Test")
set(CPACK_PACKAGE_DESCRIPTION "Awesome program.")
set(CPACK_PACKAGE_VERSION     ${PROJECT_VERSION})
set(CPACK_PACKAGE_VENDOR      "Commander Systems")
set(CPACK_PACKAGE_FILE_NAME   ${CPACK_PACKAGE_NAME}-${CPACK_PACKAGE_VERSION}-${CPACK_SYSTEM_NAME})
set(CPACK_PACKAGE_DIRECTORY   ${CMAKE_BINARY_DIR}/releases)

string(TIMESTAMP RELEASE_DATE "%Y-%m-%d")

include(CPackIFW)

cpack_ifw_configure_component(Program
    ESSENTIAL
    NAME Program
    DISPLAY_NAME "Program Core"
    DESCRIPTION "Program core files."
    VERSION ${PROJECT_VERSION}
    RELEASE_DATE ${RELEASE_DATE}
)

set(CPACK_IFW_ROOT ${Qt6_DIR}/../../../../../Tools/QtInstallerFramework/4.10)

set(CPACK_GENERATOR ZIP IFW)
include(CPack)

# Preparing workflow generation
set(QT_VERSION ${Qt6_VERSION})

# Writing version file
file(WRITE ${CPACK_PACKAGE_DIRECTORY}/VERSION.txt ${PROJECT_VERSION})

configure_file(${PROJECT_SOURCE_DIR}/.github/workflows/cross-build.yml.in ${PROJECT_SOURCE_DIR}/.github/workflows/cross-build.yml @ONLY)
