`timescale 1ns/1ps
// 4 Bit Half Adder Module
module FourBitHalfAdder(a,b,sum,carry);
    // Specifying sizes of inputs and outputs
    input[3:0] a;
    input[3:0] b;
    output[3:0] sum;
    output[3:0] carry;
    // Assigning values to outputs
    assign sum = a^b;
    assign carry = a&b;
endmodule

// 4 Bit Full Adder Module
module FourBitFullAdder(a,b,carry_in,sum,carry_out);
    // Specifying sizes of inputs and outputs
    input[3:0] a;
    input[3:0] b;
    input[3:0] carry_in;
    output[3:0] sum;
    output[3:0] carry_out;
    // Assigning values to outputs
    assign sum = (a^b)^carry_in;
    assign carry_out = (a&b)|((a^b)&carry_in);
endmodule

module FourBitMultiplier(a, b, p);
    // Specifying sizes of inputs and outputs
    input[3:0] a;
    input[3:0] b;
    output[7:0] p;
    // Declaring wires
    wire[3:0] temp1;
    wire[3:0] temp2;
    wire[3:0] temp3;
    wire[3:0] temp4;
    wire[3:0] temp5;
    wire[3:0] temp6;
    wire[3:0] temp7;
    wire[3:0] c1;
    wire[3:0] c2;
    wire[3:0] c3;
    wire[3:0] c4;
    wire[3:0] c5;
    wire[3:0] c6;
    wire[3:0] c7;
    wire[3:0] c8;
    wire[3:0] c9;
    wire[3:0] c10;
    wire[3:0] c11;
    // Making instances of Half Adder and Full Adder modules to assign outputs
    assign p[0] = a[0]&b[0];
    FourBitHalfAdder HA1(a[0]&b[1],a[1]&b[0],p[1],c1);
    FourBitHalfAdder HA2(a[1]&b[1],a[2]&b[0],temp2,c2);
    FourBitFullAdder FA1(a[0]&b[2],temp2, c1,p[2],c3);
    FourBitHalfAdder HA3(a[2]&b[1],a[3]&b[0],temp3,c4);
    FourBitFullAdder FA2(a[1]&b[2],temp3,c2,temp4,c5);
    FourBitFullAdder FA3(a[0]&b[3],temp4,c3,p[3],c6);
    FourBitFullAdder FA4(a[2]&b[2],a[3]&b[1],c4,temp5,c7);
    FourBitFullAdder FA5(a[1]&b[3],temp5,c5,temp6,c8);
    FourBitHalfAdder HA4(temp6,c6,p[4],c9);
    FourBitFullAdder FA6(a[2]&b[3],a[3]&b[2],c7,temp7,c10);
    FourBitFullAdder FA7(temp7,c8,c9,p[5],c11);
    FourBitFullAdder FA8(a[3]&b[3],c10,c11,p[6],p[7]);
endmodule
