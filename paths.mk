# Basic paths overrides to allow QMK to do it's thing
TOP_DIR := qmk_firmware

TMK_DIR  := tmk_core
TMK_PATH := $(TOP_DIR)/$(TMK_DIR)

LIB_DIR  := lib
LIB_PATH := $(TOP_DIR)/$(LIB_DIR)

QUANTUM_DIR  := quantum
QUANTUM_PATH := $(TOP_DIR)/$(QUANTUM_DIR)

DRIVER_DIR  := drivers
DRIVER_PATH := $(TOP_DIR)/$(DRIVER_DIR)

PLATFORM_DIR  := platforms
PLATFORM_PATH := $(TOP_DIR)/$(PLATFORM_DIR)

PROTOCOL_DIR  := protocol
PROTOCOL_PATH := $(TOP_DIR)/$(TMK_DIR)/$(PROTOCOL_DIR)

BUILDDEFS_DIR  := builddefs
BUILDDEFS_PATH := $(TOP_DIR)/$(BUILDDEFS_DIR)

BUILD_DIR := .build
QMK_BIN   := QMK_HOME=$(TOP_DIR) qmk

COMMON_VPATH := .
COMMON_VPATH += $(TOP_DIR)
COMMON_VPATH += $(TMK_PATH)
COMMON_VPATH += $(QUANTUM_PATH)
COMMON_VPATH += $(QUANTUM_PATH)/keymap_extras
COMMON_VPATH += $(QUANTUM_PATH)/process_keycode
COMMON_VPATH += $(QUANTUM_PATH)/sequencer
COMMON_VPATH += $(DRIVER_PATH)

## Those are for upstream `qmk_firmware`:
# QUANTUM_DIR  := $(TOP_DIR)/quantum
# QUANTUM_PATH := $(QUANTUM_DIR)
# COMMON_VPATH += $(PROTOCOL_PATH)
