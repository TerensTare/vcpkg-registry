vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boost-ext/ut
    REF 0b6812b8b37951b6af178c8f445519796b33fe23
    SHA512 8bdee1fff5e224561d9a03004bd53042c3536bb6f507264c802b49c2fd0820093d2877bd4bb05dec453edb8c0ee14ab1883d8a1cbe4c479d58bde36ab623074c
    HEAD_REF master
)

vcpkg_configure_cmake(
    SOURCE_PATH "${SOURCE_PATH}"
    PREFER_NINJA
)

vcpkg_install_cmake()
vcpkg_fixup_cmake_targets()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

file(
  INSTALL "${SOURCE_PATH}/LICENSE.md"
  DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
  RENAME copyright)
