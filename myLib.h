#ifndef MY_LIB_H 
#define MY_LIB_H

//Display Macros and Variables
#define OFFSET(c, r, rowlen) ((r)*(rowlen)+(c))

#define REG_DISPCTL (*(unsigned short *)0x4000000)
#define MODE4 4
#define DISP_BACKBUFFER (1<<4)
#define BG2_ENABLE (1<<10)

#define SCANLINECOUNTER (*(volatile unsigned short *)0x4000006)

#define SCREENHEIGHT 160
#define SCREENWIDTH 240

extern unsigned short *videoBuffer;
#define FRONTBUFFER ((unsigned short *)0x6000000)
#define BACKBUFFER ((unsigned short *)0x600A000)

#define PALETTE ((unsigned short *)0x5000000)

#define COLOR(r,g,b) ((r) | (g)<<5 | (b)<<10)

#define BLACK 0
#define WHITE COLOR(31,31,31)
#define GRAY COLOR(15,15,15)
#define RED COLOR(31,0,0)
#define GREEN COLOR(0,31,0)
#define BLUE COLOR(0,0,31)
#define CYAN COLOR(0,31,31)
#define MAGENTA COLOR(31,0,31)
#define YELLOW COLOR(31,31,0)
#define PORTAGE COLOR(18,19,27)
#define CADILLAC COLOR(19,9,13)
#define ROGUE COLOR(22,6,13)
#define VIORED COLOR(28,8,16)
#define HOTPINK COLOR(31,13,21)
#define LAVPINK COLOR(31,20,26)
#define TURQUOISE COLOR(5,26,25)
#define PERSIAN COLOR(0,21,20)
#define TEAL COLOR(0,16,16)

//Mode 4 drawing functions including text drawing
void setPixel4(int col, int row, unsigned char colorIndex);
void drawRect4(int col, int row, int width, int height, volatile unsigned char colorIndex);
void fillScreen4(volatile unsigned char colorIndex);
void drawImage4(int col, int row, int width, int height, const unsigned short *image);
void drawFullScreenImage4(const unsigned short *image);

void drawChar4(int col, int row, char ch, unsigned char colorIndex);
void drawString4(int col, int row, char *str, unsigned char colorIndex);

//Mode 4 antiflickering functions
void waitForVBlank();
void flipPage();

//Button macros and variables
#define BUTTONS (*(volatile unsigned short *)0x04000130)

#define BUTTON_A		(1<<0)
#define BUTTON_B		(1<<1)
#define BUTTON_SELECT	(1<<2)
#define BUTTON_START	(1<<3)
#define BUTTON_RIGHT	(1<<4)
#define BUTTON_LEFT		(1<<5)
#define BUTTON_UP		(1<<6)
#define BUTTON_DOWN		(1<<7)
#define BUTTON_R		(1<<8)
#define BUTTON_L		(1<<9)

extern unsigned short oldButtons;
extern unsigned short buttons;

#define BUTTON_HELD(key)  (~(BUTTONS) & (key))
#define BUTTON_PRESSED(key) (!(~(oldButtons)&(key)) && (~buttons & (key)))

//DMA for Mode 4 usuage
typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    unsigned int cnt;
} DMA;

extern DMA *dma;

void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);

//Misc function
int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB);


#endif