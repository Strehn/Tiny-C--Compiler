* C- version: 1.00
* by Sydney Petrehn
* Input file: b08.c-
* FUNCTION input
  1:     ST  3,-1(1)	Store return address 
  2:     IN  2,2,2	Grab int input 
  3:     LD  3,-1(1)	Load return address 
  4:     LD  1,0(1)	Adjust frame pointer 
  5:    LDA  7,0(3)	Return 
* END FUNCTION input
* FUNCTION output
  6:     ST  3,-1(1)	Store return address 
  7:     LD  3,-2(1)	Load parameter 
  8:    OUT  3,3,3	Output integer 
  9:     LD  3,-1(1)	Load return address 
 10:     LD  1,0(1)	Adjust frame pointer 
 11:    LDA  7,0(3)	Return 
* END FUNCTION output
* FUNCTION inputb
 12:     ST  3,-1(1)	Store return address 
 13:    INB  2,2,2	Grab bool input 
 14:     LD  3,-1(1)	Load return address 
 15:     LD  1,0(1)	Adjust frame pointer 
 16:    LDA  7,0(3)	Return 
* END FUNCTION inputb
* FUNCTION outputb
 17:     ST  3,-1(1)	Store return address 
 18:     LD  3,-2(1)	Load parameter 
 19:   OUTB  3,3,3	Output bool 
 20:     LD  3,-1(1)	Load return address 
 21:     LD  1,0(1)	Adjust frame pointer 
 22:    LDA  7,0(3)	Return 
* END FUNCTION outputb
* FUNCTION inputc
 23:     ST  3,-1(1)	Store return address 
 24:    INC  2,2,2	Grab char input 
 25:     LD  3,-1(1)	Load return address 
 26:     LD  1,0(1)	Adjust frame pointer 
 27:    LDA  7,0(3)	Return 
* END FUNCTION inputc
* FUNCTION outputc
 28:     ST  3,-1(1)	Store return address 
 29:     LD  3,-2(1)	Load parameter 
 30:   OUTC  3,3,3	Output char 
 31:     LD  3,-1(1)	Load return address 
 32:     LD  1,0(1)	Adjust frame pointer 
 33:    LDA  7,0(3)	Return 
* END FUNCTION outputc
* FUNCTION outnl
 34:     ST  3,-1(1)	Store return address 
 35:  OUTNL  3,3,3	Output newline 
 36:     LD  3,-1(1)	Load return address 
 37:     LD  1,0(1)	Adjust frame pointer 
 38:    LDA  7,0(3)	Return 
* END FUNCTION outnl
* =========================================
* FUNCTION main
* TOFF set: 
 39:     ST  3,-1(1)	store return address 
* COMPOUND
* TOFF set: 
* Compound body
* EXPRESSION
* CALL  outputb
 40:     ST  1,-3(1)	Store fp in ghost frame for  outputb
* TOFF dec: 
* TOFF dec: 
* EXPRESSION
* EXPRESSION
 41:    LDC  3,1(6)	Load integer constant 
 42:     ST  3,-5(1)	Push left side 
* OP  not
 43:    LDC  4,1(6)	Load 1 
 44:    XOR  3,3,4	Logical not 
* Param 
 45:     ST  3,-5(1)	Push parameter 
* TOFF dec: 
* Param end  outputb
 46:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 47:    LDA  3,1(7)	Return address in ac 
 48:    JMP  7,-32(7)	call outputb
 49:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set: 
* EXPRESSION
* CALL  outnl
 50:     ST  1,-3(1)	Store fp in ghost frame for  outnl
* TOFF dec: 
* TOFF dec: 
* Param end  outnl
 51:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 52:    LDA  3,1(7)	Return address in ac 
 53:    JMP  7,-20(7)	call outnl
 54:    LDA  3,0(2)	save the result in ac 
* Call end  outnl
* TOFF set: 
* EXPRESSION
* CALL  outputb
 55:     ST  1,-3(1)	Store fp in ghost frame for  outputb
* TOFF dec: 
* TOFF dec: 
* EXPRESSION
* EXPRESSION
 56:    LDC  3,0(6)	Load integer constant 
 57:     ST  3,-5(1)	Push left side 
* OP  not
 58:    LDC  4,1(6)	Load 1 
 59:    XOR  3,3,4	Logical not 
* Param 
 60:     ST  3,-5(1)	Push parameter 
* TOFF dec: 
* Param end  outputb
 61:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 62:    LDA  3,1(7)	Return address in ac 
 63:    JMP  7,-47(7)	call outputb
 64:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set: 
* EXPRESSION
* CALL  outnl
 65:     ST  1,-3(1)	Store fp in ghost frame for  outnl
* TOFF dec: 
* TOFF dec: 
* Param end  outnl
 66:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 67:    LDA  3,1(7)	Return address in ac 
 68:    JMP  7,-35(7)	call outnl
 69:    LDA  3,0(2)	save the result in ac 
* Call end  outnl
* TOFF set: 
* END COMPOUND
* Add standard closing in case there is no return statement
 70:    LDC  2,0(6)	Set return value to 0 
 71:     LD  3,-1(1)	Load return address 
 72:     LD  1,0(1)	Adjust frame pointer 
 73:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,73(7)	Jump to init [backpatch] 
* =========================================
* INIT
 74:    LDA  1,0(0)	Set first frame at end of globals 
 75:     ST  1,0(1)	Store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
 76:    LDA  3,1(7)	Return address in ac 
 77:    JMP  7,-39(7)	Jump to main 
 78:   HALT  0,0(0)	DONE! 
* END INIT
