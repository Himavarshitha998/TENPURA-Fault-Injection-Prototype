# TENPURA-Inspired Fault Injection Prototype

## Project overview
This is a small educational Verilog prototype inspired by the basic fault-evaluation idea:
1. Calculate a normal (golden) output.
2. Inject a controlled fault into the output.
3. Compare the faulty output with the golden output.
4. Report whether the injected fault changes the output.

**Scope:** This is a beginner-friendly demonstration, not a reproduction of the complete TENPURA framework or its research algorithms.

## Tools
- Verilog HDL
- Icarus Verilog (`iverilog` and `vvp`)
- GTKWave (optional, for viewing the waveform)
- Visual Studio Code (editor)

## Folder structure
```text
TENPURA_GitHub_Project/
├── src/
│   └── fault_injection.v
├── testbench/
│   └── tb_fault_injection.v
├── simulation/
│   └── .gitkeep
├── run_simulation.bat
├── .gitignore
└── README.md
```

## How it works
The circuit adds two 4-bit inputs. The golden output is the normal sum. When `fault_enable` is 1, one selected output bit is inverted to create a controlled fault. The testbench compares the golden and faulty outputs.

## Run on Windows
1. Install Icarus Verilog and ensure `iverilog` and `vvp` are available in Command Prompt.
2. Open this project folder in VS Code.
3. Open the terminal: **Terminal → New Terminal**.
4. Run:
   ```bat
   run_simulation.bat
   ```
5. The testbench prints PASS/DETECTED messages and creates `simulation/fault_injection.vcd`.

## Run manually
From the project root:
```bash
iverilog -o simulation/tenpura_demo.vvp src/fault_injection.v testbench/tb_fault_injection.v
vvp simulation/tenpura_demo.vvp
```

## View waveform
```bash
gtkwave simulation/fault_injection.vcd
```

## Expected observation
- With fault injection disabled, `golden_sum` and `faulty_sum` should match.
- With fault injection enabled, the selected output bit is inverted. The comparator reports a mismatch when that change affects the output.

## Limitations
- Uses a small 4-bit adder only.
- Injects a controlled output-bit inversion, not physical radiation-induced faults.
- Tests a limited set of input combinations.
- A matching output for one test does not prove that a fault can never affect other inputs or cycles.

## GitHub upload
Create a new **public** or **private** repository on GitHub, then upload this folder using Git:
```bash
git init
git add .
git commit -m "Add TENPURA-inspired fault injection prototype"
git branch -M main
git remote add origin https://github.com/YOUR-USERNAME/TENPURA-Fault-Injection-Prototype.git
git push -u origin main
```
Replace `YOUR-USERNAME` with your GitHub username. Use your actual repository URL.
