;;=============================================================
;; CS 2110 - Fall 2021
;; Homework 5 - Toggle Case
;;=============================================================
;; Name: Quincy Bright
;;=============================================================

;; Pseudocode (see PDF for explanation):
;;
;;	string = "Assembly is interesting"; // given string
;;	Array[string.len()] answer; // array to store the result string
;;	i = 0;
;;
;;	while (string[i] != '\0') {
;;	    if (string[i] == " ") {
;;	        answer[i] = " ";
;;	    } else if (string[i] >= "A" && string[i] <= "Z") {
;;	        answer[i] = string[i].lowerCase();
;;	    } else {
;;	        answer[i] = string[i].upperCase();
;;	    }
;;	    i++;
;;	}


.orig x3000


;; READ LINE 40
;; put your code here
LD R0, STRING
AND R6,R6, #0
ST R6, i

WH1
ADD R2, R0, R6
LDR R2, R2, #0
ADD R2, R2, #0
BRz ENDWH1

IF1
LD R0, STRING
LD R6, i
LD R3, SPACE
ADD R2, R0, R6
LDR R2, R2, #0
NOT R3, R3
ADD R3, R3, #1
ADD R5, R2, R3
BRnp ELIF1
LD R4, ANSWER
LD R0, STRING
LD R6, i
ADD R2, R0, R6
LDR R2, R2, #0
ADD R4, R4, R6
STR R2, R4, #0
BR END1

ELIF1
LD R0, STRING
LD R6, i
ADD R2, R0, R6
LDR R2, R2, #0
LD R3, A
LD R4, Z
NOT R3, R3
ADD R3, R3, #1
NOT R4, R4
ADD R4, R4, #1
ADD R5, R2, R3
BRn EL1
ADD R5, R2, R4
BRp EL1
;LD R1, #-26
;ADD R5, R4, R1
;BRp EL1

LD R0, STRING
LD R6, i
ADD R1, R0, R6
LDR R1, R1, #0
LD R2, tt
NOT R1, R1
NOT R2,R2
AND R1, R1, R2
NOT R1, R1

;NOT R2, R2
;NOT R1, R1
;AND R1, R1, R2
;NOT R1, R1

LD R4, ANSWER
LD R6, i
ADD R4, R4, R6
STR R1, R4, #0
BR END1

EL1
LD R0, STRING
LD R6, i
ADD R1, R0, R6
LDR R1, R1, #0
LD R2, tt
NOT R2, R2
AND R1, R1, R2
;LD R2, #32
;NOT R2, R2
;AND R3, R1, R2
LD R4, ANSWER
LD R6, i
ADD R4, R4, R6
STR R1, R4, #0

END1
LD R6, i
ADD R6, R6, #1
ST R6, i
BR WH1

ENDWH1
LD R0, ANSWER
LD R6, i
LD R2, zero
ADD R0, R0, R6
STR R2, R0, #0

HALT


;; ASCII table: https://www.asciitable.com/


;; FILL OUT THESE ASCII CHARACTER VALUE FIRST TO USE IT IN YOUR CODE
SPACE	.fill x20
A		.fill x41
Z		.fill x5a
a       .fill x61
z       .fill x7a
zero .fill x00
BREAK	.fill x5D	;; this is the middle of uppercase and lowercase characters

STRING .fill x4000
ANSWER .fill x4100
i .fill 3
tt .fill #32
.end

.orig x4000
.stringz "Assembly is INTERESTING"
.end

.orig x4100
.blkw 23
.end