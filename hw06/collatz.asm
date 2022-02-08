;;=======================================
;; CS 2110 - Fall 2021
;; HW6 - Collatz Conjecture
;;=======================================
;; Name: Quincy Bright
;;=======================================

;; In this file, you must implement the 'collatz' subroutine.

;; Little reminder from your friendly neighborhood 2110 TA staff:
;; don't run this directly by pressing 'RUN' in Complx, since there is nothing
;; put at address x3000. Instead, load it and use 'Debug' -> 'Simulate
;; Subroutine Call' and choose the 'collatz' label.


.orig x3000
HALT

collatz
;; See the PDF for more information on what this subroutine should do.
;;
;; Arguments of collatz: postive integer n
;;
;; Pseudocode:
;; collatz(int n) {
;;     if (n == 1) {
;;         return 0;
;;     }
;;     if (n % 2 == 0) {
;;         return collatz(n/2) + 1;
;;     } else {
;;         return collatz(3 * n + 1) + 1;
;;     }
;; }


;; beginning:
ADD R6,R6,#-4   
STR R7,R6,#2    
STR R5,R6,#1    
ADD R5,R6,#0    
ADD R6,R6,#-5   
STR R0,R5,#-1   
STR R1,R5,#-2   
STR R2,R5,#-3   
STR R3,R5,#-4   
STR R4,R5,#-5   

IF
LDR R0,R5,#4  
ADD R1,R0,#-1    
BRz RETURN0       
BR ELIF         

RETURN0
AND R1,R1,#0    
ADD R1, R1, #0
STR R1,R5,#3    
BR END

ELIF
LDR R0,R5,#4
AND R1,R0,#1    
BRnp ELSE
LDR R0,R5,#4
ADD R6,R6,#-1
STR R0,R6,#0
JSR divideBy2
LDR R0, R6, #0
ADD R6, R6, #1
ADD R6,R6,#-1
STR R0,R6,#0
JSR collatz
LDR R0, R6, #0
ADD R6, R6, #1
ADD R0, R0, #1
STR R0,R5, #3
BR END

ELSE
;;collatz(3n+1)+1
LDR R0,R5,#4
ADD R1, R0, R0
ADD R1, R1, R0
ADD R1, R1, #1
ADD R6, R6, #-1
STR R1, R6, #0
JSR collatz
LDR R0, R6, #0
ADD R6, R6, #1
ADD R0, R0, #1
STR R0, R5, #3
BR END

END
LDR R4,R5,#-5   
LDR R3,R5,#-4   
LDR R2,R5,#-3   
LDR R1,R5,#-2   
LDR R0,R5,#-1   
ADD R6,R5,#0    
LDR R5,R6,#1    
LDR R7,R6,#2    
ADD R6,R6,#3    
RET

;; The following is a subroutine that takes a single number n and returns n/2.
;; You may call this subroutine to help you with 'collatz'.

;; DO NOT CHANGE THIS SUBROUTINE IN ANY WAY
divideBy2
.fill x1DBC
.fill x7F82
.fill x7B81
.fill x1BA0
.fill x1DBB
.fill x7184
.fill x7383
.fill x7582
.fill x7781
.fill x7980
.fill x6144
.fill x5260
.fill x1020
.fill x0C03
.fill x103E
.fill x1261
.fill x0FFB
.fill x7343
.fill x6980
.fill x6781
.fill x6582
.fill x6383
.fill x6184
.fill x1D60
.fill x6B81
.fill x6F82
.fill x1DA3
.fill xC1C0


; Needed by Simulate Subroutine Call in Complx
STACK .fill xF000
.end