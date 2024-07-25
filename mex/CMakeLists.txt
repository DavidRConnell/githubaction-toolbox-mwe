file(GLOB src_files CONFIGURE_DEPENDS
  ${CMAKE_CURRENT_SOURCE_DIR}/*.c)

foreach(src ${src_files})
  get_filename_component(src_name ${src} NAME_WE)
  list(APPEND mex_binaries ${src_name})
  matlab_add_mex(NAME ${src_name}
    MODULE
    SRC ${src}
    R2018a)
endforeach()

set(mex_targets ${mex_binaries} PARENT_SCOPE)
