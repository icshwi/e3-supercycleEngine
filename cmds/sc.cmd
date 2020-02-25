# .cmd
# ====
#epicsEnvSet("TOP", "$(E3_CMD_TOP)/../..")
#iocshLoad("$(TOP)/iocsh/env-init.iocsh")

# Naming: AS:DS-ID
epicsEnvSet("AS",        "TD-M")                # Area Structure
 # SCE IOC
epicsEnvSet("DSSCE",     "TS-SCE")              # Device Structure SCE
epicsEnvSet("PSCE01",    "$(AS):$(DSSCE)-01:")  # Prefix of the SCE 01
 # EVG IOC
epicsEnvSet("DSEVG",     "TS-EVG")              # Device Structure EVG
epicsEnvSet("PEVG01",    "$(AS):$(DSEVG)-01:")  # Prefix of the EVG 01

epicsEnvUnset("PEVG01")
epicsEnvSet("PEVG01", "MTCA5U-EVG:")

#require mrfioc2, 2.2.0-rc7
require supercycleEngine, master

# mTCA-XU
#iocshLoad("$(TOP)/iocsh/evm-mtca-init.iocsh", "IOC=$(IOC), DEV=$(DEV), PCIID=$(MTCA_5U_PCIID7)")
dbLoadRecords("engine.db",   "P=$(PSCE01),   PEVG=$(PEVG01)")
dbLoadRecords("engineCtrl.db",   "P=$(PSCE01)")

var iodebug 4

iocInit()

dbl > "${IOC}-${DEV}.pvlist"

#EOF
