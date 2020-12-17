#!/usr/bin/env iocsh.bash
require "supercycleEngine" "devel"

epicsEnvSet "TOP" "$(E3_CMD_TOP)/.."

epicsEnvSet "ENGINEER" "ICS_HWI_WP04"

epicsEnvSet "PSCE" "TD-L5U1:Ctrl-SCE-1"
epicsEnvSet "PEVG" "TD-L5U1:Ctrl-EVG-1"

# Load record instances
dbLoadRecords "$(TOP)/db/devg.db" "P=$(PEVG)"
iocshLoad     "$(supercycleEngine_DIR)/sce.iocsh"   "P=$(PSCE), PG=$(PEVG)"
#var "iodebug" "3"
iocInit

dbl > /tmp/sce.iface
system "grep '[^_]$' /tmp/sce.iface | grep -v EVG | grep -v REQMOD > $(TOP)/docs/sce.iface"
