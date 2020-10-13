# .cmd
#require "iocstats" 
require "mrfioc2" "master"
require "supercycleEngine" "master"

epicsEnvSet "TOP" "$(E3_CMD_TOP)/.."

epicsEnvSet "ENGINEER" "ICS_HWI_WP04"
epicsEnvSet "EPICS_CA_MAX_ARRAY_BYTES" "10000000"

epicsEnvSet "PSCE"          "TD-L5U1:Ctrl-SCE-1"
epicsEnvSet "PEVG"          "TD-L5U1:Ctrl-EVG-1"
epicsEnvSet "reftabs_DIR"   "/opt/reftabs"

epicsEnvSet "DBUFL"         "$(reftabs_DIR)/init/databuffer-ess.json"
epicsEnvSet "MEVTSL"        "$(reftabs_DIR)/init/mevts-ess.json"
epicsEnvSet "SCTROOT"       "$(reftabs_DIR)/supercycles/"

# Load record instances
iocshLoad "$(mrfioc2_DIR)/evm.iocsh"            "P=$(PEVG), OBJ=EVG,   PCIID=$(PCI_SLOT=08:00.0)"
iocshLoad "$(TOP)/iocsh/sce.iocsh"              "P=$(PSCE), PG=$(PEVG)"

iocInit

iocshLoad "$(mrfioc2_DIR)/evgr.iocsh"           "P=$(PEVG), INTRF=$(INTRF=), INTPPS=$(INTPPS=)"
iocshLoad "$(mrfioc2_DIR)/evgasynr.iocsh"       "P=$(PEVG), $(ASYNARGS=)"
iocshLoad "$(mrfioc2_DIR)/evgseqr.iocsh"        "P=$(PEVG)"

# EOF
