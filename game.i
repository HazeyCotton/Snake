# 1 "game.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "game.c"
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
# 2 "game.c" 2
# 1 "game.h" 1



enum {BLACKID=(256-7), PORTAGEID, PERSIANID, VIOREDID, WHITEID, GRAYID, TURQUOISEID};
extern unsigned short colors[7];


void initGame();
void updateGame();
void drawGame();
void initPlayer();
void updatePlayer();
void drawPlayer();
void initNukaColaCap();
void updateNukaColaCap();
void drawNukaColaCap();
void initRadRoachX();
void updateRadRoachX();
void drawRadRoachX();
void initBoundary();
void updateBoundaries();
void drawBoundaries();


typedef struct {
    int row;
    int col;
    int oldRow;
    int oldCol;
    int xVel;
    int yVel;
    int side;
    int lead;
    unsigned char color;
    int active;
} PLAYER;

typedef struct {
    int row;
    int col;
    int height;
    int width;
    int active;
} NUKACOLACAP;

typedef struct {
    int row;
    int col;
    int height;
    int width;
    int active;
} RADROACHX;

typedef struct {
    int row;
    int col;
    int height;
    int width;
    int active;
} RADROACHY;

typedef struct {
    int row;
    int col;
    int height;
    int width;
} BOUNDARY;




extern PLAYER vaultDwellers[10];
extern RADROACHX radRoaches[4];
extern RADROACHY radRoaches2[4];
extern NUKACOLACAP nukaCola[10];
extern BOUNDARY boundaries[4];
extern int colaCapsRemaining;
extern int vaultLength;
extern int collide;
extern int noNukaColaCapActives;
# 3 "game.c" 2
# 1 "NukaColaCap.h" 1
# 21 "NukaColaCap.h"
extern const unsigned short NukaColaCapBitmap[128];


extern const unsigned short NukaColaCapPal[256];
# 4 "game.c" 2
# 1 "RadRoach.h" 1
# 21 "RadRoach.h"
extern const unsigned short RadRoachBitmap[256];


extern const unsigned short RadRoachPal[256];
# 5 "game.c" 2


PLAYER vaultDwellers[10];
RADROACHX radRoaches[4];
NUKACOLACAP nukaCola[10];
BOUNDARY boundaries[4];
int vaultLength;
int colaCapsRemaining;
int collide;
int noNukaColaCapActives;

void initGame() {

    initPlayer();
    initBoundary();
    initRadRoachX();
    initNukaColaCap();

    vaultLength = 0;
    collide = 0;
    colaCapsRemaining = 10;

    DMANow(3, NukaColaCapPal, ((unsigned short *)0x5000000), 256);

    unsigned short colors[7] = {0, ((18) | (19)<<5 | (27)<<10), ((0) | (21)<<5 | (20)<<10), ((28) | (8)<<5 | (16)<<10), ((31) | (31)<<5 | (31)<<10), ((15) | (15)<<5 | (15)<<10), ((5) | (26)<<5 | (25)<<10)};
    for (int i = 0; i < 7; i++) {
        ((unsigned short *)0x5000000)[256-7 +i] = colors[i];
    }
}

void drawGame() {
    fillScreen4(BLACKID);

    for (int i = 0; i < 4; i++) {
        drawBoundaries(&boundaries[i]);
    }

    for (int i = 0; i < 10; i++) {
        drawPlayer(&vaultDwellers[i]);
    }

    for (int i = 0; i < 10; i++) {
        drawNukaColaCap(&nukaCola[i]);
    }

    for (int i = 0; i < 4; i++) {
        drawRadRoachX(&radRoaches[i]);
    }
}

void updateGame() {
    for (int i = 0; i < 10; i++) {
        updatePlayer(&vaultDwellers[i], i);
    }

    for (int i = 0; i < 4; i++) {
        updateBoundaries(&boundaries[i]);
    }

    for (int i = 0; i < 10; i++) {
        updateNukaColaCap(&nukaCola[i], i);
    }

    for (int i = 0; i < 4; i++) {
        updateRadRoachX(&radRoaches[i]);
    }
}

void initBoundary() {
    boundaries[0].row = 19;
    boundaries[0].col = 19;
    boundaries[0].height = 120;
    boundaries[0].width = 2;
    boundaries[1].row = 139;
    boundaries[1].col = 19;
    boundaries[1].height = 2;
    boundaries[1].width = 200;
    boundaries[2].row = 19;
    boundaries[2].col = 219;
    boundaries[2].height = 120;
    boundaries[2].width = 2;
    boundaries[3].row = 19;
    boundaries[3].col = 19;
    boundaries[3].height = 2;
    boundaries[3].width = 200;
}

void drawBoundaries(BOUNDARY* b) {
    drawRect4(b->col, b->row, b->width, b->height, VIOREDID);
}

void updateBoundaries(BOUNDARY* b) {
    if (collision(vaultDwellers[0].col, vaultDwellers[0].row, vaultDwellers[0].side, vaultDwellers[0].side, b->col, b->row, b->width, b->height)) {
        collide = 1;
    }
}

