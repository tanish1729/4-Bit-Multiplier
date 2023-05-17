.include ../../TSMC_180nm.txt
.include not.sub
.include and.sub
.include or.sub
.include xor.sub

* Parameters
.param LAMBDA=0.09u
.param width_N=10*LAMBDA
.param width_P=20*LAMBDA
.global Vdd GND

* Input Voltages
Vnew Vdd Gnd 5
Va A Gnd pulse 5 0 0 100p 100p 10n 20n
Vb B Gnd pulse 5 0 0 100p 100p 20n 40n

* Circuit Description
* xnot output A Vnew GND not
* xand output A B Vnew GND and
xor output A B Vnew GND or
* xxor output A B Vnew GND xor

* Analysis
.tran 100p 40n

* Plotting
.control
run
* plot A output+6
plot A B+6 output+12
.endc

.end