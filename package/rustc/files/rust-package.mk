#
## Copyright (C) 2017 CZ.NIC z.s.p.o. (http://www.nic.cz/)
#
## This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
# #
#


#ENV_PATH=cat $(BUILD_DIR)/rust_env_path
#ENV_SCRIPT_PATH:=`cat $(BUILD_DIR)/rust_env_path`

include $(TOPDIR)/build_dir/rust_variables.mk


define Build/Compile/Rust
        (cd $1 ; \
	$(RUST_BIN_PATH)/rustc \
    		--target=$(RUST_TRIPLET) \
    		-C linker=$(RUST_LINKER) \
    		-L $(RUST_LIBS) \
    		$2 ; \
	)
endef
