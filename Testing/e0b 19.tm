* C- version: 1.00
* by Sydney Petrehn
* Input file: e0b.c-
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
* EXPRESSION
* CALL  output
 42:     ST  1,-13(1)	Store fp in ghost frame for  output
* TOFF dec:  -14
* TOFF dec:  -15
* EXPRESSION
 43:    LDC  3,666(6)	Load integer constant 
* Param  1
 44:     ST  3,-15(1)	Push parameter 
* TOFF dec:  -16
* Param end  output
 45:    LDA  1,-13(1)	Ghost frame becomes new active frame 
 46:    LDA  3,1(7)	Return address in ac 
 47:    JMP  7,-42(7)	call output
 48:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set:  -13
* While
* EXPRESSION
* EXPRESSION
* EXPRESSION
 49:    LDC  3,10(6)	Load integer constant 
* OP  <
 50:     LD  4,-13(1)	Pop left into ac1 
 51:    TLT  3,4,3	Op < 
* COMPOUND
* TOFF set:  -7
* Compound body
* EXPRESSION
* CALL  output
 52:     ST  1,-7(1)	Store fp in ghost frame for  output
* TOFF dec:  -8
* TOFF dec:  -9
* EXPRESSION
* Param  2
 53:     LD  3,-2(1)	Load variable  x
 54:     ST  3,-9(1)	Push parameter 
* TOFF dec:  -10
* Param end  output
 55:    LDA  1,-7(1)	Ghost frame becomes new active frame 
 56:    LDA  3,1(7)	Return address in ac 
 57:    JMP  7,-52(7)	call output
 58:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set:  -7
* EXPRESSION
* ASSIGN  =
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
 59:    LDC  3,1(6)	Load integer constant 
* OP  +
 60:     LD  3,-2(1)	Load variable  x
 61:     ST  3,-8(1)	Push left side 
 62:     LD  4,-8(1)	Pop left into ac1 
 63:    ADD  3,4,3	Op + 
* END COMPOUND
* EXPRESSION
* ASSIGN  =
 64:    LDC  3,0(6)	Load integer constant 
* EXPRESSION
* EXPRESSION
* IF
* EXPRESSION
 65:    LDC  3,0(6)	Load integer constant 
* EXPRESSION
* CALL  output
 66:     ST  1,-9(1)	Store fp in ghost frame for  output
* TOFF dec:  -10
* TOFF dec:  -11
* EXPRESSION
 67:    LDC  3,666(6)	Load integer constant 
* Param  3
 68:     ST  3,-11(1)	Push parameter 
* TOFF dec:  -12
* Param end  output
 69:    LDA  1,-9(1)	Ghost frame becomes new active frame 
 70:    LDA  3,1(7)	Return address in ac 
 71:    JMP  7,-66(7)	call output
 72:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set:  -9
* While
* EXPRESSION
* EXPRESSION
* EXPRESSION
 73:    LDC  3,10(6)	Load integer constant 
* OP  <
 74:     LD  4,-9(1)	Pop left into ac1 
 75:    TLT  3,4,3	Op < 
* COMPOUND
* TOFF set:  -10
* Compound body
* EXPRESSION
* CALL  output
 76:     ST  1,-10(1)	Store fp in ghost frame for  output
* TOFF dec:  -11
* TOFF dec:  -12
* EXPRESSION
* Param  4
 77:     LD  3,-2(1)	Load variable  x
 78:     ST  3,-12(1)	Push parameter 
* TOFF dec:  -13
* Param end  output
 79:    LDA  1,-10(1)	Ghost frame becomes new active frame 
 80:    LDA  3,1(7)	Return address in ac 
 81:    JMP  7,-76(7)	call output
 82:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set:  -10
* EXPRESSION
* ASSIGN  =
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
 83:    LDC  3,1(6)	Load integer constant 
* OP  +
 84:     LD  3,-2(1)	Load variable  x
 85:     ST  3,-11(1)	Push left side 
 86:     LD  4,-11(1)	Pop left into ac1 
 87:    ADD  3,4,3	Op + 
* END COMPOUND
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
