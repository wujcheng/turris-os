include $(TOPDIR)/rules.mk

PKG_NAME:=ubus
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL=$(LEDE_GIT)/project/ubus.git
PKG_SOURCE_DATE:=2017-02-18
PKG_VERSION:=$(PKG_SOURCE_DATE)
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=34c6e818e431cc53478a0f7c7c1eca07d194d692
PKG_MIRROR_HASH:=fc4f1121faa4f5b8fa52ee25460b98b2e60e7d245aefa70e7f76c56ce5628fd5
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_VERSION).tar.gz
CMAKE_INSTALL:=1

PKG_LICENSE:=LGPL-2.1
PKG_LICENSE_FILES:=

PKG_MAINTAINER:=Felix Fietkau <nbd@nbd.name>

ifdef CONFIG_PACKAGE_python-ubus
PKG_BUILD_DEPENDS:=python
endif

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk

define Package/ubus
  SECTION:=base
  CATEGORY:=Base system
  DEPENDS:=+libubus +libblobmsg-json +ubusd
  TITLE:=OpenWrt RPC client utility
endef

define Package/ubusd
  SECTION:=base
  CATEGORY:=Base system
  TITLE:=OpenWrt RPC daemon
  DEPENDS:=+libubox +libblobmsg-json
endef

define Package/libubus
  SECTION:=libs
  CATEGORY:=Libraries
  DEPENDS:=+libubox
  ABI_VERSION:=$(PKG_VERSION)
  TITLE:=OpenWrt RPC client library
endef

define Package/libubus-lua
  SECTION:=libs
  CATEGORY:=Libraries
  DEPENDS:=+libubus +liblua
  TITLE:=Lua binding for the OpenWrt RPC client
endef

define Package/python-ubus
  SUBMENU:=Python
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=python-ubus
  DEPENDS:=+libubus +libblobmsg-json +python-light
endef

TARGET_CFLAGS += -I$(STAGING_DIR)/usr/include


ifdef CONFIG_PACKAGE_python-ubus
CMAKE_OPTIONS = \
	-DLUAPATH=/usr/lib/lua  \
	-DBUILD_PYTHON=ON \
	-DPYTHON_PACKAGE_VERSION=$(PKG_VERSION)
else
CMAKE_OPTIONS = \
	-DLUAPATH=/usr/lib/lua
endif

define Package/ubus/install
	$(INSTALL_DIR) $(1)/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/ubus $(1)/bin/
endef

define Package/ubusd/install
	$(INSTALL_DIR) $(1)/sbin
	$(CP) $(PKG_INSTALL_DIR)/usr/sbin/ubusd $(1)/sbin/
endef

define Package/libubus/install
	$(INSTALL_DIR) $(1)/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/*.so $(1)/lib/
endef

define Package/libubus-lua/install
	$(INSTALL_DIR) $(1)/usr/lib/lua
	$(CP) $(PKG_BUILD_DIR)/lua/ubus.so $(1)/usr/lib/lua/
endef

define Package/python-ubus/install
	$(INSTALL_DIR) $(1)/usr/lib/python2.7/site-packages
	$(CP) $(PKG_BUILD_DIR)/python/build/*/ubus.so $(1)/usr/lib/python2.7/site-packages
endef

$(eval $(call BuildPackage,libubus))
$(eval $(call BuildPackage,libubus-lua))
$(eval $(call BuildPackage,ubus))
$(eval $(call BuildPackage,ubusd))
$(eval $(call BuildPackage,python-ubus))
