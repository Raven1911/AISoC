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
    //gpio uart0
    reg rx0;
    wire tx0;

    //port spi0
    wire                          spi0_clk;
    wire                          spi0_mosi;
    reg                           spi0_miso;
    wire     [1:0]                spi0_ss_n;

    AISoc Top_Module(
    .clk(clk),
    .resetn(resetn),
    .trap(trap),
    
    //uart0
    .rx0(rx0),
    .tx0(tx0),
    //spi0
    .spi0_clk(spi0_clk),
    .spi0_mosi(spi0_mosi),
    .spi0_miso(spi0_miso),
    .spi0_ss_n(spi0_ss_n)

    
    );

    always #5 clk = ~clk; // 100MHz clock

    initial begin
        clk = 0;
        //#10 resetn = 1;
        #10 resetn = 0;
        #10 resetn = 1;

        #10000 $finish;
    end


endmodule
