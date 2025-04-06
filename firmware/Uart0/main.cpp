#include <string>
#include "uart.hpp"

int main() {
    Uart uart; // Khởi tạo UART với địa chỉ mặc định

    // Cấu hình UART với tần số clock 125 MHz và baud rate 115200
    uart.init(125000000, 115200);

    //Gửi "AISoC xin chao" tới terminal Laptop
    uart.write('A'); uart.write('I'); uart.write('S'); uart.write('o'); uart.write('C'); uart.write(' ');
    uart.write('x'); uart.write('i'); uart.write('n'); uart.write(' ');
    uart.write('c'); uart.write('h'); uart.write('a'); uart.write('o'); uart.write('\n');

    //Nhận dữ liệu từ Laptop và gửi lại terminal của Laptop
    while (1) {
        int16_t data = uart.read();
        if (data != -1) {
            uart.write(data);  // Echo dữ liệu nhận được
        }
    }
    return 0;

}



