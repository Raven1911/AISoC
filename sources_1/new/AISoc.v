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
    output trap

    );

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
	parameter [ 0:0] ENABLE_DIV = 0;
	parameter [ 0:0] ENABLE_IRQ = 0;
	parameter [ 0:0] ENABLE_IRQ_QREGS = 1;
	parameter [ 0:0] ENABLE_IRQ_TIMER = 1;
	parameter [ 0:0] ENABLE_TRACE = 0;
	parameter [ 0:0] REGS_INIT_ZERO = 1;
	parameter [31:0] MASKED_IRQ = 32'h 0000_0000;
	parameter [31:0] LATCHED_IRQ = 32'h ffff_ffff;
	parameter [31:0] PROGADDR_RESET = 32'h 0000_0000;
	parameter [31:0] PROGADDR_IRQ = 32'h 0000_0010;
	parameter [31:0] STACKADDR = 32'h 0000_0400;

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

    // // AXI signals to imem_axi_lite
    // wire        imem_arvalid, imem_arready;
    // wire [31:0] imem_araddr;
    // wire [ 2:0] imem_arprot;
    // wire        imem_rvalid, imem_rready;
    // wire [31:0] imem_rdata;
    

    // // AXI signals to dmem_axi_lite
    // wire        dmem_awvalid, dmem_awready;
    // wire [31:0] dmem_awaddr;
    // wire [ 2:0] dmem_awprot;
    // wire        dmem_wvalid, dmem_wready;
    // wire [31:0] dmem_wdata;
    // wire [ 3:0] dmem_wstrb;
    // wire        dmem_bvalid, dmem_bready;
    // wire        dmem_arvalid, dmem_arready;
    // wire [31:0] dmem_araddr;
    // wire [ 2:0] dmem_arprot;
    // wire        dmem_rvalid, dmem_rready;
    // wire [31:0] dmem_rdata;

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


    // // Instantiate imem_axi_lite
    // imem_axi_lite #(
    //     .MEM_SIZE(16384) // 16KB
    // ) imem_cpu (
    //     .clk(clk),
    //     .resetn(resetn),
    //     .i_axi_arvalid(cpu_arvalid),
    //     .o_axi_arready(cpu_arready),  
    //     .i_axi_araddr(cpu_araddr),
    //     .o_axi_rvalid(cpu_rvalid),   
    //     .i_axi_rready(cpu_rready),
    //     .o_axi_rdata(cpu_rdata)    
    // );

    // Instantiate dmem_axi_lite
    dmem_axi_lite #(
        .MEM_SIZE(1024) // 4KB
    ) dmem_cpu (
        .clk(clk),
        .resetn(resetn),
        .i_axi_awvalid(cpu_awvalid),
        .o_axi_awready(cpu_awready),
        .i_axi_awaddr(cpu_awaddr),
        .i_axi_wvalid(cpu_wvalid),
        .o_axi_wready(cpu_wready),
        .i_axi_wdata(cpu_wdata),
        .i_axi_wstrb(cpu_wstrb),
        .o_axi_bvalid(cpu_bvalid),
        .i_axi_bready(cpu_bready),
        .i_axi_arvalid(cpu_arvalid),
        .o_axi_arready(cpu_arready),
        .i_axi_araddr(cpu_araddr),
        .o_axi_rvalid(cpu_rvalid),
        .i_axi_rready(cpu_rready),
        .o_axi_rdata(cpu_rdata)
    );

endmodule
