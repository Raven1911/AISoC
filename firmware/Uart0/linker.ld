OUTPUT_FORMAT("elf32-littleriscv")

MEMORY {
    SRAM : ORIGIN = 0x00000000, LENGTH = 0x00004000
    PERIPH : ORIGIN = 0x02000000, LENGTH = 0x00001000
}

SECTIONS {
    .text : {
        *(.text.start)
        *(.text)
        *(.text.*)
    } > SRAM

    .rodata : {
        *(.rodata)         /* Chuỗi hằng */
        *(.rodata.*)
    } > SRAM

    .data : {
        *(.data)
        *(.sdata)
    } > SRAM

    .bss : {
        *(.bss)
        *(.sbss)
    } > SRAM

    /DISCARD/ : {
        *(.comment)
        *(.eh_frame)
    }
}

ENTRY(main)