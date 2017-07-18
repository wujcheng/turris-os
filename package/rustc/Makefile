#
## Copyright (C) 2017 CZ.NIC z.s.p.o. (http://www.nic.cz/)
#
## This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
# #
#
include $(TOPDIR)/rules.mk

PKG_NAME:=rustc
PKG_VERSION:=1.18.0

PKG_SOURCE_URL:=https://dev-static.rust-lang.org/dist/2017-06-06/

PKG_ARCH_NAME:=x86_64
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_ARCH_NAME)-unknown-linux-gnu.tar.gz

PKG_RELEASE:=1
PKG_MAINTAINER:=Jan Pavlinec <jan.pavlinec@nic.cz>

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)-x86_64-unknown-linux-gnu
HOST_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)-x86_64-unknown-linux-gnu


ifeq ($(ARCH),powerpc)
RUST_STD_TRIPLET:=powerpc-unknown-linux-gnu
RUST_GCC_LINKER:=powerpc-openwrt-linux-gcc
#RUST_STD_MD5:=
RUST_GCC_LD:=powerpc-openwrt-linux-ld
RUST_GCC_AR:=powerpc-openwrt-linux-ar
endif


ifeq ($(ARCH),arm)
RUST_STD_TRIPLET:=arm-unknown-linux-musleabi
RUST_GCC_LINKER:=arm-openwrt-linux-muslgnueabi-gcc
RUST_GCC_LD:=arm-openwrt-linux-muslgnueabi-ld
RUST_GCC_AR:=arm-openwrt-linux-muslgnueabi-ar
#RUST_STD_MD5:=
endif

RUST_STD_FILE:=rust-std-$(PKG_VERSION)-$(RUST_STD_TRIPLET).tar.gz
UNPACK_RUST_STD:=tar -xf "$(DL_DIR)/$(RUST_STD_FILE)" -C $(HOST_BUILD_DIR)/rustc/


PKG_INSTALL:=1

include $(INCLUDE_DIR)/host-build.mk
include $(INCLUDE_DIR)/package.mk

define Download/rust_std
  FILE:=$(RUST_STD_FILE)
  URL:=$(PKG_SOURCE_URL)
  #MD5SUM:=
endef

define Package/$(PKG_NAME)
  SUBMENU:=Rust
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=Rust programing language compiler
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
	$(UNPACK_RUST_STD)
	mv $(HOST_BUILD_DIR)/rustc/rust-std-$(PKG_VERSION)-$(RUST_STD_TRIPLET)/rust-std-$(RUST_STD_TRIPLET)/lib/rustlib/$(RUST_STD_TRIPLET)/ $(HOST_BUILD_DIR)/rustc/lib/rustlib/
endef

define Host/Configure
	echo RUST_BIN_PATH:="$(HOST_BUILD_DIR)/rustc/bin" > $(TOPDIR)/build_dir/rust_variables.mk
	echo RUST_LINKER:="$(TOOLCHAIN_DIR)/bin/$(RUST_GCC_LINKER)" >> $(TOPDIR)/build_dir/rust_variables.mk
	echo RUST_AR:="$(TOOLCHAIN_DIR)/bin/$(RUST_GCC_AR)" >> $(TOPDIR)/build_dir/rust_variables.mk
	echo RUST_LD:="$(TOOLCHAIN_DIR)/bin/$(RUST_GCC_LD)" >> $(TOPDIR)/build_dir/rust_variables.mk
	echo RUST_TRIPLET:="$(RUST_STD_TRIPLET)" >> $(TOPDIR)/build_dir/rust_variables.mk
	echo RUST_LIBS:="$(HOST_BUILD_DIR)/rustc/lib/rustlib/$(RUST_STD_TRIPLET)/lib" >> $(TOPDIR)/build_dir/rust_variables.mk
endef


define Host/Compile
endef

define Host/Install
endef

define Host/Clean
endef

$(eval $(call Download,rust_std))
$(eval $(call HostBuild))
$(eval $(call BuildPackage,$(PKG_NAME)))

