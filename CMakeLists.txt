cmake_minimum_required(VERSION 3.17)
project(qml-flickering-example VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

find_package(Qt5 COMPONENTS Core Quick QuickControls2 REQUIRED)
find_program(WINDEPLOYQT windeployqt)

add_executable(${PROJECT_NAME} main.cpp)

target_compile_definitions(${PROJECT_NAME} 
  PRIVATE $<$<OR:$<CONFIG:Debug>,$<CONFIG:RelWithDebInfo>>:QT_QML_DEBUG>)

target_link_libraries(${PROJECT_NAME}
  PRIVATE Qt${QT_VERSION_MAJOR}::Core 
          Qt${QT_VERSION_MAJOR}::Quick 
          Qt${QT_VERSION_MAJOR}::QuickControls2)

add_custom_command(TARGET ${PROJECT_NAME} PRE_BUILD COMMAND ${CMAKE_COMMAND} -E copy_directory ${CMAKE_CURRENT_SOURCE_DIR}/qml $<TARGET_FILE_DIR:${PROJECT_NAME}>/qml)
add_custom_command(TARGET ${PROJECT_NAME} POST_BUILD COMMAND ${WINDEPLOYQT} --qmldir $<TARGET_FILE_DIR:${PROJECT_NAME}>/qml $<TARGET_FILE:${PROJECT_NAME}>)