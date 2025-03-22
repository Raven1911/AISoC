`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/04/2025 04:43:59 PM
// Design Name: 
// Module Name: dmem_axi_lite
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


module dmem_axi_lite #(
    parameter MEM_SIZE = 1024, // 16KB
    parameter ADDR_WIDTH = 32,
    parameter DATA_WIDTH = 32
)(  
    input clk,
    input resetn,

    //AXI-Lite Write Address Channels
    input [ADDR_WIDTH-1:0] i_axi_awaddr,
    input i_axi_awvalid,
    output reg o_axi_awready,

    //AXI-Lite Write Data Channel
    input [DATA_WIDTH-1:0] i_axi_wdata,
    input [3:0] i_axi_wstrb,
    input i_axi_wvalid,
    output reg o_axi_wready,

    //AXI-Lite Write Response Channels
    output reg o_axi_bvalid,
    input i_axi_bready,

    //AXI-Lite Read Address Channels
    input [ADDR_WIDTH-1:0] i_axi_araddr,
    input i_axi_arvalid,
    output reg o_axi_arready,

    //AXI4-Lite Read Data Channel
    output reg [DATA_WIDTH-1:0] o_axi_rdata,
    output reg o_axi_rvalid,
    input i_axi_rready

    );

    //state declaration

    // Write channel FSM
    localparam W_ADDRESS   = 2'b00;
    localparam W_WRITE     = 2'b01;
    localparam W_RESPONSE  = 2'b10;

    // read channel FSM
    localparam R_ADDRESS   = 2'b00;
    localparam R_READ      = 2'b01;

    reg [1:0] W_state, R_state; // Fsm state

    //signals to connect to dmem
    reg [3:0] wen;
    reg [ADDR_WIDTH-1:0] addr_r, addr_w;
    reg [DATA_WIDTH-1:0] din;
    wire [DATA_WIDTH-1:0] dout;


    //Write channel FSM
    always @(posedge clk or negedge resetn) begin
        if (~resetn) begin
            o_axi_awready <= 0;
            o_axi_wready  <= 0;
            o_axi_bvalid  <= 0;
            W_state       <= W_ADDRESS;
            wen           <= 4'b0000;
            addr_w        <= 0;
            din           <= 0;
        end
        else begin
            case (W_state)
                W_ADDRESS: begin
                    o_axi_bvalid  <= 0;
                    if (i_axi_awvalid) begin
                        o_axi_awready <= 1;
                        addr_w        <= i_axi_awaddr; // Lưu địa chỉ ghi
                        W_state       <= W_WRITE;
                    end
                     
                end
                W_WRITE: begin
                    o_axi_awready <= 0;
                    if (i_axi_wvalid) begin
                        o_axi_wready  <= 1;
                        wen           <= i_axi_wstrb;
                        din           <= i_axi_wdata;
                        W_state       <= W_RESPONSE;
                         
                    end
          
                    
                end
                W_RESPONSE: begin
                    o_axi_wready  <= 0;
                    wen           <= 4'b0000;
                    if (i_axi_bready) begin     
                        o_axi_bvalid  <= 1;
                        W_state       <= W_ADDRESS;
                    end

                end

                default: W_state <= W_ADDRESS;
            endcase
        end
    end


    //read channel FSM
    always @(posedge clk or negedge resetn) begin
        if (~resetn) begin
            o_axi_arready   <= 0;
            o_axi_rvalid    <= 0;
            o_axi_rdata     <= 0;
            R_state         <= R_ADDRESS;
            addr_r          <= 0;

        end

        else begin
            case (R_state)
                R_ADDRESS: begin
                    o_axi_rvalid    <= 0;
                    if(i_axi_arvalid) begin
                        o_axi_arready   <= 1;
                        addr_r          <= i_axi_araddr; //luu dia chi doc
                        R_state         <= R_READ;
                    end
                end

                R_READ: begin
                    o_axi_arready   <= 0;
                    if (i_axi_rready) begin
                        o_axi_rvalid    <= 1;
                        o_axi_rdata     <= dout;
                        R_state         <= R_ADDRESS;
                    end
                end

                default: R_state <= R_ADDRESS;
            endcase

        end


    end


    // Instantiate dmem module
    dmem #(
        .MEM_SIZE(MEM_SIZE),
        .ADDR_WIDTH(ADDR_WIDTH),
        .DATA_WIDTH(DATA_WIDTH)
    ) dmem_unit(
        .clk(clk),
        .wen(wen),
        .addr_r(addr_r >> 2), // Word-aligned address (ignore lower 2 bits)
        .addr_w(addr_w >> 2), // Word-aligned address (ignore lower 2 bits)
        .din(din),
        .dout(dout)
    );


endmodule



module dmem #(
    parameter MEM_SIZE = 1024, // 16KB
    parameter ADDR_WIDTH = 32,
    parameter DATA_WIDTH = 32

)(
    input clk,
    input [3:0] wen,
    input [ADDR_WIDTH-1:0] addr_r, addr_w,
    input [DATA_WIDTH-1:0] din,
    output reg [DATA_WIDTH-1:0] dout
    );

    //big endian
    reg [DATA_WIDTH-1:0] dmem [0:MEM_SIZE-1];
    initial $readmemh("firmware.hex", dmem);

    always @(posedge clk) begin
        dout <= dmem[addr_r];
        if (wen[0]) dmem[addr_w][ 7: 0] <= din[ 7: 0];
		if (wen[1]) dmem[addr_w][15: 8] <= din[15: 8];
		if (wen[2]) dmem[addr_w][23:16] <= din[23:16];
		if (wen[3]) dmem[addr_w][31:24] <= din[31:24];
        
    end

    
endmodule


