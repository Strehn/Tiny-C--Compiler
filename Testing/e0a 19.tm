* C- version: 1.00
* by Sydney Petrehn
* Input file: e0a.c-
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
* TOFF set:  -11
* Compound body
* Var
* EXPRESSION
* ASSIGN  =
 40:    LDC  3,0(6)	Load integer constant 
* EXPRESSION
* EXPRESSION
* IF
* EXPRESSION
 41:    LDC  3,1(6)	Load integer constant 
* While
* EXPRESSION
* EXPRESSION
* EXPRESSION
 42:    LDC  3,10(6)	Load integer constant 
* OP  <
 43:     LD  4,-13(1)	Pop left into ac1 
 44:    TLT  3,4,3	Op < 
* COMPOUND
* TOFF set:  -7
* Compound body
* EXPRESSION
* CALL  output
 45:     ST  1,-7(1)	Store fp in ghost frame for  output
* TOFF dec:  -8
* TOFF dec:  -9
* EXPRESSION
* Param  1
 46:     LD  3,-2(1)	Load variable  x
 47:     ST  3,-9(1)	Push parameter 
* TOFF dec:  -10
* Param end  output
 48:    LDA  1,-7(1)	Ghost frame becomes new active frame 
 49:    LDA  3,1(7)	Return address in ac 
 50:    JMP  7,-45(7)	call output
 51:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set:  -7
* EXPRESSION
* ASSIGN  =
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
 52:    LDC  3,1(6)	Load integer constant 
* OP  +
 53:     LD  3,-2(1)	Load variable  x
 54:     ST  3,-8(1)	Push left side 
 55:     LD  4,-8(1)	Pop left into ac1 
 56:    ADD  3,4,3	Op + 
* END COMPOUND
* EXPRESSION
* CALL  output
 57:     ST  1,-8(1)	Store fp in ghost frame for  output
* TOFF dec:  -9
* TOFF dec:  -10
* EXPRESSION
 58:    LDC  3,666(6)	Load integer constant 
* Param  2
 59:     ST  3,-10(1)	Push parameter 
* TOFF dec:  -11
* Param end  output
 60:    LDA  1,-8(1)	Ghost frame becomes new active frame 
 61:    LDA  3,1(7)	Return address in ac 
 62:    JMP  7,-57(7)	call output
 63:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set:  -8
* EXPRESSION
* ASSIGN  =
 64:    LDC  3,0(6)	Load integer constant 
* EXPRESSION
* EXPRESSION
* IF
* EXPRESSION
 65:    LDC  3,0(6)	Load integer constant 
* While
* EXPRESSION
* EXPRESSION
* EXPRESSION
 66:    LDC  3,10(6)	Load integer constant 
* OP  <
 67:     LD  4,-9(1)	Pop left into ac1 
 68:    TLT  3,4,3	Op < 
* COMPOUND
* TOFF set:  -10
* Compound body
* EXPRESSION
* CALL  output
 69:     ST  1,-10(1)	Store fp in ghost frame for  output
* TOFF dec:  -11
* TOFF dec:  -12
* EXPRESSION
* Param  3
 70:     LD  3,-2(1)	Load variable  x
 71:     ST  3,-12(1)	Push parameter 
* TOFF dec:  -13
* Param end  output
 72:    LDA  1,-10(1)	Ghost frame becomes new active frame 
 73:    LDA  3,1(7)	Return address in ac 
 74:    JMP  7,-69(7)	call output
 75:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set:  -10
* EXPRESSION
* ASSIGN  =
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
 76:    LDC  3,1(6)	Load integer constant 
* OP  +
 77:     LD  3,-2(1)	Load variable  x
 78:     ST  3,-11(1)	Push left side 
 79:     LD  4,-11(1)	Pop left into ac1 
 80:    ADD  3,4,3	Op + 
* END COMPOUND
* EXPRESSION
* CALL  output
 81:     ST  1,-11(1)	Store fp in ghost frame for  output
* TOFF dec:  -12
* TOFF dec:  -13
* EXPRESSION
 82:    LDC  3,666(6)	Load integer constant 
* Param  4
 83:     ST  3,-13(1)	Push parameter 
* TOFF dec:  -14
* Param end  output
 84:    LDA  1,-11(1)	Ghost frame becomes new active frame 
 85:    LDA  3,1(7)	Return address in ac 
 86:    JMP  7,-81(7)	call output
 87:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set:  -11
* END COMPOUND
* Add standard closing in case there is no return statement
 88:    LDC  2,0(6)	Set return value to 0 
 89:     LD  3,-1(1)	Load return address 
 90:     LD  1,0(1)	Adjust frame pointer 
 91:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,91(7)	Jump to init [backpatch] 
* =========================================
* INIT
 92:    LDA  1,0(0)	Set first frame at end of globals 
 93:     ST  1,0(1)	Store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
 94:    LDA  3,1(7)	Return address in ac 
 95:    JMP  7,-57(7)	Jump to main 
 96:   HALT  0,0(0)	DONE! 
* END INIT
