pkg_name=wildfly
pkg_origin=jmassardo
pkg_version="17.0.1"
pkg_maintainer="The Habitat Maintainers <humans@habitat.sh>"
pkg_license=("Apache-2.0")
pkg_source="https://download.jboss.org/${pkg_name}/${pkg_version}.Final/${pkg_name}-${pkg_version}.Final.tar.gz"
pkg_shasum="2812b43b6c8e61f2d764a12d5a11de79481461b8cac51434ea730ee5985d38de"
pkg_deps=(core/jdk8 core/curl)
pkg_bin_dirs=(bin)

pkg_description="WildFly is a flexible, lightweight, managed application runtime that helps you build amazing applications."
pkg_upstream_url="https://wildfly.org"

do_build() {
  return 0
}

do_install() {
  build_line "Performing install"
  mkdir -p "${pkg_prefix}/wildfly"
  cp -R $HAB_CACHE_SRC_PATH/$pkg_name-$pkg_version.Final/* "${pkg_prefix}/wildfly"

  # default permissions included in the tarball don't give any world access
  find "${pkg_prefix}/wildfly" -type d -exec chmod -v 755 {} +
  find "${pkg_prefix}/wildfly" -type f -exec chmod -v 644 {} +
  find "${pkg_prefix}/wildfly" -type f -name '*.sh' -exec chmod -v 755 {} +
}