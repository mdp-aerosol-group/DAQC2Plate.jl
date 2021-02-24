module DAQC2Plate

using PyCall

export getADC,
    getDINbit,
    getID,
    getFWrev,
    getPWM,
    getFREQ,
    getLED,
    setDAC,
    setDOUTbit,
    setPWM,
    setLED,
    toggleDOUTbit,
    clrDOUTbit,
    getINTflags,
    intEnable,
    intDisable,
    enableDINint,
    disableDINint

function __init__()
    py"""
    import piplates.DAQC2plate as DAQC2
    """
end

getID(addr) = py"DAQC2.getID"(addr)
getFWrev(addr) = py"DAQC2.getFWrev"(addr)
getPWM(addr, ch) = py"DAQC2.getPWM"(addr, ch)
getFREQ(addr) = py"DAQC2.getFREQ"(addr)
getLED(addr) = py"DAQC2.getLED"(addr)

intEnable(addr) = py"DAQC2.intEnable"(addr)
intDisable(addr) = py"DAQC2.intDisable"(addr)
getINTflags(addr) = py"DAQC2.getINTflags"(addr)

enableDINint(addr, bit, edge) = py"DAQC2.enableDINint"(addr, bit, edge)
disableDINint(addr, bit) = py"DAQC2.disableDINint"(addr, bit)

clrDOUTbit(addr, bit) = py"DAQC2.clrDOUTbit"(addr, bit)
toggleDOUTbit(addr, bit) = py"DAQC2.toggleDOUTbit"(addr, bit)

""" getADC(addr, ch)
    Dual read necessary on my system. Single read produces lagged value. 
    Need to test if this is necessary in future versions
"""
function getADC(addr, ch)
    py"DAQC2.getADC"(addr, ch)
    sleep(0.1)
    py"DAQC2.getADC"(addr, ch)
end

""" getDINbit(addr, ch)
    Dual read necessary on my system. Single read produces lagged value. 
    Need to test if this is necessary in future versions
"""
function getDINbit(addr, bit)
    py"DAQC2.getDINbit"(addr, bit)
    sleep(0.1)
    py"DAQC2.getDINbit"(addr, bit)
end

setDAC(addr, ch, value) = py"DAQC2.setDAC"(addr, ch, value)
setDOUTbit(addr, bit) = py"DAQC2.setDOUTbit"(addr, bit)
setPWM(addr, ch, value) = py"DAQC2.setPWM"(addr, ch, value)
setLED(addr, color) = py"DAQC2.setLED"(addr, color)

end
