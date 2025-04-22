#include "spi_driver.hpp"

int main() {
    // Khởi tạo đối tượng SPI với địa chỉ cơ sở mặc định
    SpiDriver spi;

    // Cấu hình SPI: CPOL=0, CPHA=0, Fsys=100MHz, Fspi=1MHz(mo phong thi de 10Mhz)
    spi.init(0, 0, 100000000, 1000000);

    // Chọn slave 0
    spi.select_slave(0b10);

    // Gửi một byte
    spi.write(0x55); // ('U')

    // Gửi chuỗi
    spi.write_string("Hello");

    spi.write(0xFF);
    spi.select_slave(0b11);

    return 0;
}


    // // Đọc dữ liệu
    // int16_t data = spi.read();
    // if (data != -1) {
    //     // Xử lý dữ liệu
    // }

    // // Kiểm tra trạng thái sẵn sàng
    // if (spi.is_ready()) {
    //     // SPI sẵn sàng
    // }