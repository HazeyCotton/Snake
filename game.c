#include "myLib.h"
#include "game.h"
#include "NukaColaCap.h"
#include "RadRoach.h"

//Variables brought over from game.h
PLAYER vaultDwellers[MAXPLAYERLENGTH];
RADROACHX radRoaches[MAXRADROACHES];
NUKACOLACAP nukaCola[MAXPLAYERLENGTH];
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

    DMANow(3, NukaColaCapPal, PALETTE, 256);

    unsigned short colors[NUMCOLORS] = {BLACK, PORTAGE, PERSIAN, VIORED, WHITE, GRAY, TURQUOISE};
    for (int i = 0; i < NUMCOLORS; i++) {
        PALETTE[256-NUMCOLORS+i] = colors[i];
    }
}

void drawGame() {
    fillScreen4(BLACKID);

    for (int i = 0; i < 4; i++) {
        drawBoundaries(&boundaries[i]);
    }

    for (int i = 0; i < MAXPLAYERLENGTH; i++) {
        drawPlayer(&vaultDwellers[i]);
    }

    for (int i = 0; i < MAXPLAYERLENGTH; i++) {
        drawNukaColaCap(&nukaCola[i]);
    }

    for (int i = 0; i < MAXRADROACHES; i++) {
        drawRadRoachX(&radRoaches[i]);
    }
}

void updateGame() {
    for (int i = 0; i < MAXPLAYERLENGTH; i++) {
        updatePlayer(&vaultDwellers[i], i);
    }

    for (int i = 0; i < 4; i++) {
        updateBoundaries(&boundaries[i]);
    }

    for (int i = 0; i < MAXPLAYERLENGTH; i++) {
        updateNukaColaCap(&nukaCola[i], i);
    }

    for (int i = 0; i < MAXRADROACHES; i++) {
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
    for (int i = 0; i < MAXPLAYERLENGTH; i++) {
        if (i == 0) {
            vaultDwellers[0].row = SCREENHEIGHT / 2;
            vaultDwellers[0].col = SCREENWIDTH / 2;
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

        if (BUTTON_HELD(BUTTON_UP)) {
            p->row += -1;
        } else if (BUTTON_HELD(BUTTON_DOWN)) {
            p->row += 1;
        } else if (BUTTON_HELD(BUTTON_LEFT)) {
            p->col += -1;
        } else if (BUTTON_HELD(BUTTON_RIGHT)) {
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
    for (int i = 0; i < MAXPLAYERLENGTH; i++) {
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
        if (index != MAXPLAYERLENGTH - 1) {
            nukaCola[index + 1].active = 1;
        } else {
            nukaCola[0].active = 1;
        }
        vaultLength += 1;
    } else {
        noNukaColaCapActives = 0;

        for (int i = 0; i < MAXPLAYERLENGTH; i++) {
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
    for (int i = 0; i < MAXRADROACHES; i++) {
        radRoaches[i].row = rand() % 120 + 20;
        radRoaches[i].col = 20;
        radRoaches[i].height = 16;
        radRoaches[i].width = 32;
        radRoaches[i].active = 0;
    }
}

void updateRadRoachX(RADROACHX* r) {
    if (r->active) {
        for (int j = 0; j < MAXPLAYERLENGTH; j++) {
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