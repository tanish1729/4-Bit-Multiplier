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

* Case -> A = B = 15
* Input Voltages
Vnew Vdd Gnd 5
Va0 a0 Gnd 5
Va1 a1 Gnd 5
Va2 a2 Gnd 5
Va3 a3 Gnd 5
Vb0 b0 Gnd 5
Vb1 b1 Gnd 5
Vb2 b2 Gnd 5
Vb3 b3 Gnd 5

* Circuit Description
xmultiplier p7 p6 p5 p4 p3 p2 p1 p0 a3 a2 a1 a0 b3 b2 b1 b0 Vnew GND multiplier

.tran 0.1n 200n

.measure tran trise 
+ TRIG v(p0) VAL = 2.5 RISE = 1
+ TARG v(a0) VAL = 2.5 RISE = 1 

.measure tran tfall 
+ TRIG v(p0) VAL = 2.5 FALL = 1  
+ TARG v(a0) VAL = 2.5 FALL = 1

.measure tran delay param = '(trise + tfall)/2' goal = 0

.control
tran 1n 120n
quit
.endc

.end