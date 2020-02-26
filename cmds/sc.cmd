# .cmd
# ====
epicsEnvSet("TOP", "$(E3_CMD_TOP)/..")
iocshLoad("$(TOP)/iocsh/ENV.iocsh")
iocshLoad("$(TOP)/iocsh/TD-M.iocsh")

epicsEnvUnset("PEVG01")
epicsEnvSet("PEVG01", "MTCA5U-EVG:")

require supercycleEngine, master

dbLoadRecords("engine.db",   "P=$(PSCE01),   PEVG=$(PEVG01)")
dbLoadRecords("engineCtrl.db",   "P=$(PSCE01)")

var iodebug 4

iocInit()

dbl > "$(PSCE01).pvlist"

#EOF
