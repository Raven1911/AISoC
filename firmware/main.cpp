#define DMEM_BASE 0x2000

int main() {
    int a = 15;
    int b = 25;
    int value = a + b;  // 15 + 25 = 40

    volatile unsigned int* dmem = (volatile unsigned int*)DMEM_BASE;
    *dmem = value;  // Lưu 40 vào 0x2000

    while (1) {}
    return 0;
}