#include "myLib.h"
#include "game.h"
#include "FullImageVaultBoy.h"
#include <stdio.h>

//Main.C function prototypes
void initialize();

void goToStart();
void start();
void goToPause();
void pause();
void goToGame();
void game();
void goToLose();
void lose();
void goToWin();
void win();

//Game state intialization
enum {START, PAUSE, GAME, LOSE, WIN};
int state;

//Button initialization
unsigned short buttons;
unsigned short oldButtons;

//Buffers for string formatting
char buffer[41];

//Used for rand(), for it to be random we need a increasing value so we use seed
int seed;

int main() {

    initialize();

    while(1) {

        //To update buttons
        oldButtons = buttons;
        buttons = BUTTONS;

        //Switch cases for each game state
        switch(state) {
            case START:
                start();
                break;
            case PAUSE:
                pause();
                break;
            case GAME:
                game();
                break;
            case LOSE:
                lose();
                break;
            case WIN:
                win();
                break;
        }
    }
}

//Puts game at start screen and creates video display
void initialize() {
    REG_DISPCTL = MODE4 | BG2_ENABLE | DISP_BACKBUFFER;

    goToStart();
}

//Ran only once when start screen is either returned too or GBA is started
void goToStart() {
    DMANow(3, FullImageVaultBoyPal, PALETTE, 256);

    drawFullScreenImage4(FullImageVaultBoyBitmap);

    waitForVBlank();
    flipPage();

    state = START;
    seed = 0;
}

//Looping game logic to determine seed/rand num generator, also caps fps to 60, and moves to game state while creating game
void start() {
    seed++;
    waitForVBlank();

    if (BUTTON_PRESSED(BUTTON_START)) {
        srand(seed);
        initGame();
        goToGame();
    }
}

//Ran when traversing to game state
void goToGame() {

    state = GAME;
}

//Looping game logic to draw and update game based off player movements and other variables. Also, determines if we are going to pause, winl or lose
void game() {
    drawGame();
    updateGame();

    sprintf(buffer, "Wasteland Survivors: %d", vaultLength);
    drawString4(15, 145, buffer, GRAYID);

    waitForVBlank();
    flipPage();

    if(BUTTON_PRESSED(BUTTON_START)) {
        goToPause();
    } else if (vaultLength == 10) {
        goToWin();
    } else if (collide || vaultLength == -1) {
        goToLose();
    }
}

//Ran when traversing to pause state, displays simple text 
void goToPause() {
    fillScreen4(WHITEID);
    drawString4(105, 77, "Pause", GRAYID);

    waitForVBlank();
    flipPage();

    state = PAUSE;
}

//Looping game logic to determine if we return to game or return to start screen
void pause() {
    waitForVBlank();

    if(BUTTON_PRESSED(BUTTON_START)) {
        goToGame();
    } else if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToStart();
    }
}

//Ran when travesing to win state. Caps fps at 60
void goToWin() {
    fillScreen4(PERSIANID);
    drawString4(20, 77, "You returned to Vault 111 safely!", GRAYID);

    waitForVBlank();
    flipPage();

    state = WIN;
}

//Looping game logic to determine if player wants to play again
void win() {
    waitForVBlank();

    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }
}

//Ran when traversing to lose state. Cpas fps at 60
void goToLose() {
    fillScreen4(VIOREDID);
    drawString4(95, 77, "You Died", GRAYID);

    waitForVBlank();
    flipPage();

    state = LOSE;
}

//Looping game logic to determine if player wants to play again
void lose() {
    waitForVBlank();

    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }
}


