#ifndef MAIN_H
#define MAIN_H

#include "gba.h"

// TODO: Create any necessary structs

/*
* For example, for a Snake game, one could be:
*
* struct snake {
*   int heading;
*   int length;
*   int row;
*   int col;
* };
*
* Example of a struct to hold state machine data:
*
* struct state {
*   int currentState;
*   int nextState;
* };
*
*/

struct Player {
    int row;
    int col;
    int height;
    int width;
    unsigned short color;
    const u16 *image;
    int score;
};
struct Time {
    int moves;
};
struct Badguy {
    int row;
    int col;
    int height;
    int width;
    unsigned short color;
};
struct Goal {
    int row;
    int col;
    int height;
    int width;
    unsigned short color;
};
struct state {
    struct Player player1;
    struct Time timer;
    struct Badguy enemy;
    struct Goal endpoint;
} curr;

void updateLocation(unsigned int currentButton, unsigned int previousButton);

#endif