void initPlayer() {
    for (int i = 0; i < 10; i++) {
        if (i == 0) {
            vaultDwellers[0].row = 160 / 2;
            vaultDwellers[0].col = 240 / 2;
            vaultDwellers[0].oldCol = vaultDwellers[0].row;
            vaultDwellers[0].oldRow = vaultDwellers[0].col;
            vaultDwellers[0].xVel = 0;
            vaultDwellers[0].yVel = 0;
            vaultDwellers[0].side = 5;
            vaultDwellers[0].color = TURQUOISEID;
            vaultDwellers[0].active = 1;
            vaultDwellers[0].lead = 1;
        } else {
            vaultDwellers[i].row = vaultDwellers[i - 1].oldRow;
            vaultDwellers[i].col = vaultDwellers[i - 1].oldCol;
            vaultDwellers[i].oldCol = vaultDwellers[i].col;
            vaultDwellers[i].oldRow = vaultDwellers[i].row;
            vaultDwellers[i].xVel = 0;
            vaultDwellers[i].yVel = 0;
            vaultDwellers[i].side = 5;
            vaultDwellers[i].color = TURQUOISEID;
            vaultDwellers[i].active = 0;
            vaultDwellers[i].lead = 0;
        }
    }
}

void updatePlayer(PLAYER* p, int index) {
    if (p->lead) {
        p->oldRow = p->row;
        p->oldCol = p->col;

        if ((~((*(volatile unsigned short *)0x04000130)) & ((1<<6)))) {
            p->row += -1;
        } else if ((~((*(volatile unsigned short *)0x04000130)) & ((1<<7)))) {
            p->row += 1;
        } else if ((~((*(volatile unsigned short *)0x04000130)) & ((1<<5)))) {
            p->col += -1;
        } else if ((~((*(volatile unsigned short *)0x04000130)) & ((1<<4)))) {
            p->col += 1;
        }
    } else if (p->active) {
        p->oldRow = p->row;
        p->oldCol = p->col;
        p->row = vaultDwellers[index - 1].oldRow;
        p->col = vaultDwellers[index - 1].oldCol;
    }

    if (!vaultDwellers[vaultLength].active) {
        vaultDwellers[vaultLength].active = 1;
    }
}

void drawPlayer(PLAYER* p) {
    if (p->active) {
        drawRect4(p->col, p->row, p->side, p->side, p->color);
    }
}

void initNukaColaCap() {
    for (int i = 0; i < 10; i++) {
        nukaCola[i].row = rand() % 120 + 20;
        nukaCola[i].col = rand() % 200 + 20;
        nukaCola[i].height = 16;
        nukaCola[i].width = 16;
        if (i == 0) {
            nukaCola[i].active = 1;
        } else {
            nukaCola[i].active = 0;
        }
    }
}

void updateNukaColaCap(NUKACOLACAP* n, int index) {
    if (n->active && collision(vaultDwellers[0].col, vaultDwellers[0].row, vaultDwellers[0].side, vaultDwellers[0].side, n->col, n->row, n->width, n->height)) {
        n->active = 0;
        if (index != 10 - 1) {
            nukaCola[index + 1].active = 1;
        } else {
            nukaCola[0].active = 1;
        }
        vaultLength += 1;
    } else {
        noNukaColaCapActives = 0;

        for (int i = 0; i < 10; i++) {
            if (nukaCola[i].active) {
                noNukaColaCapActives = 1;
            }
        }

        if (!noNukaColaCapActives) {
            int nukaColaCapSelect = rand() % 10;
            nukaCola[nukaColaCapSelect].active = 1;
        }
    }
}

void drawNukaColaCap(NUKACOLACAP* n) {
    if (n->active) {
        drawImage4(n->col, n->row, n->width, n->height, NukaColaCapBitmap);
    }
}

void initRadRoachX() {
    for (int i = 0; i < 4; i++) {
        radRoaches[i].row = rand() % 120 + 20;
        radRoaches[i].col = 20;
        radRoaches[i].height = 16;
        radRoaches[i].width = 32;
        radRoaches[i].active = 0;
    }
}

void updateRadRoachX(RADROACHX* r) {
    if (r->active) {
        for (int j = 0; j < 10; j++) {
            if (nukaCola[j].active && collision(r->col, r->row, r->width, r->height, nukaCola[j].col, nukaCola[j].row, nukaCola[j].width, nukaCola[j].height)) {
                nukaCola[j].active = 0;
            }
        }

        if (collision(r->col, r->row, r->width, r->height, vaultDwellers[0].col, vaultDwellers[0].row, vaultDwellers[0].side, vaultDwellers[0].side)) {
            vaultDwellers[vaultLength].active = 0;
            vaultLength -= 1;
        }


        for (int j = 0; j < 4; j++) {
            if (collision(r->col, r->row, r->width, r->height, boundaries[j].col, boundaries[j].row, boundaries[j].width, boundaries[j].height)) {
                r->active = 0;
            }
        }

        r->col += 1;
    } else {
        r->col = 20;
        r->row = rand() % 120 + 20;
        r->active = 1;
    }
}

void drawRadRoachX(RADROACHX* r) {
    if (r->active) {
        drawImage4(r->col, r->row, r->width, r->height, RadRoachBitmap);
    }
}
