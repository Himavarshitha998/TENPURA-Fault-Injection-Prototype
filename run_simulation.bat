@echo off
if not exist simulation mkdir simulation
iverilog -o simulation\tenpura_demo.vvp src\fault_injection.v testbench\tb_fault_injection.v
if errorlevel 1 (
    echo Compilation failed. Check the error messages above.
    pause
    exit /b 1
)
vvp simulation\tenpura_demo.vvp
echo.
echo To view the waveform, run: gtkwave simulation\fault_injection.vcd
pause
