`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/04/2025 06:32:08 AM
// Design Name: 
// Module Name: AISoc
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


module AISoc(
    input clk,
    input resetn,
    output trap,

    //gpio uart0
    input  wire rx0,
    output wire tx0
    

    );
    //config axi interconnect
    parameter NUM_SLAVES = 3;

    //config cpu
    parameter [ 0:0] ENABLE_COUNTERS = 1;
	parameter [ 0:0] ENABLE_COUNTERS64 = 1;
	parameter [ 0:0] ENABLE_REGS_16_31 = 1;
	parameter [ 0:0] ENABLE_REGS_DUALPORT = 1;
	parameter [ 0:0] TWO_STAGE_SHIFT = 1;
	parameter [ 0:0] BARREL_SHIFTER = 0;
	parameter [ 0:0] TWO_CYCLE_COMPARE = 0;
	parameter [ 0:0] TWO_CYCLE_ALU = 0;
	parameter [ 0:0] COMPRESSED_ISA = 0;
	parameter [ 0:0] CATCH_MISALIGN = 1;
	parameter [ 0:0] CATCH_ILLINSN = 1;
	parameter [ 0:0] ENABLE_PCPI = 0;
	parameter [ 0:0] ENABLE_MUL = 1;
	parameter [ 0:0] ENABLE_FAST_MUL = 0;
	parameter [ 0:0] ENABLE_DIV = 1;
	parameter [ 0:0] ENABLE_IRQ = 0;
	parameter [ 0:0] ENABLE_IRQ_QREGS = 1;
	parameter [ 0:0] ENABLE_IRQ_TIMER = 1;
	parameter [ 0:0] ENABLE_TRACE = 0;
	parameter [ 0:0] REGS_INIT_ZERO = 1;
	parameter [31:0] MASKED_IRQ = 32'h 0000_0000;
	parameter [31:0] LATCHED_IRQ = 32'h ffff_ffff;
	parameter [31:0] PROGADDR_RESET = 32'h 0100_0000;
	parameter [31:0] PROGADDR_IRQ = 32'h 0000_0010;
	parameter [31:0] STACKADDR = 32'h 0000_4000;

    //config imem and dmem
    parameter I_MEM_SIZE = 16384; // 16KB ROM
    parameter D_MEM_SIZE = 16384; // 16KB SRAM
    parameter ADDR_WIDTH = 32;
    parameter DATA_WIDTH = 32;

    // AXI signals from picorv32_axi
    wire        cpu_awvalid, cpu_awready;
    wire [31:0] cpu_awaddr;
    wire [ 2:0] cpu_awprot;
    wire        cpu_wvalid, cpu_wready;
    wire [31:0] cpu_wdata;
    wire [ 3:0] cpu_wstrb;
    wire        cpu_bvalid, cpu_bready;
    wire        cpu_arvalid, cpu_arready;
    wire [31:0] cpu_araddr;
    wire [ 2:0] cpu_arprot;
    wire        cpu_rvalid, cpu_rready;
    wire [31:0] cpu_rdata;

    // address line 
    wire [31:0] s_mem_awaddr;
    wire [31:0] s_mem_araddr;

    // AXI signals to dmem_axi_lite//////////////////slave 0/////////////////////
    wire        dmem_awvalid, dmem_awready;
    //wire [31:0] dmem_awaddr;
    wire [ 2:0] dmem_awprot;
    wire        dmem_wvalid, dmem_wready;
    wire [31:0] dmem_wdata;
    wire [ 3:0] dmem_wstrb;
    wire        dmem_bvalid, dmem_bready;
    wire        dmem_arvalid, dmem_arready;
    //wire [31:0] dmem_araddr;
    wire [ 2:0] dmem_arprot;
    wire        dmem_rvalid, dmem_rready;
    wire [31:0] dmem_rdata;

    // // AXI signals to imem_axi_lite//////////////////slave 1/////////////////////
    wire        imem_awvalid, imem_awready;
    wire [ 2:0] imem_awprot;
    wire        imem_wvalid, imem_wready;
    wire [31:0] imem_wdata;
    wire [ 3:0] imem_wstrb;
    wire        imem_bvalid, imem_bready;
    wire        imem_arvalid, imem_arready;
    //wire [31:0] imem_araddr;
    wire [ 2:0] imem_arprot;
    wire        imem_rvalid, imem_rready;
    wire [31:0] imem_rdata;

    // AXI signals to uart0_axi_lite//////////////////slave 2/////////////////////
    wire        uart0_awvalid, uart0_awready;
    wire [ 2:0] uart0_awprot;
    wire        uart0_wvalid, uart0_wready;
    wire [31:0] uart0_wdata;
    wire [ 3:0] uart0_wstrb;
    wire        uart0_bvalid, uart0_bready;
    wire        uart0_arvalid, uart0_arready;
    //wire [31:0] uart0_araddr;
    wire [ 2:0] uart0_arprot;
    wire        uart0_rvalid, uart0_rready;
    wire [31:0] uart0_rdata;

    // Instantiate picorv32_axi
    picorv32_axi #(
        .ENABLE_COUNTERS     (ENABLE_COUNTERS     ),
		.ENABLE_COUNTERS64   (ENABLE_COUNTERS64   ),
		.ENABLE_REGS_16_31   (ENABLE_REGS_16_31   ),
		.ENABLE_REGS_DUALPORT(ENABLE_REGS_DUALPORT),
		.TWO_STAGE_SHIFT     (TWO_STAGE_SHIFT     ),
		.BARREL_SHIFTER      (BARREL_SHIFTER      ),
		.TWO_CYCLE_COMPARE   (TWO_CYCLE_COMPARE   ),
		.TWO_CYCLE_ALU       (TWO_CYCLE_ALU       ),
		.COMPRESSED_ISA      (COMPRESSED_ISA      ),
		.CATCH_MISALIGN      (CATCH_MISALIGN      ),
		.CATCH_ILLINSN       (CATCH_ILLINSN       ),
		.ENABLE_PCPI         (ENABLE_PCPI         ),
		.ENABLE_MUL          (ENABLE_MUL          ),
		.ENABLE_FAST_MUL     (ENABLE_FAST_MUL     ),
		.ENABLE_DIV          (ENABLE_DIV          ),
		.ENABLE_IRQ          (ENABLE_IRQ          ),
		.ENABLE_IRQ_QREGS    (ENABLE_IRQ_QREGS    ),
		.ENABLE_IRQ_TIMER    (ENABLE_IRQ_TIMER    ),
		.ENABLE_TRACE        (ENABLE_TRACE        ),
		.REGS_INIT_ZERO      (REGS_INIT_ZERO      ),
		.MASKED_IRQ          (MASKED_IRQ          ),
		.LATCHED_IRQ         (LATCHED_IRQ         ),
		.PROGADDR_RESET      (PROGADDR_RESET      ),
		.PROGADDR_IRQ        (PROGADDR_IRQ        ),
		.STACKADDR           (STACKADDR           )
    ) cpu (
        .clk(clk),
        .resetn(resetn),
        .trap(trap),
        .mem_axi_awvalid(cpu_awvalid),
        .mem_axi_awready(cpu_awready),
        .mem_axi_awaddr(cpu_awaddr),
        .mem_axi_awprot(cpu_awprot),
        .mem_axi_wvalid(cpu_wvalid),
        .mem_axi_wready(cpu_wready),
        .mem_axi_wdata(cpu_wdata),
        .mem_axi_wstrb(cpu_wstrb),
        .mem_axi_bvalid(cpu_bvalid),
        .mem_axi_bready(cpu_bready),
        .mem_axi_arvalid(cpu_arvalid),
        .mem_axi_arready(cpu_arready),
        .mem_axi_araddr(cpu_araddr),
        .mem_axi_arprot(cpu_arprot),
        .mem_axi_rvalid(cpu_rvalid),
        .mem_axi_rready(cpu_rready),
        .mem_axi_rdata(cpu_rdata),
        .irq(32'h0), // Chưa dùng IRQ
        .eoi()       // Chưa dùng IRQ
    );


    // Instantiate axi lite interconnect
    // Instantiate axi_lite_interconnect
    axi_lite_interconnect #(
        .NUM_SLAVES(NUM_SLAVES),
        .ADDR_WIDTH(ADDR_WIDTH),
        .DATA_WIDTH(DATA_WIDTH)
    ) interconnect (
        //.clk(clk),
        .resetn(resetn),
        
        // Master Interface (to CPU)
        .i_m_axi_awvalid(cpu_awvalid),
        .o_m_axi_awready(cpu_awready),
        .i_m_axi_awaddr(cpu_awaddr),
        .i_m_axi_awprot(cpu_awprot),
        .i_m_axi_wvalid(cpu_wvalid),
        .o_m_axi_wready(cpu_wready),
        .i_m_axi_wdata(cpu_wdata),
        .i_m_axi_wstrb(cpu_wstrb),
        .o_m_axi_bvalid(cpu_bvalid),
        .i_m_axi_bready(cpu_bready),
        .i_m_axi_arvalid(cpu_arvalid),
        .o_m_axi_arready(cpu_arready),
        .i_m_axi_araddr(cpu_araddr),
        .i_m_axi_arprot(cpu_arprot),
        .o_m_axi_rvalid(cpu_rvalid),
        .i_m_axi_rready(cpu_rready),
        .o_m_axi_rdata(cpu_rdata),

        // Slave Interfaces [2: uart0, 1: imem, 0: dmem]
        .o_s_axi_awaddr(s_mem_awaddr),
        .o_s_axi_awvalid({uart0_awvalid, imem_awvalid, dmem_awvalid}),
        .i_s_axi_awready({uart0_awready, imem_awready, dmem_awready}),
        .o_s_axi_awprot({uart0_awprot, imem_awprot, dmem_awprot}),
        .o_s_axi_wdata({uart0_wdata, imem_wdata, dmem_wdata}),
        .o_s_axi_wstrb({uart0_wstrb, imem_wstrb, dmem_wstrb}),
        .o_s_axi_wvalid({uart0_wvalid, imem_wvalid, dmem_wvalid}),
        .i_s_axi_wready({uart0_wready, imem_wready, dmem_wready}),
        .i_s_axi_bvalid({uart0_bvalid, imem_bvalid, dmem_bvalid}),
        .o_s_axi_bready({uart0_bready, imem_bready, dmem_bready}),
        .o_s_axi_araddr(s_mem_araddr),
        .o_s_axi_arvalid({uart0_arvalid, imem_arvalid, dmem_arvalid}),
        .i_s_axi_arready({uart0_arready, imem_arready, dmem_arready}),
        .o_s_axi_arprot({uart0_arprot, imem_arprot, dmem_arprot}),
        .i_s_axi_rdata({uart0_rdata, imem_rdata, dmem_rdata}),
        .i_s_axi_rvalid({uart0_rvalid, imem_rvalid, dmem_rvalid}),
        .o_s_axi_rready({uart0_rready, imem_rready, dmem_rready})
    );




    // Instantiate dmem_axi_lite (Slave 0)
    dmem_axi_lite #(
        .MEM_SIZE(D_MEM_SIZE), // 520 kB
        .ADDR_WIDTH(ADDR_WIDTH),
        .DATA_WIDTH(DATA_WIDTH)
    ) dmem_cpu (
        .clk(clk),
        .resetn(resetn),
        .i_axi_awvalid(dmem_awvalid),
        .o_axi_awready(dmem_awready),
        .i_axi_awaddr(s_mem_awaddr),
        .i_axi_wvalid(dmem_wvalid),
        .o_axi_wready(dmem_wready),
        .i_axi_wdata(dmem_wdata),
        .i_axi_wstrb(dmem_wstrb),
        .o_axi_bvalid(dmem_bvalid),
        .i_axi_bready(dmem_bready),
        .i_axi_arvalid(dmem_arvalid),
        .o_axi_arready(dmem_arready),
        .i_axi_araddr(s_mem_araddr),
        .o_axi_rvalid(dmem_rvalid),
        .i_axi_rready(dmem_rready),
        .o_axi_rdata(dmem_rdata)
    );

    // Instantiate imem_axi_lite (Slave 1, read-only)
    imem_axi_lite #(
        .MEM_SIZE(I_MEM_SIZE), // 448 kB
        .ADDR_WIDTH(ADDR_WIDTH),
        .DATA_WIDTH(DATA_WIDTH),
        .PROGADDR_RESET(PROGADDR_RESET)
    ) imem_cpu (
        .clk(clk),
        .resetn(resetn),
        // Read-only (imem không cần write channels)
        .i_axi_arvalid(imem_arvalid),
        .o_axi_arready(imem_arready),
        .i_axi_araddr(s_mem_araddr),
        .o_axi_rvalid(imem_rvalid),
        .i_axi_rready(imem_rready),
        .o_axi_rdata(imem_rdata)
    );


    // Instantiate uart0_axi_lite (Slave 2)
    uart_axi_lite #(
        .ADDR_WIDTH(ADDR_WIDTH),
        .DATA_WIDTH(DATA_WIDTH),
        .FIFO_DEPTH_BIT(8)
    ) uart0 (
        .clk(clk),
        .resetn(resetn),
        .i_axi_awvalid(uart0_awvalid),
        .o_axi_awready(uart0_awready),
        .i_axi_awaddr(s_mem_awaddr),
        .i_axi_wvalid(uart0_wvalid),
        .o_axi_wready(uart0_wready),
        .i_axi_wdata(uart0_wdata),
        .i_axi_wstrb(uart0_wstrb),
        .o_axi_bvalid(uart0_bvalid),
        .i_axi_bready(uart0_bready),
        .i_axi_arvalid(uart0_arvalid),
        .o_axi_arready(uart0_arready),
        .i_axi_araddr(s_mem_araddr),
        .o_axi_rvalid(uart0_rvalid),
        .i_axi_rready(uart0_rready),
        .o_axi_rdata(uart0_rdata),

        .tx(tx0),
        .rx(rx0)
    );

endmodule