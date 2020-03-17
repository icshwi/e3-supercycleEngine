require "mrfioc2"           "2.2.0-rc7"
require "supercycleEngine"  "develop"

epicsEnvSet "PSCE"          "TD-M:TS-SCE-01"
epicsEnvSet "PEVG"          "TD-M:TS-EVG-01"

epicsEnvUnset "PEVG"
epicsEnvSet "PEVG"          "MTCA5U-EVG"

epicsEnvSet "DBUFL"         "../reftabs/init/databuffer-ess.json"
epicsEnvSet "MEVTSL"        "../reftabs/init/mevts-ess.json"
epicsEnvSet "SCTROOT"       "../reftabs/supercycles/"

# Load environment
iocshLoad "mtca.iocsh"
iocshLoad "ts.iocsh"
# Load record instances
iocshLoad "evm.iocsh"       "P=MTCA5U,  DEV=EVG,   PCIID=$(MTCA_5U_PCIID7)"
iocshLoad "sce.iocsh"       "P=$(PSCE), PG=$(PEVG)"

iocInit

iocshLoad "evgr.iocsh"      "P=$(PEVG), INTRF=, INTPPS="
iocshLoad "evgseqr.iocsh"   "P=$(PEVG)"

dbl > "TD-M-M.pvlist"
