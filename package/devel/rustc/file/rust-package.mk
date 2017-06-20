#
## Copyright (C) 2017 CZ.NIC z.s.p.o. (http://www.nic.cz/)
#
## This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
# #
#


RUST_PKG_DIR:=$(BUILD_DIR)/$(PKG_NAME)
RUST_BIN:=$(STAGING_DIR_HOST)/rustc/rustc/bin/rustc
RUST_STD:=$(STAGING_DIR_HOST)/rustc/rust-std-beta-arm-unknown-linux-musleabi/rust-std-arm-unknown-linux-musleabi/lib/rustlib/arm-unknown-linux-musleabi/lib
RUST_LINKER:=$(TOOLCHAIN_DIR)/bin/arm-openwrt-linux-muslgnueabi-gcc


#$(RUST_BIN) --target arm-unknown-linux-musleabi -L $(RUST_STD) -C linker=$(RUST_LINKER) --out-dir=$(RUST_PKG_DIR)

define Build/Compile/Rust
	$(RUST_BIN) --target arm-unknown-linux-musleabi -L $(RUST_STD) -C linker=$(RUST_LINKER) --out-dir=$(RUST_PKG_DIR) $(1)
endef
