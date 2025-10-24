set(CPACK_PACKAGE_NAME        "Qt Workflow Test")
set(CPACK_PACKAGE_VENDOR      "Commander Systems")
set(CPACK_PACKAGE_DESCRIPTION "Awesome program.")
set(CPACK_PACKAGE_DIRECTORY   ${CMAKE_BINARY_DIR}/releases)

string(TIMESTAMP RELEASE_DATE "%y-%m-%d")

include(CPackIFW)

cpack_ifw_configure_component(Program
    ESSENTIAL
    NAME Program
    DISPLAY_NAME "Program Core"
    DESCRIPTION "Program core files."
    VERSION ${PROJECT_VERSION}
    RELEASE_DATE ${RELEASE_DATE}
)

set(CPACK_GENERATOR ZIP)
include(CPack)
