# cmake/_Dependencies.cmake is generated by `mulle-sde`. Edits will be lost.
#
if( MULLE_TRACE_INCLUDE)
   MESSAGE( STATUS "# Include \"${CMAKE_CURRENT_LIST_FILE}\"" )
endif()

if( NOT MULLE_ABA_LIBRARY)
   find_library( MULLE_ABA_LIBRARY NAMES mulle-aba)
   message( STATUS "MULLE_ABA_LIBRARY is ${MULLE_ABA_LIBRARY}")
   set( DEPENDENCY_LIBRARIES
      ${MULLE_ABA_LIBRARY}
      ${DEPENDENCY_LIBRARIES}
      CACHE INTERNAL "need to cache this"
   )
   if( MULLE_ABA_LIBRARY)
      # temporarily expand CMAKE_MODULE_PATH
      get_filename_component( TMP_MULLE_ABA_ROOT "${MULLE_ABA_LIBRARY}" DIRECTORY)
      get_filename_component( TMP_MULLE_ABA_ROOT "${TMP_MULLE_ABA_ROOT}" DIRECTORY)
      set( MEMO_CMAKE_MODULE_PATH "${CMAKE_MODULE_PATH}")
      list( INSERT CMAKE_MODULE_PATH 0 "${TMP_MULLE_ABA_ROOT}/include/cmake")
      # use explicit path to avoid "surprises"
      unset( MULLE_ABA_DEFINITIONS)
      include( "${TMP_MULLE_ABA_ROOT}/include/cmake/DependenciesAndLibraries.cmake" OPTIONAL)
      set( CMAKE_MODULE_PATH "${MEMO_CMAKE_MODULE_PATH}")

      set( INHERITED_DEFINITIONS
           ${MULLE_ABA_DEFINITIONS}
           ${INHERITED_DEFINITIONS}
      )
  endif()
endif()