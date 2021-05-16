* C- version: 1.00
* by Sydney Petrehn
* Input file: e07.c-
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
* TOFF set:  -2
 39:     ST  3,-1(1)	store return address 
* COMPOUND
* TOFF set:  -8
* Compound body
* Var
* EXPRESSION
* ASSIGN  =
 40:    LDC  3,0(6)	Load integer constant 
* EXPRESSION
* EXPRESSION
* While
* EXPRESSION
* EXPRESSION
* EXPRESSION
 41:    LDC  3,10(6)	Load integer constant 
* OP  <
 42:     LD  4,-10(1)	Pop left into ac1 
 43:    TLT  3,4,3	Op < 
* COMPOUND
* TOFF set:  -7
* Compound body
* EXPRESSION
* CALL  output
 44:     ST  1,-7(1)	Store fp in ghost frame for  output
* TOFF dec:  -8
* TOFF dec:  -9
* EXPRESSION
* Param  1
 45:     LD  3,-2(1)	Load variable  x
 46:     ST  3,-9(1)	Push parameter 
* TOFF dec:  -10
* Param end  output
 47:    LDA  1,-7(1)	Ghost frame becomes new active frame 
 48:    LDA  3,1(7)	Return address in ac 
 49:    JMP  7,-44(7)	call output
 50:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set:  -7
* IF
* EXPRESSION
* EXPRESSION
* EXPRESSION
 51:    LDC  3,5(6)	Load integer constant 
* OP  ==
 52:     LD  4,-7(1)	Pop left into ac1 
 53:    TEQ  3,4,3	Op == 
* Break
 54:    JMP  7,-9(7)	break 
* EXPRESSION
* ASSIGN  =
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
 55:    LDC  3,1(6)	Load integer constant 
* OP  +
 56:     LD  3,-2(1)	Load variable  x
 57:     ST  3,-8(1)	Push left side 
 58:     LD  4,-8(1)	Pop left into ac1 
 59:    ADD  3,4,3	Op + 
* END COMPOUND
* EXPRESSION
* CALL  output
 60:     ST  1,-8(1)	Store fp in ghost frame for  output
* TOFF dec:  -9
* TOFF dec:  -10
* EXPRESSION
 61:    LDC  3,666(6)	Load integer constant 
* Param  2
 62:     ST  3,-10(1)	Push parameter 
* TOFF dec:  -11
* Param end  output
 63:    LDA  1,-8(1)	Ghost frame becomes new active frame 
 64:    LDA  3,1(7)	Return address in ac 
 65:    JMP  7,-60(7)	call output
 66:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set:  -8
* END COMPOUND
* Add standard closing in case there is no return statement
 67:    LDC  2,0(6)	Set return value to 0 
 68:     LD  3,-1(1)	Load return address 
 69:     LD  1,0(1)	Adjust frame pointer 
 70:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,70(7)	Jump to init [backpatch] 
* =========================================
* INIT
 71:    LDA  1,0(0)	Set first frame at end of globals 
 72:     ST  1,0(1)	Store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
 73:    LDA  3,1(7)	Return address in ac 
 74:    JMP  7,-36(7)	Jump to main 
 75:   HALT  0,0(0)	DONE! 
* END INIT