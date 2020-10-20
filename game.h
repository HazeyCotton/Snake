
//Palette for custom colors
#define NUMCOLORS 7
enum {BLACKID=(256-NUMCOLORS), PORTAGEID, PERSIANID, VIOREDID, WHITEID, GRAYID, TURQUOISEID};
extern unsigned short colors[NUMCOLORS];

//Function prototypes
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

//Self declared objects used in game
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

//Variables for game logic (i.e. win conditions) and set up for previous strucutre
#define MAXPLAYERLENGTH 10
#define MAXRADROACHES 4
extern PLAYER vaultDwellers[MAXPLAYERLENGTH];
extern RADROACHX radRoaches[MAXRADROACHES];
extern RADROACHY radRoaches2[MAXRADROACHES];
extern NUKACOLACAP nukaCola[MAXPLAYERLENGTH];
extern BOUNDARY boundaries[4];
extern int colaCapsRemaining;
extern int vaultLength;
extern int collide;
extern int noNukaColaCapActives;