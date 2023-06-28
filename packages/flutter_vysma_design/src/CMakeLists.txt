# The Flutter tooling requires that developers have CMake 3.10 or later
# installed. You should not increase this version, as doing so will cause
# the plugin to fail to compile for some customers of the plugin.
cmake_minimum_required(VERSION 3.10)

project(flutter_vysma_design_library VERSION 0.0.1 LANGUAGES C)

add_library(flutter_vysma_design SHARED
  "flutter_vysma_design.c"
)

set_target_properties(flutter_vysma_design PROPERTIES
  PUBLIC_HEADER flutter_vysma_design.h
  OUTPUT_NAME "flutter_vysma_design"
)

target_compile_definitions(flutter_vysma_design PUBLIC DART_SHARED_LIB)
