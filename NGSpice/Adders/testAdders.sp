.include ../../TSMC_180nm.txt
.include ../Gates/not.sub
.include ../Gates/and.sub
.include ../Gates/or.sub
.include ../Gates/xor.sub
.include halfAdder.sub
.include fullAdder.sub

* Parameters
.param LAMBDA=0.09u
.param width_N=10*LAMBDA
.param width_P=20*LAMBDA
.global Vdd GND

* Input Voltages
Vnew Vdd Gnd 5
Va A Gnd pulse 5 0 0 100p 100p 10n 20n
Vb B Gnd pulse 5 0 0 100p 100p 20n 40n
VCin Cin Gnd pulse 5 0 0 100p 100p 40n 80n

* Circuit Description
* xhalfadder sum carry A B Vnew GND halfadder
* xfulladder sum carry A B Cin Vnew GND fulladder

* Analysis
.tran 100p 80n

* Plotting
.control
run
* plot A B+6 sum+12 carry+18
* plot A B+6 Cin+12 sum+18 carry+24
.endc

.end