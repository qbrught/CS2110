;;=============================================================
;; CS 2110 - Fall 2021
;; Homework 5 - Array Modify
;;=============================================================
;; Name: Quincy Bright
;;=============================================================

;; Pseudocode (see PDF for explanation)
;;
;;    i = 0; // first index 
;;    len = Len(ARR_X);
;;
;;    while (i < len) {
;;        if (i % 2 == 0) {
;;            //if we are at an even index, subtract 10 and save it to the array at that index 
;;    	    ARR_Y[i] = ARR_X[i] - 10];
;;        } else {
;;            //if we are at odd index, multiply by 2 and save it to the array at that index 
;;    	    ARR_Y[i] = ARR_X[i] * 2;
;;        }
;;        	i++;
;;    }

.orig x3000

AND R6, R6, #0
ST R6, i
FOR1
LD R6, i
LD R1, LENGTH
NOT R1, R1
ADD R1, R1, #1
ADD R6, R6, R1
BRzp EFOR1

IF1
LD R6, i
AND R6, R6, #1
BRnp E1
LD R6, i
LD R3, ARR_X
ADD R3, R3, R6
LDR R3, R3, #0
ADD R3, R3, #-10
LD R0, ARR_Y 
ADD R0, R0, R6
STR R3, R0, #0
;reinit i++
LD R6,i
ADD R6, R6, #1
ST R6,i
BR FOR1

E1
LD R6, i
LD R3, ARR_X
ADD R3, R3, R6
LDR R3, R3, #0
ADD R3, R3, R3
LD R0, ARR_Y
ADD R0, R0, R6
STR R3, R0, #0
;reinit i++
LD R6,i
ADD R6, R6, #1
ST R6,i
BR FOR1


EFOR1
NOP

HALT


ARR_X       .fill x4000
ARR_Y       .fill x4100
LENGTH      .fill 4
i	    .fill 3 
.end

.orig x4000
.fill 1
.fill 5
.fill 10
.fill 11
.end

.orig x4100
.blkw 4
.end
