#include "spi_driver.hpp"

SpiDriver::SpiDriver(uint32_t base) {
    base_addr = reinterpret_cast<volatile uint32_t*>(base);
}

void SpiDriver::write_reg(uint32_t offset, uint32_t value) {
    *(base_addr + (offset - SPI_BASE_ADDR)) = value;
}

uint32_t SpiDriver::read_reg(uint32_t offset) {
    return *(base_addr + (offset - SPI_BASE_ADDR));
}

void SpiDriver::init(uint8_t cpol, uint8_t cpha, uint32_t clk_freq, uint32_t spi_freq) {
    // Tính giá trị dvsr: dvsr = (clk_freq / (2 * spi_freq)) - 1
    uint32_t dvsr = (clk_freq / (2 * spi_freq)) - 1;
    // Tạo giá trị thanh ghi điều khiển: [17:CPHA, 16:CPOL, 15:0:DIVIDER]
    uint32_t ctrl_value = (static_cast<uint32_t>(cpha & 0x1) << 17) |
                          (static_cast<uint32_t>(cpol & 0x1) << 16) |
                          (dvsr & 0xFFFF);
    write_reg(SPI_CTRL_REG, ctrl_value);
}

void SpiDriver::select_slave(uint8_t slave_id) {
    // Ghi giá trị slave select vào thanh ghi SS
    write_reg(SPI_SS_REG, static_cast<uint32_t>(slave_id));
}

void SpiDriver::write(uint8_t data) {
    // Chờ nếu SPI chưa sẵn sàng
    while (!is_ready()) {}
    write_reg(SPI_DATA_REG, static_cast<uint32_t>(data));
}

int16_t SpiDriver::read() {
    uint32_t status = read_reg(SPI_READ_REG);
    if (!(status & SPI_READY)) {
        return -1;
    }
    return status & SPI_DATA_MASK;
}

bool SpiDriver::is_ready() {
    return (read_reg(SPI_READ_REG) & SPI_READY) != 0;
}

void SpiDriver::write_string(const char* str) {
    while (*str) {
        write(*str++);
    }
}