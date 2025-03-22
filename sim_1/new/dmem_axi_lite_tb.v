`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/05/2025 03:16:54 PM
// Design Name: 
// Module Name: dmem_axi_lite_tb
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


`timescale 1ns / 1ps
module dmem_axi_lite_tb;
    reg clk, resetn;
    reg [31:0] i_axi_awaddr, i_axi_wdata, i_axi_araddr;
    reg [3:0] i_axi_wstrb;
    reg i_axi_awvalid, i_axi_wvalid, i_axi_bready, i_axi_arvalid, i_axi_rready;
    wire o_axi_awready, o_axi_wready, o_axi_bvalid, o_axi_arready, o_axi_rvalid;
    wire [31:0] o_axi_rdata;

    dmem_axi_lite uut (
        .clk(clk), .resetn(resetn),
        .i_axi_awaddr(i_axi_awaddr), .i_axi_awvalid(i_axi_awvalid), .o_axi_awready(o_axi_awready),
        .i_axi_wdata(i_axi_wdata), .i_axi_wstrb(i_axi_wstrb), .i_axi_wvalid(i_axi_wvalid), .o_axi_wready(o_axi_wready),
        .o_axi_bvalid(o_axi_bvalid), .i_axi_bready(i_axi_bready),
        .i_axi_araddr(i_axi_araddr), .i_axi_arvalid(i_axi_arvalid), .o_axi_arready(o_axi_arready),
        .o_axi_rdata(o_axi_rdata), .o_axi_rvalid(o_axi_rvalid), .i_axi_rready(i_axi_rready)
    );

    always #5 clk = ~clk; // 100MHz clock

    initial begin
        clk = 0; resetn = 0;
        i_axi_awaddr = 0; i_axi_wdata = 0; i_axi_wstrb = 0;
        i_axi_awvalid = 0; i_axi_wvalid = 0; i_axi_bready = 0;
        i_axi_araddr = 0; i_axi_arvalid = 0; i_axi_rready = 0;

        #20 resetn = 1;

        // Write transaction
        #10 i_axi_awaddr = 32'h00000000; i_axi_wdata = 32'hDEADBEEF; i_axi_wstrb = 4'b1011;
        i_axi_awvalid = 1; i_axi_wvalid = 1;
        wait(o_axi_awready & o_axi_wready);
        #10 i_axi_awvalid = 0; i_axi_wvalid = 0;
        wait(o_axi_bvalid); i_axi_bready = 1;
        #10 i_axi_bready = 0;

        // Read transaction
        #10 i_axi_araddr = 32'h00000000; i_axi_arvalid = 1;
        wait(o_axi_arready);
        #10 i_axi_arvalid = 0;
        wait(o_axi_rvalid); i_axi_rready = 1;
        #10 i_axi_rready = 0;

        #100 $finish;
    end
endmodule
