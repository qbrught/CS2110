;;=============================================================
;; CS 2110 - Fall 2021
;; Homework 5 - Remove Vowels
;;=============================================================
;; Name: Quincy Bright
;;=============================================================

;; Pseudocode (see PDF for explanation)
;; STRING = (argument 1);
;; ANSWER = "";
;; for (int i = 0; i < a.length; i++) {
;;       if (string[i] == '\0'){
;;          break
;;        }

;;       if (string[i] == ’A’) {
;;           continue;
;;        } else if (string[i] == ’E’) {
;;            continue;
;;        } else if (string[i] == ’I’) {
;;            continue;
;;        } else if (string[i] == ’O’) {
;;            continue;
;;        } else if (string[i] == ’U’) {
;;            continue;
;;        } else if (string[i] == ’a’) {
;;            continue;
;;        } else if (string[i] == ’e’) {
;;            continue;
;;        } else if (string[i] == ’i’) {
;;            continue;
;;        } else if (string[i] == ’o’) {
;;            continue;
;;        } else if (string[i] == 'u') {
;;            continue;
;;        }
;;
;;        ANSWER += STRING[i];
;;	}
;;  ANSWER += '\0';
;;
;;  return ANSWER;
;; }

.orig x3000

AND R6, R6, #0
ST R6, i
ST R6, j

WH1
LD R6, i
LD R0, STRING
ADD R0, R0, R6
LDR R0, R0, #0
BRz EWH1

IF1
LD R6, i
LD R0, STRING
LD R1, A
NOT R1, R1
ADD R1, R1, #1
ADD R0, R0, R6
LDR R0, R0, #0
ADD R1, R0, R1
BRz EIF
LD R1, LOWERA
NOT R1, R1
ADD R1, R1, #1
ADD R1, R0, R1
BRz EIF
LD R1, E
NOT R1, R1
ADD R1, R1, #1
ADD R1, R0, R1
BRz EIF
LD R1, LOWERE
NOT R1, R1
ADD R1, R1, #1
ADD R1, R0, R1
BRz EIF
LD R1, I
NOT R1, R1
ADD R1, R1, #1
ADD R1, R0, R1
BRz EIF
LD R1, LOWERI
NOT R1, R1
ADD R1, R1, #1
ADD R1, R0, R1
BRz EIF
LD R1, O
NOT R1, R1
ADD R1, R1, #1
ADD R1, R0, R1
BRz EIF
LD R1, LOWERO
NOT R1, R1
ADD R1, R1, #1
ADD R1, R0, R1
BRz EIF
LD R1, U
NOT R1, R1
ADD R1, R1, #1
ADD R1, R0, R1
BRz EIF
LD R1, LOWERU
NOT R1, R1
ADD R1, R1, #1
ADD R1, R0, R1
BRz EIF

LD R0, STRING
LD R3, j
LD R6, i
LD R4, ANSWER
ADD R0, R0, R6
LDR R0, R0, #0
ADD R4, R4, R3
STR R0, R4, #0
ADD R3, R3, #1
ST R3, j

EIF
LD R6, i
ADD R6, R6, #1
ST R6, i
BR WH1

EWH1
LD R4, ANSWER
LD R5, j
LD R2, ZERO
ADD R4, R4, R5
STR R2, R4, #0

HALT





STRING .fill x4000
ANSWER .fill x4100
i      .fill 3
j .fill 5



;;NOTE: For your convenience, you can make new labels for
;;the ASCII values of other vowels here! 2 have been done
;;here as an example.

LOWERA .fill x61    ;; a in ASCII
LOWERE .fill x65
LOWERI .fill x69
LOWERO .fill x6f
LOWERU .fill x75
ZERO .fill x00

A .fill x41     ;; A in ASCII
E .fill x45
I .fill x49
O .fill x4f
U .fill x55
.end

.orig x4000

.stringz "spongebob and SQUIDWARD"

.end
