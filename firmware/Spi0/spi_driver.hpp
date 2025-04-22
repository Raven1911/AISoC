#ifndef SPI_DRIVER_HPP
#define SPI_DRIVER_HPP

#include <cstdint>

// Địa chỉ cơ sở và thanh ghi của SPI
#define SPI_BASE_ADDR    0x02003000
#define SPI_READ_REG     (SPI_BASE_ADDR + 0x00000000)  // READ: Thanh ghi đọc dữ liệu và trạng thái
#define SPI_SS_REG       (SPI_BASE_ADDR + 0x00000001)  // WRITE: Thanh ghi chọn slave
#define SPI_DATA_REG     (SPI_BASE_ADDR + 0x00000002)  // WRITE: Thanh ghi ghi dữ liệu SPI
#define SPI_CTRL_REG     (SPI_BASE_ADDR + 0x00000003)  // WRITE: Thanh ghi điều khiển

// Định nghĩa bit trạng thái
#define SPI_READY        (1 << 8)  // Bit 8: SPI Ready
#define SPI_DATA_MASK    0xFF      // Bit [7:0]: Dữ liệu

class SpiDriver {
private:
    volatile uint32_t* base_addr; // Con trỏ đến địa chỉ cơ sở SPI

    // Ghi dữ liệu 32-bit vào thanh ghi
    void write_reg(uint32_t offset, uint32_t value);

    // Đọc dữ liệu 32-bit từ thanh ghi
    uint32_t read_reg(uint32_t offset);

public:
    // Constructor
    SpiDriver(uint32_t base = SPI_BASE_ADDR);

    // Cấu hình SPI với CPOL, CPHA, tần số hệ thống và tần số SPI
    void init(uint8_t cpol, uint8_t cpha, uint32_t clk_freq, uint32_t spi_freq);

    // Chọn slave bằng cách đặt giá trị cho SS (slave select)
    void select_slave(uint8_t slave_id);

    // Gửi một byte
    void write(uint8_t data);

    // Đọc một byte, trả về -1 nếu không có dữ liệu
    int16_t read();

    // Kiểm tra xem SPI có sẵn sàng không
    bool is_ready();

    // Gửi một chuỗi ký tự
    void write_string(const char* str);
};

#endif // SPI_DRIVER_HPP