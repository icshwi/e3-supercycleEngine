# .cmd
# ====
epicsEnvSet("TOP", "$(E3_CMD_TOP)/../..")
iocshLoad("$(TOP)/iocsh/env-init.iocsh")

#epicsEnvSet("LOCATION","MBL-070ROW:CNPW-U-017:AMC2")

epicsEnvSet("IOC", "MTCA5U")
epicsEnvSet("DEV", "EVG")

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

require mrfioc2, 2.2.0-rc7
require supercycleEngine, master

# mTCA-XU
iocshLoad("$(TOP)/iocsh/evm-mtca-init.iocsh", "IOC=$(IOC), DEV=$(DEV), PCIID=$(MTCA_5U_PCIID7)")
dbLoadRecords("db/engine.db",   "P=$(PSCE01),   PEVG=$(PEVG01)")
dbLoadRecords("db/engineCtrl.db",   "P=$(PSCE01)")

# Realtime kernel
# iocshLoad("$(TOP)/iocsh/evm-mtca-init.iocsh", "S=$(IOC), DEV=$(DEV), PCIID=0b:00.0, RT=wtRT")

iocInit()

# RUNTIME
# =======
#iocshLoad("$(TOP)/iocsh/evg-run.iocsh", "IOC=$(IOC), DEV=$(DEV), INTREF=''")
#iocshLoad("$(TOP)/iocsh/evg-seq0-NBP-run.iocsh", "IOC=$(IOC), DEV=$(DEV)")
#iocshLoad("$(TOP)/iocsh/evr-output-run.iocsh", "IOC=$(IOC), DEV=$(DEV)U, FPOUT0=")

dbl > "${IOC}-${DEV}.pvlist"

#EOF
