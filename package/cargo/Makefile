#
## Copyright (C) 2017 CZ.NIC z.s.p.o. (http://www.nic.cz/)
#
## This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
# #
#
include $(TOPDIR)/rules.mk

PKG_NAME:=cargo
PKG_VERSION:=0.19.0
PKG_SOURCE_URL:=https://dev-static.rust-lang.org/dist/2017-06-06/

PKG_ARCH_NAME:=x86_64
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_ARCH_NAME)-unknown-linux-gnu.tar.gz

PKG_RELEASE:=1
PKG_MAINTAINER:=Jan Pavlinec <jan.pavlinec@nic.cz>

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)-x86_64-unknown-linux-gnu
HOST_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)-x86_64-unknown-linux-gnu

HOST_BUILD_DEPENDS:=rustc/host
PKG_BUILD_DEPENDS:=rustc/host

PKG_INSTALL:=1

include $(INCLUDE_DIR)/host-build.mk
include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
  SUBMENU:=Rust
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=cargo rust manager
  URL:=https://rust
endef

define Build/Prepare
endef

define Build/Configure
endef

define Build/Compile
endef

define Build/Install
endef

define Build/Clean
endef

define Host/Prepare
	$(PKG_UNPACK)
	$(call Build/Patch)
endef

define Host/Configure
	echo CARGO_HOME_PATH:="$(TOPDIR)/build_dir/cargo_home/.cargo" >$(TOPDIR)/build_dir/cargo_variables.mk
	echo CARGO_BIN_PATH:="$(HOST_BUILD_DIR)/cargo/bin" >>$(TOPDIR)/build_dir/cargo_variables.mk
endef


define Host/Compile
endef

define Host/Install
endef

#define Host/Clean
#	rm -rf $(STAGING_DIR_HOST)/$(PKG_NAME)/
#	rm -rf $(BUILD_DIR)/$(PKG_NAME)/
#endef

$(eval $(call HostBuild))
$(eval $(call BuildPackage,$(PKG_NAME)))
