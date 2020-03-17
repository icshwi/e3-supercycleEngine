# Init environment
epicsEnvSet "TOP" "$(E3_CMD_TOP)/.."
iocshLoad "$(TOP)/iocsh/mtca.iocsh"
iocshLoad "$(TOP)/iocsh/ts.iocsh"

epicsEnvSet "PSCE"     "TD-M:TS-SCE-01"
epicsEnvSet "PEVG"     "TD-M:TS-EVG-01"

epicsEnvUnset "PEVG"
epicsEnvSet "PEVG"     "MTCA5U-EVG"

epicsEnvSet "DBUFL"    "$(TOP)/../reftabs/init/databuffer-ess.json"
epicsEnvSet "MEVTSL"   "$(TOP)/../reftabs/init/mevts-ess.json"
epicsEnvSet "SCTROOT"  "$(TOP)/../reftabs/supercycles/"

require "mrfioc2" "2.2.0-rc7"
require "supercycleEngine" "develop"

## Load record instances
iocshLoad "$(TOP)/iocsh/evm.iocsh"      "P=MTCA5U,  DEV=EVG,   PCIID=$(MTCA_5U_PCIID7)"
iocshLoad "$(TOP)/iocsh/sce.iocsh"      "P=$(PSCE), PG=$(PEVG)"

iocInit

iocshLoad "$(TOP)/iocsh/evgr.iocsh"     "P=$(PEVG), INTRF=, INTPPS="
iocshLoad "$(TOP)/iocsh/evgseqr.iocsh"  "P=$(PEVG)"

dbl > "TD-M-M.pvlist"
