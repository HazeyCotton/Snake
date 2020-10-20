#include "myLib.h"
#include "font.h"

//Video Buffer Intialization
unsigned short *videoBuffer = (unsigned short *)0x6000000;

//DMA Initialization
DMA *dma = (DMA *)0x40000B0;

//Mode 4 Set Pixel Function. 
//Looks for if the pixel is odd or even and correct adjusts for cases
void setPixel4(int col, int row, unsigned char colorIndex) {
    int pixelCorrection = (col + row * 240) >> 1;
    unsigned short pixelPlacement = videoBuffer[pixelCorrection];
    if (col & 1) {
        videoBuffer[pixelCorrection] = colorIndex << 8 | (pixelPlacement & 0x00FF);
    } else {
        videoBuffer[pixelCorrection] = colorIndex | (pixelPlacement & 0xFF00);
    }
}

//Mode 4 Draw Rectangle Function.
//Looks for 5 test cases to account for Mode 4 pixels
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
            DMANow(3, &color, &videoBuffer[OFFSET(col + 1, row + i, SCREENWIDTH) / 2], 2 << 23 | (width) / 2);
        }
    } else if (colEvenOrOddCheck == 1 && widthEvenOrOddCheck == 0) {
        for (int i = 0; i < height; i++) {
            setPixel4(col, row + i, colorIndex);
            setPixel4(col + width - 1, row + i, colorIndex);
            DMANow(3, &color, &videoBuffer[OFFSET(col + 1, row + i, SCREENWIDTH) / 2], 2 << 23 | (width - 1) / 2);
        }
    } else if (colEvenOrOddCheck == 0 && widthEvenOrOddCheck == 0) {
        for (int i = 0; i < height; i++) {
            DMANow(3, &color, &videoBuffer[OFFSET(col, row + i, SCREENWIDTH) / 2], 2 << 23 | (width) / 2);
        }
    } else if (colEvenOrOddCheck == 0 && widthEvenOrOddCheck == 1) {
        for (int i = 0; i < height; i++) {
            setPixel4(col + width - 1, row +i, colorIndex);
            DMANow(3, &color, &videoBuffer[OFFSET(col, row + i, SCREENWIDTH) / 2], 2 << 23 | (width - 1) / 2);
        }
    }
}

//FillScreen in Mode 4 using DMA
void fillScreen4(volatile unsigned char colorIndex) {
    volatile unsigned int color = colorIndex << 24 | colorIndex << 16 | colorIndex << 8 | colorIndex;
    DMANow(3, &color, videoBuffer, 1 << 24 | 1 << 26 | (38400 / 4));
}

//Draw Image in Mode 4 using DMA
void drawImage4(int col, int row, int width, int height, const unsigned short *image) {
    for (int i = 0; i < height; i++) {
        DMANow(3, &image[OFFSET(0, i, width / 2)], &videoBuffer[OFFSET(col, row + i, SCREENWIDTH) / 2], width / 2);
    }
}

//Draw Full Screen Image in Mode 4
void drawFullScreenImage4(const unsigned short *image) {
    DMANow(3, image, videoBuffer, (SCREENWIDTH * SCREENHEIGHT) / 2);
}

//Character drawing in Mode 4 using the font.c and font.h files
void drawChar4(int col, int row, char ch, unsigned char colorIndex) {

    for (int r = 0; r < 8; r++) {
        for (int c = 0; c < 6; c++) {
            if (fontdata_6x8[48*ch + OFFSET(c, r, 6)]) {
                setPixel4(col+c, row+r, colorIndex);
            }
        }
    }
}

//String drawing in Mode 4 via drawChar4
void drawString4(int col, int row, char *str, unsigned char colorIndex) {

    while(*str != '\0') {
        drawChar4(col, row, *str, colorIndex);
        col += 6;
        str++;
    }
}

//Misc functions to take care of screen tearing/flickering, DMA calls, and collision
void waitForVBlank() {
	while(SCANLINECOUNTER > 160);
	while(SCANLINECOUNTER < 160);
}

void flipPage() {
    if (REG_DISPCTL & DISP_BACKBUFFER) {
        videoBuffer = BACKBUFFER;
    } else {
        videoBuffer = FRONTBUFFER;
    }
    REG_DISPCTL ^= DISP_BACKBUFFER;
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