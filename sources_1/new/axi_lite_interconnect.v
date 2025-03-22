`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/05/2025 05:32:39 PM
// Design Name: 
// Module Name: axi_lite_interconnect
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

/***************************************************************
 * AXI4-Lite Interconnect for picorv32_axi (1 Master, Multiple Slaves)
 ***************************************************************/
module axi_lite_interconnect #(
    parameter NUM_SLAVES = 2,
    parameter ADDR_WIDTH = 32,
    parameter DATA_WIDTH = 32
)(
    // Clock and Reset
    input                     clk,
    input                     reset_n,

    // AXI4-Lite Master Interface (from picorv32_axi)
    input                     mem_axi_awvalid,
    output                    mem_axi_awready,
    input  [ADDR_WIDTH-1:0]   mem_axi_awaddr,
    input  [2:0]              mem_axi_awprot,
    input                     mem_axi_wvalid,
    output                    mem_axi_wready,
    input  [DATA_WIDTH-1:0]   mem_axi_wdata,
    input  [DATA_WIDTH/8-1:0] mem_axi_wstrb,
    output                    mem_axi_bvalid,
    input                     mem_axi_bready,
    input                     mem_axi_arvalid,
    output                    mem_axi_arready,
    input  [ADDR_WIDTH-1:0]   mem_axi_araddr,
    input  [2:0]              mem_axi_arprot,
    output                    mem_axi_rvalid,
    input                     mem_axi_rready,
    output [DATA_WIDTH-1:0]   mem_axi_rdata,

    // AXI4-Lite Slave Interfaces
    output [NUM_SLAVES-1:0][ADDR_WIDTH-1:0]    S_AWADDR,
    output [NUM_SLAVES-1:0]                    S_AWVALID,
    input  [NUM_SLAVES-1:0]                    S_AWREADY,
    output [NUM_SLAVES-1:0][2:0]               S_AWPROT,
    output [NUM_SLAVES-1:0][DATA_WIDTH-1:0]    S_WDATA,
    output [NUM_SLAVES-1:0][DATA_WIDTH/8-1:0]  S_WSTRB,
    output [NUM_SLAVES-1:0]                    S_WVALID,
    input  [NUM_SLAVES-1:0]                    S_WREADY,
    input  [NUM_SLAVES-1:0][1:0]               S_BRESP,
    input  [NUM_SLAVES-1:0]                    S_BVALID,
    output [NUM_SLAVES-1:0]                    S_BREADY,
    output [NUM_SLAVES-1:0][ADDR_WIDTH-1:0]    S_ARADDR,
    output [NUM_SLAVES-1:0]                    S_ARVALID,
    input  [NUM_SLAVES-1:0]                    S_ARREADY,
    output [NUM_SLAVES-1:0][2:0]               S_ARPROT,
    input  [NUM_SLAVES-1:0][DATA_WIDTH-1:0]    S_RDATA,
    input  [NUM_SLAVES-1:0]                    S_RVALID,
    output [NUM_SLAVES-1:0]                    S_RREADY
);

    // Internal signals for slave selection
    wire [NUM_SLAVES-1:0] slave_select_write;
    wire [NUM_SLAVES-1:0] slave_select_read;

    // Decoder: Select slave based on address
    axi_lite_decoder #(
        .NUM_SLAVES(NUM_SLAVES),
        .ADDR_WIDTH(ADDR_WIDTH)
    ) decoder (
        .AWADDR(mem_axi_awaddr),
        .ARADDR(mem_axi_araddr),
        .AWVALID(mem_axi_awvalid),
        .ARVALID(mem_axi_arvalid),
        .slave_select_write(slave_select_write),
        .slave_select_read(slave_select_read)
    );

    // Multiplexer: Route data between master and selected slave
    axi_lite_mux #(
        .NUM_SLAVES(NUM_SLAVES),
        .DATA_WIDTH(DATA_WIDTH)
    ) mux (
        .M_AWVALID(mem_axi_awvalid),
        .M_AWREADY(mem_axi_awready),
        .M_WVALID(mem_axi_wvalid),
        .M_WREADY(mem_axi_wready),
        .M_WDATA(mem_axi_wdata),
        .M_WSTRB(mem_axi_wstrb),
        .M_BVALID(mem_axi_bvalid),
        .M_BREADY(mem_axi_bready),
        .M_BRESP(mem_axi_bresp),
        .M_ARVALID(mem_axi_arvalid),
        .M_ARREADY(mem_axi_arready),
        .M_RVALID(mem_axi_rvalid),
        .M_RREADY(mem_axi_rready),
        .M_RDATA(mem_axi_rdata),
        .slave_select_write(slave_select_write),
        .slave_select_read(slave_select_read),
        .S_AWVALID(S_AWVALID),
        .S_AWREADY(S_AWREADY),
        .S_WVALID(S_WVALID),
        .S_WREADY(S_WREADY),
        .S_WDATA(S_WDATA),
        .S_WSTRB(S_WSTRB),
        .S_BVALID(S_BVALID),
        .S_BREADY(S_BREADY),
        .S_BRESP(S_BRESP),
        .S_ARVALID(S_ARVALID),
        .S_ARREADY(S_ARREADY),
        .S_RVALID(S_RVALID),
        .S_RREADY(S_RREADY),
        .S_RDATA(S_RDATA)
    );

    // Address and Protection signal routing
    genvar i;
    generate
        for (i = 0; i < NUM_SLAVES; i = i + 1) begin : slave_routing
            assign S_AWADDR[i] = (slave_select_write[i]) ? mem_axi_awaddr : 0;
            assign S_ARADDR[i] = (slave_select_read[i])  ? mem_axi_araddr : 0;
            assign S_AWPROT[i] = (slave_select_write[i]) ? mem_axi_awprot : 0;
            assign S_ARPROT[i] = (slave_select_read[i])  ? mem_axi_arprot : 0;
        end
    endgenerate

endmodule

/***************************************************************
 * AXI4-Lite Decoder
 ***************************************************************/
module axi_lite_decoder #(
    parameter NUM_SLAVES = 2,
    parameter ADDR_WIDTH = 32
)(
    input [ADDR_WIDTH-1:0] AWADDR,
    input [ADDR_WIDTH-1:0] ARADDR,
    input                  AWVALID,
    input                  ARVALID,
    output reg [NUM_SLAVES-1:0] slave_select_write,
    output reg [NUM_SLAVES-1:0] slave_select_read
);

    // Address map (example): 
    // S0: 0x0000_0000 - 0x0000_FFFF
    // S1: 0x0001_0000 - 0x0001_FFFF
    wire [15:0] write_addr_upper = AWADDR[31:16];
    wire [15:0] read_addr_upper  = ARADDR[31:16];

    always @(*) begin
        slave_select_write = 0;
        slave_select_read  = 0;
        if (AWVALID) begin
            case (write_addr_upper)
                16'h0000: slave_select_write = 2'b01;  // Slave 0
                16'h0001: slave_select_write = 2'b10;  // Slave 1
                default:  slave_select_write = 2'b00;  // No slave selected
            endcase
        end
        if (ARVALID) begin
            case (read_addr_upper)
                16'h0000: slave_select_read = 2'b01;  // Slave 0
                16'h0001: slave_select_read = 2'b10;  // Slave 1
                default:  slave_select_read = 2'b00;  // No slave selected
            endcase
        end
    end

endmodule

/***************************************************************
 * AXI4-Lite Multiplexer
 ***************************************************************/
module axi_lite_mux #(
    parameter NUM_SLAVES = 2,
    parameter DATA_WIDTH = 32
)(
    // Master Interface (from picorv32_axi)
    input                     M_AWVALID,
    output                    M_AWREADY,
    input                     M_WVALID,
    output                    M_WREADY,
    input  [DATA_WIDTH-1:0]   M_WDATA,
    input  [DATA_WIDTH/8-1:0] M_WSTRB,
    output                    M_BVALID,
    input                     M_BREADY,
    output [1:0]              M_BRESP,
    input                     M_ARVALID,
    output                    M_ARREADY,
    output                    M_RVALID,
    input                     M_RREADY,
    output [DATA_WIDTH-1:0]   M_RDATA,
    // Slave Interfaces
    input  [NUM_SLAVES-1:0] slave_select_write,
    input  [NUM_SLAVES-1:0] slave_select_read,
    output [NUM_SLAVES-1:0] S_AWVALID,
    input  [NUM_SLAVES-1:0] S_AWREADY,
    output [NUM_SLAVES-1:0] S_WVALID,
    input  [NUM_SLAVES-1:0] S_WREADY,
    output [NUM_SLAVES-1:0][DATA_WIDTH-1:0]   S_WDATA,
    output [NUM_SLAVES-1:0][DATA_WIDTH/8-1:0] S_WSTRB,
    input  [NUM_SLAVES-1:0][1:0]              S_BRESP,
    input  [NUM_SLAVES-1:0]                   S_BVALID,
    output [NUM_SLAVES-1:0]                   S_BREADY,
    output [NUM_SLAVES-1:0]                   S_ARVALID,
    input  [NUM_SLAVES-1:0]                   S_ARREADY,
    input  [NUM_SLAVES-1:0][DATA_WIDTH-1:0]   S_RDATA,
    input  [NUM_SLAVES-1:0]                   S_RVALID,
    output [NUM_SLAVES-1:0]                   S_RREADY
);

    // Write Address Channel
    assign S_AWVALID = slave_select_write & {NUM_SLAVES{M_AWVALID}};
    assign M_AWREADY = |S_AWREADY & |slave_select_write;

    // Write Data Channel
    assign S_WVALID = slave_select_write & {NUM_SLAVES{M_WVALID}};
    assign S_WDATA[0] = (slave_select_write[0]) ? M_WDATA : 0;
    assign S_WDATA[1] = (slave_select_write[1]) ? M_WDATA : 0;
    assign S_WSTRB[0] = (slave_select_write[0]) ? M_WSTRB : 0;
    assign S_WSTRB[1] = (slave_select_write[1]) ? M_WSTRB : 0;
    assign M_WREADY = |S_WREADY & |slave_select_write;

    // Write Response Channel
    assign M_BVALID = |S_BVALID & |slave_select_write;
    assign M_BRESP = (slave_select_write[0]) ? S_BRESP[0] :
                     (slave_select_write[1]) ? S_BRESP[1] : 2'b00;
    assign S_BREADY = slave_select_write & {NUM_SLAVES{M_BREADY}};

    // Read Address Channel
    assign S_ARVALID = slave_select_read & {NUM_SLAVES{M_ARVALID}};
    assign M_ARREADY = |S_ARREADY & |slave_select_read;

    // Read Data Channel
    assign M_RDATA = (slave_select_read[0]) ? S_RDATA[0] :
                     (slave_select_read[1]) ? S_RDATA[1] : 0;
    assign M_RVALID = |S_RVALID & |slave_select_read;
    assign S_RREADY = slave_select_read & {NUM_SLAVES{M_RREADY}};

endmodule