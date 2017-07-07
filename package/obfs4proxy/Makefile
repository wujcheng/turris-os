#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=obfs4proxy
PKG_VERSION:=0.0.1
PKG_RELEASE:=2

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/Yawning/obfs4.git
PKG_SOURCE_VERSION:=97a875ec3c0afa629405c78e750d27e4e1f851ca
PKG_SOURCE:=$(PKG_NAME)-$(PKG_SOURCE_VERSION).tar.gz
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)


PKG_BUILD_DEPENDS:=go/host

PKG_MAINTAINER:=<x.paja@email.cz>
PKG_LICENSE:=GPL-3.0

GO_SRC_DIR:=$(PKG_BUILD_DIR)/obfs4proxy/
include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/package/go/files/go-package.mk

define Package/obfs4proxy
	SECTION:=net
	CATEGORY:=Network
	SUBMENU:=IP Addresses and Names
	TITLE:=obfs4proxy
endef

define Package/$(PKG_NAME)/description
  Pluggable Transports (PT) transform the Tor traffic flow between the client and the bridge.
endef

define Build/Compile
	$(call Build/Compile/Go)
endef

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/usr/bin/
	$(CP) $$(PKG_BUILD_DIR)/obfs4proxy/obfs4proxy $(1)/usr/bin/obfs4proxy
endef

$(eval $(call BuildPackage,obfs4proxy))

