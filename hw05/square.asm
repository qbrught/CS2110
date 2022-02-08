;;=============================================================
;; CS 2110 - Fall 2021
;; Homework 5 - Square
;;=============================================================
;; Name: Quincy Bright
;;=============================================================

;; Pseudocode (see PDF for explanation)
;; a = (argument 1);
;; ANSWER = 0;
;; for (int i = 0; i < a; i++) {
;;		ANSWER += a;
;; }
;; return ANSWER;

.orig x3000

;;put your code here
;for(int i = 0; i < a; i++) {
;int i = 0
AND R1, R1, #0
ST R1, i
LD R0, A
NOT R4, R0
ADD R4, R4, #1
;test (i-a<0)
FOR1 
LD R1,i
ADD R1, R1, R4
BRzp EFOR1
;J = a+a
LD R1,i
LD R0, A
LD R3,j
ADD R3, R3, R0
ST R3, j
;reinit i++
LD R1,i
ADD R1, R1, #1
ST R1,i
BR FOR1
EFOR1 NOP
LD R3,j
ADD R3, R3, #-10
ST R3, ANSWER



HALT


A .fill 9
i .fill 8
j .fill 10
ANSWER .blkw 1

.end
