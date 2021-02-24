using DAQC2Plate
using Test
using Underscores
using Lazy

@testset "DAQC2Plate.jl" begin

end

function test_plate(ADDR)
    app(a, b) = *(a, b)
    @>> getID(ADDR) app("Plate ID: ") println
    @>> getFWrev(ADDR) string app("Firmware version: ") println
    @>> getLED(ADDR) app("Current LED: ") println
    @>> getFREQ(ADDR) string app("Current Frequency: ") println
    @>> getPWM(ADDR, 0) string app("PWM Ch 0: ") println
    @>> getPWM(ADDR, 1) string app("PWM Ch 1: ") println
    @>> getINTflags(ADDR) string app("INTflags: ") println
    println("ADC Channels")
    @_ map(getADC(0, _), 0:7) |> println
    println("DIN Channels")
    @_ map(getDINbit(0, _), 0:7) |> println
    println("Set LED")
    setLED(ADDR, "white")
    sleep(0.5)
    setLED(ADDR, "blue")
    sleep(0.5)
    setLED(ADDR, "green")
    sleep(0.5)
    setLED(ADDR, "red")
    sleep(0.5)
    setLED(ADDR, "off")
    sleep(0.5)
    setLED(ADDR, "white")
    function setDOUT(i)
        setDOUTbit(ADDR, i)
        sleep(0.5)
    end
    println("Setting DOUT")
    map(setDOUT, 0:7)
    println("Toggle DOUT")
    function toggleDOUT(i)
        toggleDOUTbit(ADDR, i)
        sleep(0.5)
        toggleDOUTbit(ADDR, i)
    end
    map(toggleDOUT, 0:7)

    function clrDOUT(i)
        clrDOUTbit(ADDR, i)
        sleep(0.5)
        clrDOUTbit(ADDR, i)
    end
    map(clrDOUT, 0:7)
end

test_plate(0)
