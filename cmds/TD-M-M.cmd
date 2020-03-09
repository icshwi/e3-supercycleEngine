# Init environment
epicsEnvSet("TOP", "$(E3_CMD_TOP)/..")
iocshLoad("$(TOP)/iocsh/mtcai.iocsh")
iocshLoad("$(TOP)/iocsh/tsi.iocsh")

# Maintenance
epicsEnvSet("LOCATION", "MBL-070ROW:CNPW-U-017")
epicsEnvSet("FBS",      "=ESS.INFR.K01.K01")

epicsEnvSet("PSCE",     "TD-M:TS-SCE-01:")
epicsEnvSet("PEVG",     "TD-M:TS-EVG-01:")

epicsEnvUnset("PEVG")
epicsEnvSet("PEVG",     "MTCA5U-EVG:")

epicsEnvSet("DBUFL",    "$(TOP)/../reftabs/init/databuffer-ess.json")
epicsEnvSet("MEVTSL",   "$(TOP)/../reftabs/init/mevts-ess.json")
epicsEnvSet("SCTROOT",  "$(TOP)/../reftabs/supercycles/")

require "mrfioc2" "2.2.0-rc7"
require "supercycleEngine" "master"

## Load record instances

#dbLoadRecords("$(TOP)/db/devg.db",   "P=$(PEVG)")
iocshLoad("$(TOP)/iocsh/evmi.iocsh", "P=MTCA5U, DEV=EVG, PCIID=$(MTCA_5U_PCIID7)")
iocshLoad("$(TOP)/iocsh/scei.iocsh", "P=$(PSCE), PG=$(PEVG)")

iocInit()

iocshLoad("$(TOP)/iocsh/evgr.iocsh", "P=$(PEVG), INTREF=")

dbl > "TD-M-M.pvlist"
