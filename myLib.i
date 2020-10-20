# 1 "myLib.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "myLib.c"
# 1 "myLib.h" 1
# 17 "myLib.h"
extern unsigned short *videoBuffer;
# 45 "myLib.h"
void setPixel4(int col, int row, unsigned char colorIndex);
void drawRect4(int col, int row, int width, int height, volatile unsigned char colorIndex);
void fillScreen4(volatile unsigned char colorIndex);
void drawImage4(int col, int row, int width, int height, const unsigned short *image);
void drawFullScreenImage4(const unsigned short *image);

void drawChar4(int col, int row, char ch, unsigned char colorIndex);
void drawString4(int col, int row, char *str, unsigned char colorIndex);


void waitForVBlank();
void flipPage();
# 72 "myLib.h"
extern unsigned short oldButtons;
extern unsigned short buttons;





typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    unsigned int cnt;
} DMA;

extern DMA *dma;

void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);


int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB);
# 2 "myLib.c" 2
# 1 "font.h" 1

extern const unsigned char fontdata_6x8[12288];
# 3 "myLib.c" 2


unsigned short *videoBuffer = (unsigned short *)0x6000000;


DMA *dma = (DMA *)0x40000B0;



void setPixel4(int col, int row, unsigned char colorIndex) {
    int pixelCorrection = (col + row * 240) >> 1;
    unsigned short pixelPlacement = videoBuffer[pixelCorrection];
    if (col & 1) {
        videoBuffer[pixelCorrection] = colorIndex << 8 | (pixelPlacement & 0x00FF);
    } else {
        videoBuffer[pixelCorrection] = colorIndex | (pixelPlacement & 0xFF00);
    }
}



void drawRect4(int col, int row, int width, int height, volatile unsigned char colorIndex) {
    int colEvenOrOddCheck = col & 1;
    int widthEvenOrOddCheck = width & 1;
    volatile unsigned int color = colorIndex << 24 | colorIndex << 16 | colorIndex << 8 | colorIndex;
    if (width == 1 || width == 2) {
        for (int i = 0; i < height; i++) {
            setPixel4(col, row + i, colorIndex);
        }
    } else if (colEvenOrOddCheck == 1 && widthEvenOrOddCheck == 1) {
        for (int i = 0; i < height; i++) {
            setPixel4(col, row + i, colorIndex);
            DMANow(3, &color, &videoBuffer[((row + i)*(240)+(col + 1)) / 2], 2 << 23 | (width) / 2);
        }
    } else if (colEvenOrOddCheck == 1 && widthEvenOrOddCheck == 0) {
        for (int i = 0; i < height; i++) {
            setPixel4(col, row + i, colorIndex);
            setPixel4(col + width - 1, row + i, colorIndex);
            DMANow(3, &color, &videoBuffer[((row + i)*(240)+(col + 1)) / 2], 2 << 23 | (width - 1) / 2);
        }
    } else if (colEvenOrOddCheck == 0 && widthEvenOrOddCheck == 0) {
        for (int i = 0; i < height; i++) {
            DMANow(3, &color, &videoBuffer[((row + i)*(240)+(col)) / 2], 2 << 23 | (width) / 2);
        }
    } else if (colEvenOrOddCheck == 0 && widthEvenOrOddCheck == 1) {
        for (int i = 0; i < height; i++) {
            setPixel4(col + width - 1, row +i, colorIndex);
            DMANow(3, &color, &videoBuffer[((row + i)*(240)+(col)) / 2], 2 << 23 | (width - 1) / 2);
        }
    }
}


void fillScreen4(volatile unsigned char colorIndex) {
    volatile unsigned int color = colorIndex << 24 | colorIndex << 16 | colorIndex << 8 | colorIndex;
    DMANow(3, &color, videoBuffer, 1 << 24 | 1 << 26 | (38400 / 4));
}


void drawImage4(int col, int row, int width, int height, const unsigned short *image) {
    for (int i = 0; i < height; i++) {
        DMANow(3, &image[((i)*(width / 2)+(0))], &videoBuffer[((row + i)*(240)+(col)) / 2], width / 2);
    }
}


void drawFullScreenImage4(const unsigned short *image) {
    DMANow(3, image, videoBuffer, (240 * 160) / 2);
}


void drawChar4(int col, int row, char ch, unsigned char colorIndex) {

    for (int r = 0; r < 8; r++) {
        for (int c = 0; c < 6; c++) {
            if (fontdata_6x8[48*ch + ((r)*(6)+(c))]) {
                setPixel4(col+c, row+r, colorIndex);
            }
        }
    }
}


void drawString4(int col, int row, char *str, unsigned char colorIndex) {

    while(*str != '\0') {
        drawChar4(col, row, *str, colorIndex);
        col += 6;
        str++;
    }
}


void waitForVBlank() {
 while((*(volatile unsigned short *)0x4000006) > 160);
 while((*(volatile unsigned short *)0x4000006) < 160);
}

void flipPage() {
    if ((*(unsigned short *)0x4000000) & (1<<4)) {
        videoBuffer = ((unsigned short *)0x600A000);
    } else {
        videoBuffer = ((unsigned short *)0x6000000);
    }
    (*(unsigned short *)0x4000000) ^= (1<<4);
}

void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt) {
    dma[channel].cnt = 0;
    dma[channel].src = src;
    dma[channel].dst = dst;
    dma[channel].cnt = cnt | 1 << 31;
}

int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB) {

    return rowA < rowB + heightB - 1 && rowA + heightA - 1 > rowB
        && colA < colB + widthB - 1 && colA + widthA - 1 > colB;
}
