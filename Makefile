include paths.mk

.DEFAULT_GOAL	:= usage

MAKE	:= make --no-print-directory
MK		:= $(BUILDDEFS_PATH)/build_keyboard.mk

SILENT	?= false

# --

usage:
	@echo "usage: make <keyboard>:<keymap>[:<target>]"

.PHONY: usage

KEYMAPS	:= $(foreach directory,$(dir $(shell find keyboards/ -name 'keymap.c')),$(subst /keymaps/,:,$(directory:keyboards/%/=%)))

define generate
$(eval ARGS := $(subst :, ,$(1)))
$(eval KEYBOARD := $(word 1, $(ARGS)))
$(eval KEYMAP := $(word 2, $(ARGS)))

$(KEYBOARD)\:$(KEYMAP): $(KEYBOARD)\:$(KEYMAP)\:build

$(KEYBOARD)\:$(KEYMAP)\:build:
	@$(MAKE) -f $(MK) SILENT=$(SILENT) KEYBOARD=$(KEYBOARD) KEYMAP=$(KEYMAP) build

$(KEYBOARD)\:$(KEYMAP)\:flash:
	@$(MAKE) -f $(MK) SILENT=$(SILENT) KEYBOARD=$(KEYBOARD) KEYMAP=$(KEYMAP) flash

.PHONY: $(KEYBOARD)\:$(KEYMAP) $(KEYBOARD)\:$(KEYMAP)\:build $(KEYBOARD)\:$(KEYMAP)\:flash
endef

$(foreach keymap,$(KEYMAPS),$(eval $(call generate,$(keymap))))
