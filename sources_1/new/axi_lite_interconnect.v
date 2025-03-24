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
    input                     i_m_axi_awvalid,    // Master Write Address Valid
    output                    o_m_axi_awready,    // Master Write Address Ready
    input  [ADDR_WIDTH-1:0]   i_m_axi_awaddr,     // Master Write Address
    input  [2:0]              i_m_axi_awprot,     // Master Write Protection
    input                     i_m_axi_wvalid,     // Master Write Data Valid
    output                    o_m_axi_wready,     // Master Write Data Ready
    input  [DATA_WIDTH-1:0]   i_m_axi_wdata,      // Master Write Data
    input  [DATA_WIDTH/8-1:0] i_m_axi_wstrb,      // Master Write Strobe
    output                    o_m_axi_bvalid,     // Master Write Response Valid
    input                     i_m_axi_bready,     // Master Write Response Ready
    input                     i_m_axi_arvalid,    // Master Read Address Valid
    output                    o_m_axi_arready,    // Master Read Address Ready
    input  [ADDR_WIDTH-1:0]   i_m_axi_araddr,     // Master Read Address
    input  [2:0]              i_m_axi_arprot,     // Master Read Protection
    output                    o_m_axi_rvalid,     // Master Read Data Valid
    input                     i_m_axi_rready,     // Master Read Data Ready
    output [DATA_WIDTH-1:0]   o_m_axi_rdata,      // Master Read Data

    // AXI4-Lite Slave Interfaces
    output [NUM_SLAVES-1:0][ADDR_WIDTH-1:0]    o_s_axi_awaddr,   // Slave Write Address
    output [NUM_SLAVES-1:0]                    o_s_axi_awvalid,  // Slave Write Address Valid
    input  [NUM_SLAVES-1:0]                    i_s_axi_awready,  // Slave Write Address Ready
    output [NUM_SLAVES-1:0][2:0]               o_s_axi_awprot,   // Slave Write Protection
    output [NUM_SLAVES-1:0][DATA_WIDTH-1:0]    o_s_axi_wdata,    // Slave Write Data
    output [NUM_SLAVES-1:0][DATA_WIDTH/8-1:0]  o_s_axi_wstrb,    // Slave Write Strobe
    output [NUM_SLAVES-1:0]                    o_s_axi_wvalid,   // Slave Write Data Valid
    input  [NUM_SLAVES-1:0]                    i_s_axi_wready,   // Slave Write Data Ready
    input  [NUM_SLAVES-1:0][1:0]               i_s_axi_bresp,    // Slave Write Response
    input  [NUM_SLAVES-1:0]                    i_s_axi_bvalid,   // Slave Write Response Valid
    output [NUM_SLAVES-1:0]                    o_s_axi_bready,   // Slave Write Response Ready
    output [NUM_SLAVES-1:0][ADDR_WIDTH-1:0]    o_s_axi_araddr,   // Slave Read Address
    output [NUM_SLAVES-1:0]                    o_s_axi_arvalid,  // Slave Read Address Valid
    input  [NUM_SLAVES-1:0]                    i_s_axi_arready,  // Slave Read Address Ready
    output [NUM_SLAVES-1:0][2:0]               o_s_axi_arprot,   // Slave Read Protection
    input  [NUM_SLAVES-1:0][DATA_WIDTH-1:0]    i_s_axi_rdata,    // Slave Read Data
    input  [NUM_SLAVES-1:0]                    i_s_axi_rvalid,   // Slave Read Data Valid
    output [NUM_SLAVES-1:0]                    o_s_axi_rready    // Slave Read Data Ready
);

    // Internal signals for slave selection
    wire [NUM_SLAVES-1:0] slave_select_write;
    wire [NUM_SLAVES-1:0] slave_select_read;

    // Decoder: Select slave based on address
    axi_lite_decoder #(
        .NUM_SLAVES(NUM_SLAVES),
        .ADDR_WIDTH(ADDR_WIDTH)
    ) decoder (
        .i_axi_awaddr(i_m_axi_awaddr),
        .i_axi_araddr(i_m_axi_araddr),
        .i_axi_awvalid(i_m_axi_awvalid),
        .i_axi_arvalid(i_m_axi_arvalid),
        .o_slave_select_write(slave_select_write),
        .o_slave_select_read(slave_select_read)
    );

    // Multiplexer: Route data between master and selected slave
    axi_lite_mux #(
        .NUM_SLAVES(NUM_SLAVES),
        .DATA_WIDTH(DATA_WIDTH)
    ) mux (
        .i_m_axi_awvalid(i_m_axi_awvalid),
        .o_m_axi_awready(o_m_axi_awready),
        .i_m_axi_wvalid(i_m_axi_wvalid),
        .o_m_axi_wready(o_m_axi_wready),
        .i_m_axi_wdata(i_m_axi_wdata),
        .i_m_axi_wstrb(i_m_axi_wstrb),
        .o_m_axi_bvalid(o_m_axi_bvalid),
        .i_m_axi_bready(i_m_axi_bready),
        .o_m_axi_bresp(o_m_axi_bresp),
        .i_m_axi_arvalid(i_m_axi_arvalid),
        .o_m_axi_arready(o_m_axi_arready),
        .o_m_axi_rvalid(o_m_axi_rvalid),
        .i_m_axi_rready(i_m_axi_rready),
        .o_m_axi_rdata(o_m_axi_rdata),
        .i_slave_select_write(slave_select_write),
        .i_slave_select_read(slave_select_read),
        .o_s_axi_awvalid(o_s_axi_awvalid),
        .i_s_axi_awready(i_s_axi_awready),
        .o_s_axi_wvalid(o_s_axi_wvalid),
        .i_s_axi_wready(i_s_axi_wready),
        .o_s_axi_wdata(o_s_axi_wdata),
        .o_s_axi_wstrb(o_s_axi_wstrb),
        .i_s_axi_bvalid(i_s_axi_bvalid),
        .o_s_axi_bready(o_s_axi_bready),
        .i_s_axi_bresp(i_s_axi_bresp),
        .o_s_axi_arvalid(o_s_axi_arvalid),
        .i_s_axi_arready(i_s_axi_arready),
        .i_s_axi_rvalid(i_s_axi_rvalid),
        .o_s_axi_rready(o_s_axi_rready),
        .i_s_axi_rdata(i_s_axi_rdata)
    );

    // Address and Protection signal routing
    genvar i;
    generate
        for (i = 0; i < NUM_SLAVES; i = i + 1) begin : slave_routing
            assign o_s_axi_awaddr[i] = (slave_select_write[i]) ? i_m_axi_awaddr : 0;
            assign o_s_axi_araddr[i] = (slave_select_read[i])  ? i_m_axi_araddr : 0;
            assign o_s_axi_awprot[i] = (slave_select_write[i]) ? i_m_axi_awprot : 0;
            assign o_s_axi_arprot[i] = (slave_select_read[i])  ? i_m_axi_arprot : 0;
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
    input  [ADDR_WIDTH-1:0] i_axi_awaddr,      // Input Write Address
    input  [ADDR_WIDTH-1:0] i_axi_araddr,      // Input Read Address
    input                   i_axi_awvalid,     // Input Write Address Valid
    input                   i_axi_arvalid,     // Input Read Address Valid
    output reg [NUM_SLAVES-1:0] o_slave_select_write,  // Output Slave Select for Write
    output reg [NUM_SLAVES-1:0] o_slave_select_read    // Output Slave Select for Read
);

    // Address map (example): 
    // S0: 0x0000_0000 - 0x0000_FFFF
    // S1: 0x0001_0000 - 0x0001_FFFF
    wire [31:0] write_addr_upper = i_axi_awaddr[31:0];
    wire [31:0] read_addr_upper  = i_axi_araddr[31:0];

    always @(*) begin
        o_slave_select_write = 0;
        o_slave_select_read  = 0;
        if (i_axi_awvalid) begin
            case (write_addr_upper)
                16'h0000: o_slave_select_write = 'b01;  // Slave 0
                16'h0001: o_slave_select_write = 'b10;  // Slave 1
                default:  o_slave_select_write = 'b00;  // No slave selected
            endcase
        end
        if (i_axi_arvalid) begin
            case (read_addr_upper)
                16'h0000: o_slave_select_read = 2'b01;  // Slave 0
                16'h0001: o_slave_select_read = 2'b10;  // Slave 1
                default:  o_slave_select_read = 2'b00;  // No slave selected
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
    input                     i_m_axi_awvalid,    // Master Write Address Valid
    output                    o_m_axi_awready,    // Master Write Address Ready
    input                     i_m_axi_wvalid,     // Master Write Data Valid
    output                    o_m_axi_wready,     // Master Write Data Ready
    input  [DATA_WIDTH-1:0]   i_m_axi_wdata,      // Master Write Data
    input  [DATA_WIDTH/8-1:0] i_m_axi_wstrb,      // Master Write Strobe
    output                    o_m_axi_bvalid,     // Master Write Response Valid
    input                     i_m_axi_bready,     // Master Write Response Ready
    output [1:0]              o_m_axi_bresp,      // Master Write Response
    input                     i_m_axi_arvalid,    // Master Read Address Valid
    output                    o_m_axi_arready,    // Master Read Address Ready
    output                    o_m_axi_rvalid,     // Master Read Data Valid
    input                     i_m_axi_rready,     // Master Read Data Ready
    output [DATA_WIDTH-1:0]   o_m_axi_rdata,      // Master Read Data
    // Slave Interfaces
    input  [NUM_SLAVES-1:0] i_slave_select_write, // Slave Select for Write
    input  [NUM_SLAVES-1:0] i_slave_select_read,  // Slave Select for Read
    output [NUM_SLAVES-1:0] o_s_axi_awvalid,      // Slave Write Address Valid
    input  [NUM_SLAVES-1:0] i_s_axi_awready,      // Slave Write Address Ready
    output [NUM_SLAVES-1:0] o_s_axi_wvalid,       // Slave Write Data Valid
    input  [NUM_SLAVES-1:0] i_s_axi_wready,       // Slave Write Data Ready
    output [NUM_SLAVES-1:0][DATA_WIDTH-1:0]   o_s_axi_wdata,    // Slave Write Data
    output [NUM_SLAVES-1:0][DATA_WIDTH/8-1:0] o_s_axi_wstrb,    // Slave Write Strobe
    input  [NUM_SLAVES-1:0][1:0]              i_s_axi_bresp,    // Slave Write Response
    input  [NUM_SLAVES-1:0]                   i_s_axi_bvalid,   // Slave Write Response Valid
    output [NUM_SLAVES-1:0]                   o_s_axi_bready,   // Slave Write Response Ready
    output [NUM_SLAVES-1:0]                   o_s_axi_arvalid,  // Slave Read Address Valid
    input  [NUM_SLAVES-1:0]                   i_s_axi_arready,  // Slave Read Address Ready
    input  [NUM_SLAVES-1:0][DATA_WIDTH-1:0]   i_s_axi_rdata,    // Slave Read Data
    input  [NUM_SLAVES-1:0]                   i_s_axi_rvalid,   // Slave Read Data Valid
    output [NUM_SLAVES-1:0]                   o_s_axi_rready    // Slave Read Data Ready
);

    // Write Address Channel
    assign o_s_axi_awvalid = i_slave_select_write & {NUM_SLAVES{i_m_axi_awvalid}};
    assign o_m_axi_awready = |i_s_axi_awready & |i_slave_select_write;

    // Write Data Channel
    assign o_s_axi_wvalid = i_slave_select_write & {NUM_SLAVES{i_m_axi_wvalid}};
    assign o_s_axi_wdata[0] = (i_slave_select_write[0]) ? i_m_axi_wdata : 0;
    assign o_s_axi_wdata[1] = (i_slave_select_write[1]) ? i_m_axi_wdata : 0;
    assign o_s_axi_wstrb[0] = (i_slave_select_write[0]) ? i_m_axi_wstrb : 0;
    assign o_s_axi_wstrb[1] = (i_slave_select_write[1]) ? i_m_axi_wstrb : 0;
    assign o_m_axi_wready = |i_s_axi_wready & |i_slave_select_write;

    // Write Response Channel
    assign o_m_axi_bvalid = |i_s_axi_bvalid & |i_slave_select_write;
    assign o_m_axi_bresp = (i_slave_select_write[0]) ? i_s_axi_bresp[0] :
                          (i_slave_select_write[1]) ? i_s_axi_bresp[1] : 2'b00;
    assign o_s_axi_bready = i_slave_select_write & {NUM_SLAVES{i_m_axi_bready}};

    // Read Address Channel
    assign o_s_axi_arvalid = i_slave_select_read & {NUM_SLAVES{i_m_axi_arvalid}};
    assign o_m_axi_arready = |i_s_axi_arready & |i_slave_select_read;

    // Read Data Channel
    assign o_m_axi_rdata = (i_slave_select_read[0]) ? i_s_axi_rdata[0] :
                          (i_slave_select_read[1]) ? i_s_axi_rdata[1] : 0;
    assign o_m_axi_rvalid = |i_s_axi_rvalid & |i_slave_select_read;
    assign o_s_axi_rready = i_slave_select_read & {NUM_SLAVES{i_m_axi_rready}};

endmodule