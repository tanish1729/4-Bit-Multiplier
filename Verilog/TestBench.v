`timescale 1ns/1ps
module TestBench();
    // Specifying sizes to test inputs and outputs
    reg [3:0] A;
    reg [3:0] B;
    wire[7:0] P;
    // Initialising the Multiplier module
    FourBitMultiplier Testing(A,B,P);
        initial begin
            // Generating vcd file
            $dumpfile("FourBitMultiplier.vcd");
            $dumpvars(0,TestBench);
            $monitor($time, "        A = %d and B = %d. Their product AxB = %d", A, B, P);
            // Giving inputs so we can see if we get the correct output
            // Decimal Inputs
            A = 4'd0;   B = 4'd0;
            #10
            A = 4'd5;  B = 4'd0;
            #10
            A = 4'd1;   B= 4'd1;
            #10
            A = 4'd7;   B= 4'd1;
            #10
            A = 4'd3;   B= 4'd3;
            #10
            A = 4'd8;   B= 4'd14;
            #10
            A = 4'd6;   B= 4'd15;
            #10
            A = 4'd12;   B= 4'd14;
            #10
            A = 4'd15;   B= 4'd15;
            #10
            // Binary Inputs
            A = 4'b1011;   B= 4'b1101;
            #10
            A = 4'b11;   B= 4'b1111;
            #10
            A = 4'b0011;   B= 4'b0001;
            #10
            // Hexadecimal Inputs
            A = 4'hC;   B= 4'hA;
            #10
            A = 4'h5;   B= 4'h9;
            #10
            A = 4'h0;   B= 4'hD;
            #10
            $finish;
        end
endmodule