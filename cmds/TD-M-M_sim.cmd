require "supercycleEngine" "develop"

# Init environment
epicsEnvSet "TOP" "$(E3_CMD_TOP)/.."
iocshLoad "$(TOP)/iocsh/mtca.iocsh"
iocshLoad "$(TOP)/iocsh/ts.iocsh"

epicsEnvSet "PSCE"      "TD-M:TS-SCE-01"
epicsEnvSet "PEVG"      "TD-M:TS-EVG-01"

epicsEnvUnset "PEVG"
epicsEnvSet "PEVG"      "MTCA5U-EVG"

epicsEnvSet "DBUFL"     "$(TOP)/../reftabs/init/databuffer-ess.json"
epicsEnvSet "MEVTSL"    "$(TOP)/../reftabs/init/mevts-ess.json"
epicsEnvSet "SCTROOT"   "$(TOP)/../reftabs/supercycles/"

## Load record instances

dbLoadRecords "$(TOP)/db/devg.db"       "P=$(PEVG)"
iocshLoad     "$(TOP)/iocsh/sce.iocsh"  "P=$(PSCE), PG=$(PEVG)"

iocInit
