;;=============================================================
;; CS 2110 - Fall 2021
;; Homework 6 - Linked List Sum
;;=============================================================
;; Name: Quincy Bright
;;============================================================

;; In this file, you must implement the 'llsum' subroutine.

;; Little reminder from your friendly neighborhood 2110 TA staff: don't run
;; this directly by pressing 'RUN' in complx, since there is nothing put at
;; address x3000. Instead, load it and use 'Debug' -> 'Simulate
;; Subroutine Call' and choose the 'reverseCopy' label.

.orig x3000
HALT

;; Pseudocode (see PDF for explanation):
;;
;; Arguments of llsum: Node head
;;
;; llsum(Node head) {
;;     // note that a NULL address is the same thing as the value 0
;;     if (head == NULL) {
;;         return 0;
;;     }
;;     Node next = head.next;
;;     sum = head.data + llsum(next);
;;     return sum;
;; }

llsum

;; YOUR CODE HERE
ADD R6,R6,#-4   
STR R7,R6,#2    
STR R5,R6,#1    
ADD R5,R6,#0    

ADD R6,R6,#-6   
STR R0,R5,#-1   
STR R1,R5,#-2   
STR R2,R5,#-3   
STR R3,R5,#-4   
STR R4,R5,#-5   

IF1
LDR R0, R5, #4
BRnp EIF
AND R1, R1, #0
STR R1, R5, #3
BR END

EIF
LDR R0, R5, #4
LDR R1, R0, #0
ADD R6, R6, #-1
STR R1, R6, #0
JSR llsum
LDR R0,R0,#1
LDR R1, R6, #0
ADD R6,R6,#1
ADD R0, R0, R1
STR R0, R5, #3

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

;; used by the autograder
STACK .fill xF000
.end

;; The following is an example of a small linked list that starts at x4000.
;;
;; The first number (offset 0) contains the address of the next node in the
;; linked list, or zero if this is the final node.
;;
;; The second number (offset 1) contains the data of this node.
.orig x4000
.fill x4008
.fill 5
.end

.orig x4008
.fill x4010
.fill 12
.end

.orig x4010
.fill 0
.fill -7
.end
