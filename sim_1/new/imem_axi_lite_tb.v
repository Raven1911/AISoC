`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/04/2025 06:17:18 PM
// Design Name: 
// Module Name: imem_axi_lite_tb
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


module imem_axi_lite_tb;

    reg clk, resetn;
    reg [31:0] i_axi_araddr;
    reg i_axi_arvalid, i_axi_rready;
    wire o_axi_arready, o_axi_rvalid;
    wire [31:0] o_axi_rdata;

    imem_axi_lite #(
        .MEM_SIZE(16384)
    ) uut (
        .clk(clk), .resetn(resetn),
        .i_axi_araddr(i_axi_araddr), .i_axi_arvalid(i_axi_arvalid), .o_axi_arready(o_axi_arready),
        .o_axi_rdata(o_axi_rdata), .o_axi_rvalid(o_axi_rvalid), .i_axi_rready(i_axi_rready)
    );

    always #5 clk = ~clk; // 100MHz clock

    initial begin
        clk = 0; resetn = 0;
        i_axi_araddr = 0; i_axi_arvalid = 0; i_axi_rready = 0;

        #20 resetn = 1;

        // Read transaction
        #10 i_axi_araddr = 32'h0000; i_axi_arvalid = 1;
        wait(o_axi_arready);
        #10 i_axi_arvalid = 0;
        wait(o_axi_rvalid); i_axi_rready = 1;
        #10 $display("Read data at 0x0000: %h", o_axi_rdata);
        #10
        i_axi_rready = 0;

        // Read transaction
        #10 i_axi_araddr = 32'h0001; i_axi_arvalid = 1;
        wait(o_axi_arready);
        #10 i_axi_arvalid = 0;
        wait(o_axi_rvalid); i_axi_rready = 1;
        #10 $display("Read data at 0x0001: %h", o_axi_rdata);
        i_axi_rready = 0;

        #100 $finish;
    end
endmodule
