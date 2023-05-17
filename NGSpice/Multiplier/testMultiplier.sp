.include ../../TSMC_180nm.txt
.include ../Gates/not.sub
.include ../Gates/and.sub
.include ../Gates/or.sub
.include ../Gates/xor.sub
.include ../Adders/halfAdder.sub
.include ../Adders/fullAdder.sub
.include multiplier.sub

* Parameters
.param LAMBDA=0.09u
.param width_N=10*LAMBDA
.param width_P=20*LAMBDA
.global Vdd GND

* Input Voltages
Vnew Vdd Gnd 5
Va0 a0 Gnd 5
Va1 a1 Gnd 0
Va2 a2 Gnd 0
Va3 a3 Gnd 5
Vb0 b0 Gnd 0
Vb1 b1 Gnd 5
Vb2 b2 Gnd 0
Vb3 b3 Gnd 0

* Circuit Description
xmultiplier p7 p6 p5 p4 p3 p2 p1 p0 a3 a2 a1 a0 b3 b2 b1 b0 Vnew GND multiplier

* Analysis
.tran 100p 2560n

* Plotting
.control
run
* plot a0 a1+6 a2+12 a3+18 b0+24 b1+30 b2+36 b3+42
plot p0 p1+6 p2+12 p3+18 p4+24 p5+30 p6+36 p7+42
.endc

.end