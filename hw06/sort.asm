;;=============================================================
;; CS 2110 - Fall 2021
;; Homework 6 - Selection Sort
;;=============================================================
;; Name: Quincy Bright
;;=============================================================

;; In this file, you must implement the 'SORT' subroutine.

;; Little reminder from your friendly neighborhood 2110 TA staff: don't run
;; this directly by pressing 'RUN' in complx, since there is nothing put at
;; address x3000. Instead, load it and use 'Debug' -> 'Simulate
;; Subroutine Call' and choose the 'sort' label.

.orig x3000
HALT

;;Pseudocode (see PDF for explanation)
;;  arr: memory address of the first element in the array
;;  n: integer value of the number of elements in the array
;;
;;  sort(array, len, function compare) {
;;      i = 0;
;;      while (i < len - 1) {
;;          j = i;
;;          k = i + 1;
;;          while (k < len) {
;;              // update j if ARRAY[j] > ARRAY[k]
;;              if (compare(ARRAY[j], ARRAY[k]) > 0) {
;;                  j = k;
;;              }
;;              k++;
;;          }
;;          temp = ARRAY[i];
;;          ARRAY[i] = ARRAY[j];
;;          ARRAY[j] = temp;
;;          i++;
;;      }
;;  }

sort

;;YOUR CODE HERE
ADD R6,R6,#-4   
STR R7,R6,#2    
STR R5,R6,#1    
ADD R5,R6,#0    
ADD R6,R6,#-2   
ADD R6,R6,#-5   
STR R0,R5,#-3   
STR R1,R5,#-4   
STR R2,R5,#-5   
STR R3,R5,#-6   
STR R4,R5,#-7   

LDR R0, R5, #4 ;array
LDR R1, R5, #5 ;n
AND R2, R2, #0 ;i

WH1
ADD R1, R1, #-1 ;len = len-1
NOT R1, R1 
ADD R1, R1, #1
ADD R1, R2, R1 ;i-(len-1) < 0
BRzp END

LDR R1, R5, #5 ;n
AND R3, R3, #0 ;j
ADD R3, R2, #0 ; j = i
AND R4, R4, #0 ; k
ADD R4, R2, #1 ;k = i+1

WH2
NOT R1, R1 
ADD R1, R1, #1 
ADD R1, R4, R1 ;k-len<0
BRzp EWH2

IF1
LDR R1, R5, #5 ;n
ADD R6, R6, #-1 ;

LDR R0, R5, #4 ;array
ADD R0, R3, #0 ;array + j
LDR R0, R0, #0 ;array[j]
STR R0, R6, #0 ;store 
ADD R6, R6, #-1

LDR R0, R5, #4 ;array
ADD R0, R4, #0 ;array+k
LDR R0, R0, #0 ;array[k]
STR R0, R6, #0 ;store

STR R7, R6, #-2
STR R5, R6, #-3

LDR R1, R5, #6
JSRR R1
LDR R1, R6, #0 ;pop value
ADD R6, R6, #3
ADD R1, R1, #0
BRnz EIF1 ;check if compare(ARRAY[j], ARRAY[k]) > 0
ADD R3, R4, #0 ; j = k
EIF1
ADD R4, R4, #1 ;k++
LDR R1, R5, #5
BR WH2

EWH2
LDR R0, R5, #4 ; array
ADD R1, R0, R2 ; array+i
LDR R0, R1, #0
STR R0, R5, #-2
LDR R0, R5, #4 ; array
ADD R3, R0, R3 ;array + j
LDR R4, R3, #0
STR R4, R1, #0 ;array[i] = array[j]
LDR R4, R5, #-2 ;r4 =temp
STR R4, R3, #0 ;array[j] = temp
;;i++
ADD R2, R2, #1
LDR R1, R5, #5
BR WH1

END
;LDR R2,R5,#0    
;STR R2,R5,#0    

LDR R4,R5,#-7   
LDR R3,R5,#-6   
LDR R2,R5,#-5   
LDR R1,R5,#-4   
LDR R0,R5,#-3   
ADD R6,R5,#0    
LDR R5,R6,#1    
LDR R7,R6,#2    
ADD R6,R6,#5    
RET

;; used by the autograder
STACK .fill xF000
.end

;; USE FOR DEBUGGING IN COMPLX
;; load array at x4000 and put the length as 7

;; ARRAY
.orig x4000
    .fill 4
    .fill -9
    .fill 0
    .fill -2
    .fill 9
    .fill 3
    .fill -10
.end

;; The following subroutine is the compare function that is passed  
;; as the function address parameter into the sorting function. It   
;; will work perfectly fine as long as you follow the   
;; convention on the caller's side. 
;; DO NOT edit the code below; it will be used by the autograder.   
.orig x5000 
    ;;greater than  
CMPGT   
    .fill x1DBD
    .fill x7180
    .fill x7381
    .fill x6183
    .fill x6384
    .fill x927F
    .fill x1261
    .fill x1201
    .fill x0C03
    .fill x5020
    .fill x1021
    .fill x0E01
    .fill x5020
    .fill x7182
    .fill x6180
    .fill x6381
    .fill x1DA2
    .fill xC1C0
    .fill x9241
.end