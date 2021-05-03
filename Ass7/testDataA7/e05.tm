* C- version: 1.00
* by Sydney Petrehn
* Input file: e05.c-
* FUNCTION output
  1:     ST  3,-1(1)	Store return address 
  2:     LD  3,-2(1)	Load parameter 
  3:    OUT  3,3,3	Output integer 
  4:     LD  3,-1(1)	Load return address 
  5:     LD  1,0(1)	Adjust frame pointer 
  6:    LDA  7,0(3)	Return 
* END FUNCTION output
* FUNCTION outputb
  7:     ST  3,-1(1)	Store return address 
  8:     LD  3,-2(1)	Load parameter 
  9:   OUTB  3,3,3	Output bool 
 10:     LD  3,-1(1)	Load return address 
 11:     LD  1,0(1)	Adjust frame pointer 
 12:    LDA  7,0(3)	Return 
* END FUNCTION outputb
* FUNCTION outputc
 13:     ST  3,-1(1)	Store return address 
 14:     LD  3,-2(1)	Load parameter 
 15:   OUTC  3,3,3	Output char 
 16:     LD  3,-1(1)	Load return address 
 17:     LD  1,0(1)	Adjust frame pointer 
 18:    LDA  7,0(3)	Return 
* END FUNCTION outputc
* FUNCTION outnl
 19:     ST  3,-1(1)	Store return address 
 20:  OUTNL  3,3,3	Output newline 
 21:     LD  3,-1(1)	Load return address 
 22:     LD  1,0(1)	Adjust frame pointer 
 23:    LDA  7,0(3)	Return 
* END FUNCTION outnl
* FUNCTION input
 24:     ST  3,-1(1)	Store return address 
 25:     IN  2,2,2	Grab int input 
 26:     LD  3,-1(1)	Load return address 
 27:     LD  1,0(1)	Adjust frame pointer 
 28:    LDA  7,0(3)	Return 
* END FUNCTION input
* FUNCTION inputb
 29:     ST  3,-1(1)	Store return address 
 30:    INB  2,2,2	Grab bool input 
 31:     LD  3,-1(1)	Load return address 
 32:     LD  1,0(1)	Adjust frame pointer 
 33:    LDA  7,0(3)	Return 
* END FUNCTION inputb
* FUNCTION inputc
 34:     ST  3,-1(1)	Store return address 
 35:    INC  2,2,2	Grab char input 
 36:     LD  3,-1(1)	Load return address 
 37:     LD  1,0(1)	Adjust frame pointer 
 38:    LDA  7,0(3)	Return 
* END FUNCTION inputc
* =========================================
* =========================================
* INIT
  0:    JMP  7,38(7)	Jump to init [backpatch] 
 39:     LD  0,0(0)	Set global pointer 
 40:    LDA  1,-41(0)	Set frame pointer 
 41:     ST  1,0(1)	Store old frame pointer 
 42:    LDA  3,1(7)	Return address 
 43:    JMP  7,0(7)	Jump to main 
* END INIT
