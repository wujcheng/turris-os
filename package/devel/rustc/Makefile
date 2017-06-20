#
## Copyright (C) 2017 CZ.NIC z.s.p.o. (http://www.nic.cz/)
#
## This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
# #
#
include $(TOPDIR)/rules.mk

PKG_NAME:=rustc
PKG_VERSION:=2017-03-02
PKG_RELEASE:=1
PKG_SOURCE_URL:=http://dev-static.rust-lang.org/dist/$(PKG_VERSION)/
#HOST_ARCH:=x86_64
#HOST_ARCH:=i686
#RUST_NAME:=rust-beta-$(HOST_ARCH)-unknown-linux-gnu
RUST_NAME:=rust-beta-x86_64-unknown-linux-gnu
PKG_SOURCE:=$(RUST_NAME).tar.gz
#PKG_MD5:=
PKG_MAINTAINER:=Jan Pavlinec <jan.pavlinec@nic.cz>

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)
HOST_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)

#RUST_STD_MD5:=
RUST_STD_FILE:=rust-std-beta-arm-unknown-linux-musleabi.tar.gz
RUST_STD_URL:=http://dev-static.rust-lang.org/dist/
UNPACK_RUST_STD:=tar -xf "$(DL_DIR)/$(RUST_STD_FILE)" -C $(BUILD_DIR)/rustc/

PKG_INSTALL:=1

include $(INCLUDE_DIR)/host-build.mk
include $(INCLUDE_DIR)/package.mk

define Download/rust_std
  FILE:=rust-std-beta-arm-unknown-linux-musleabi.tar.gz
  URL:=$(PKG_SOURCE_URL)
  #MD5SUM:=
endef

define Package/$(PKG_NAME)
  SUBMENU:=Rust
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=Rust programing language compiler
  URL:=https://www.rust-lang.org
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
	mv -v $(BUILD_DIR)/$(RUST_NAME)/* $(BUILD_DIR)/$(PKG_NAME)/
	rmdir $(BUILD_DIR)/$(RUST_NAME)
	$(UNPACK_RUST_STD)
	$(call Build/Patch)
endef

define Host/Configure
endef

define Host/Compile
endef

define Host/Install
	cp -r $(BUILD_DIR)/$(PKG_NAME) $(STAGING_DIR_HOST)
endef

define Host/Clean
	rm -rf $(STAGING_DIR_HOST)/$(PKG_NAME)/
	rm -rf $(BUILD_DIR)/$(PKG_NAME)/
endef

$(eval $(call Download,rust_std))
$(eval $(call HostBuild))
$(eval $(call BuildPackage,$(PKG_NAME)))
