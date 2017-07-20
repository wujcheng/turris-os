#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=rust-demo-rider
PKG_VERSION:=e72a896c13fe6c0e2918b2cccf53867c8783a7eb
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://gitlab.labs.nic.cz/mvaner/demo_rider.git
PKG_SOURCE_VERSION:=$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_SOURCE_VERSION).tar.gz
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)


HOST_BUILD_DEPENDS:=cargo/host
PKG_BUILD_DEPENDS:=cargo/host

#PKG_INSTALL:=1
PKG_MAINTAINER:=<jan.pavlinec@nic.cz>
PKG_LICENSE:=GPL-3.0

include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/package/cargo/files/cargo-package.mk

define Package/rust-demo-rider
	SUBMENU:=Rust
	SECTION:=lang
	CATEGORY:=Languages
	TITLE:=rust demo rider
	DEPENDS:=+libpthread +librt
endef

define Package/$(PKG_NAME)/description
  Demo rider
endef

define Build/Prepare
	$(Build/Prepare/Default)
endef

define Build/Configure
	$(call CargoSetHomeVars)
endef

define Build/Compile
	$(call Build/Compile/Cargo,$(PKG_BUILD_DIR))
endef

ifeq ($(ARCH),powerpc)
RUST_TRIPLET:=powerpc-unknown-linux-gnu
endif

ifeq ($(ARCH),arm)
RUST_TRIPLET:=arm-unknown-linux-musleabi
endif

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/root
	echo $(CARGO_BUILD_TARGET)
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/target/$(RUST_TRIPLET)/release/demo_rider $(1)/root/demo_rider
	$(CP) $(PKG_BUILD_DIR)/demos/nightrider $(1)/root/nightrider
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/demo_rider.init $(1)/etc/init.d/demo_rider

endef


$(eval $(call BuildPackage,rust-demo-rider))
