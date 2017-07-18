#
## Copyright (C) 2017 CZ.NIC z.s.p.o. (http://www.nic.cz/)
#
## This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
# #
#


include $(TOPDIR)/build_dir/cargo_variables.mk
include $(TOPDIR)/build_dir/rust_variables.mk

CARGO_MAKE_VARS=\
	CARGO_HOME=$(CARGO_HOME_PATH) \
	CC=$(RUST_LINKER) \
	AR=$(RUST_AR) \
	LD=$(RUST_LD) \
	CARGO_BUILD_RUSTC=$(RUST_BIN_PATH)/rustc \
	CARGO_BUILD_TARGET=$(RUST_TRIPLET)

CARGO_MAKE=$(CARGO_BIN_PATH)/cargo
CARGO_MAKE_ARGS:=build --all --release --verbose

#--target=$(RUST_TRIPLET)

define CargoSetHomeVars
	(mkdir -p $(CARGO_HOME_PATH) ; \
	echo "[target.$(RUST_TRIPLET)]" >$(CARGO_HOME_PATH)/config  ; \
	echo "linker =\"$(RUST_LINKER)\"" >> $(CARGO_HOME_PATH)/config ; \
	echo "ar = \"$(RUST_AR)\"" >> $(CARGO_HOME_PATH)/config ; \
	echo "[build]" >> $(CARGO_HOME_PATH)/config ; \
	echo "rustc = \"$(RUST_BIN_PATH)/rustc\"" >> $(CARGO_HOME_PATH)/config ; \
	echo "target = \"$(RUST_TRIPLET)\"" >> $(CARGO_HOME_PATH)/config ; \
	)
endef

define Build/Compile/Cargo
	(cd $1 ; \
	$(CARGO_MAKE_VARS) $(CARGO_MAKE) $(CARGO_MAKE_ARGS)  \
	)
endef


#$(MAKE_VARS) $(MAKE) $(MAKE_ARGS)  \

