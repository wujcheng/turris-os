#
## Copyright (C) 2014-2015 CZ.NIC z.s.p.o. (http://www.nic.cz/)
#
## This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
# #
#
include $(TOPDIR)/rules.mk

PKG_NAME:=turris-version
PKG_VERSION:=3.10.4

PKG_MAINTAINER:=CZ.NIC <packaging@nic.cz>

include $(INCLUDE_DIR)/package.mk

define Package/turris-version
	TITLE:=turris-version
endef

define Build/Prepare
endef

define Build/Compile
endef

define Package/turris-version/postinst
#!/bin/sh
# Danger: spaces are not ordinary spaces, but special unicode ones
[ -n "$$IPKG_INSTROOT" ] || {
create_notification -s news " • owfs, ustream-ssl, nextcloud, nginx: aktualizace
 • knot-resolver, kernel, hostapd: bezpečnostní aktualizace
 • haas-proxy: aktualizace, větší možnosti logování a omezení prostředků
 • storage: drobné opravy a vylepšení
 • transmission: aktualizace a možnost vlastního vzhledu pro webui
 • domoticz: rozdělen na turris-gatgets a openwrt verzi
 • pakon: oprava notifikace nového zařízení a výchozím módem je nyní IDS" " • owfs, ustream-ssl, nextcloud, nginx: update
 • knot-resolver, kernel, hostapd: security updates
 • haas-proxy: update, more logging options and limit for resources
 • storage: small fixes and enhancements
 • transmission: update and option for custom webui
 • pakon: fix new device notification and use IDS by default"
}
endef

define Package/turris-version/install
	$(INSTALL_DIR) $(1)/etc
	echo $(PKG_VERSION) > $(1)/etc/turris-version
endef

$(eval $(call BuildPackage,turris-version))
