#!../../bin/linux-x86_64/germDaemon

#- You may have to change germDaemon to something else
#- everywhere it appears in this file

< envPaths

epicsEnvSet("SYS", "det1")
epicsEnvSet("DEV", "")
epicsEnvSet("NELM_MCA_GERM384", "1572864")
epicsEnvSet("NELM_TDC_GERM384", "393216")

epicsEnvSet("EPICS_CA_AUTO_ADDR_LIST",         "NO")
epicsEnvSet("EPICS_CA_ADDR_LIST"     ,         "192.168.4.255")
epicsEnvSet("EPICS_CAS_AUTO_BEACON_ADDR_LIST", "NO")
epicsEnvSet("EPICS_CAS_BEACON_ADDR_LIST",      "192.168.4.255")
epicsEnvSet("EPICS_CAS_INTF_ADDR_LIST",        "192.168.4.1")


cd $(TOP)

## Register all support components
dbLoadDatabase("dbd/germDaemon.dbd",0,0)
germDaemon_registerRecordDeviceDriver(pdbbase) 

## Load record instances
dbLoadRecords("db/germ.db","Sys=$(SYS), Dev=$(DEV), NELM_MCA=$(NELM_MCA_GERM384), NELM_TDC=$(NELM_TDC_GERM384)")

iocInit()

dbl
