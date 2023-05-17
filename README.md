# VLSI Design Course Project
# 4 Bit Multiplier
- Tanish Taneja
- 2021112011
---
- As per `ProblemStatement.pdf`, we have to design and test the functioning of a 4 bit multiplier in NGSpice, Magic and Verilog and further estimate the leakage current and power for various input combinations.
- The circuit has been broken down into basic logic gates which are then used to build the adders and finally the multiplier circuit.
- All codes and required images (layouts, plots, gtkwave) are also found in the `ProjectReport.pdf`.
---
# NGSpice
- All the required spice files are in the NGSpice directory along with the obtained plots.
1. To test the gates, go to `NGSpice/Gates/` and run
```
ngspice testGates.sp
```
Uncomment the lines in circuit description as per requirement of gate.  
2. To test the adders, go to `NGSpice/Adders/` and run
```
ngspice testAdders.sp
```
Uncomment the lines in circuit description as per requirement of adder.  
3. To test the multiplier and get required delay values, go to `NGSpice/Multiplier/` and run
```
ngspice testMultiplier.sp
```
- `NGSpice/Plots/` contains the simulation outputs for all gates, adders and the multiplier.
---
# Magic
- All the required magic files are in the Magic directory along with the figures of the obtained layouts.
---
# Verilog 
- All the required Verilog files and the testbench are in the Verilog directory.  
- To run the code 
1.
```
iverilog -o Answer TestBench.v FourBitMultiplier.v
```
This compiles the testbench and the code to generate an output file called `Answer`.  
2.
``` verilog
vvp Answer
```
This executes the Answer output file and displays all the final values as output on the terminal window. It also creates the .vcd file `FourBitMultiplier.vcd`.  
3.
```
gtkwave FourBitMultiplier.vcd
```
This opens the GTKWave for the testbench and code we have written