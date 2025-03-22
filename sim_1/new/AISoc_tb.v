`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/19/2025 05:15:29 PM
// Design Name: 
// Module Name: AISoc_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module AISoc_tb(

    );

    reg clk, resetn;
    wire trap;

    AISoc Top_Module(
    .clk(clk),
    .resetn(resetn),
    .trap(trap)
    );

    always #5 clk = ~clk; // 100MHz clock

    initial begin
        clk = 0;
        resetn = 0;

        #10 resetn = 1;

        #10000 $finish;
    end


endmodule
