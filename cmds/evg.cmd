# .cmd
# ====
epicsEnvSet("TOP", "$(E3_CMD_TOP)/..")
iocshLoad("$(TOP)/iocsh/ENV.iocsh")
iocshLoad("$(TOP)/iocsh/TD-M.iocsh")

epicsEnvUnset("PEVG01")
epicsEnvSet("PEVG01", "MTCA5U-EVG:")

epicsEnvSet("IOC", "MTCA5U")
epicsEnvSet("DEV", "EVG")

require mrfioc2, 2.2.0-rc7

# mTCA-XU
iocshLoad("evm-mtca-init.iocsh", "IOC=$(IOC), DEV=$(DEV), PCIID=$(MTCA_5U_PCIID7)")

iocInit()

# RUNTIME
# =======
#iocshLoad("$(TOP)/iocsh/evg-run.iocsh", "IOC=$(IOC), DEV=$(DEV), INTREF=''")
#iocshLoad("$(TOP)/iocsh/evg-seq0-NBP-run.iocsh", "IOC=$(IOC), DEV=$(DEV)")
#iocshLoad("$(TOP)/iocsh/evr-output-run.iocsh", "IOC=$(IOC), DEV=$(DEV)U, FPOUT0=")

dbl > "$(PEVG01).pvlist"

#EOF
