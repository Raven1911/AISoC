OUTPUT_FORMAT("elf32-littleriscv") /* Đảm bảo file ELF là little-endian */

MEMORY {
    SRAM : ORIGIN = 0x00000000, LENGTH = 0x00FFFFFE /*  x * 1024 byte SRAM */
}

SECTIONS {
    .text : {
        *(.text.start)   /* Điểm bắt đầu */
        *(.text)         /* Mã lệnh */
        *(.text.*)
    } > SRAM

    .data : {
        *(.data)         /* Dữ liệu khởi tạo */
        *(.sdata)
    } > SRAM

    .bss : {
        *(.bss)          /* Dữ liệu không khởi tạo */
        *(.sbss)
    } > SRAM

    /DISCARD/ : {
        *(.comment)
        *(.eh_frame)
    }
}

ENTRY(main) /* Điểm bắt đầu là hàm main */