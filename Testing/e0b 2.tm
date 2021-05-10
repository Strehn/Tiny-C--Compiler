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
* TOFF set:  -5
* Compound body
* Var
* EXPRESSION
* ASSIGN  =
 40:    LDC  3,0(6)	Load integer constant 
 41:     ST  3,-2(1)	Store variable x
* EXPRESSION
* EXPRESSION
* IF
* EXPRESSION
 42:    LDC  3,1(6)	Load integer constant 
* EXPRESSION
* CALL  output
 43:     ST  1,-7(1)	Store fp in ghost frame for  output
* TOFF dec:  -8
* TOFF dec:  -9
* EXPRESSION
 44:    LDC  3,666(6)	Load integer constant 
* Param  1
 45:     ST  3,-9(1)	Push parameter 
* TOFF dec:  -10
* Param end  output
 46:    LDA  1,-7(1)	Ghost frame becomes new active frame 
 47:    LDA  3,1(7)	Return address in ac 
 48:    JMP  7,-43(7)	call output
 49:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set:  -7
* While
* EXPRESSION
* EXPRESSION
* EXPRESSION
 50:    LDC  3,10(6)	Load integer constant 
* OP  <
 51:     LD  4,-7(1)	Pop left into ac1 
 52:    TLT  3,4,3	Op < 
* COMPOUND
* TOFF set:  -5
* Compound body
* EXPRESSION
* CALL  output
 53:     ST  1,-5(1)	Store fp in ghost frame for  output
* TOFF dec:  -6
* TOFF dec:  -7
* EXPRESSION
* Param  2
 54:     LD  3,-2(1)	Load variable  x
 55:     ST  3,-7(1)	Push parameter 
* TOFF dec:  -8
* Param end  output
 56:    LDA  1,-5(1)	Ghost frame becomes new active frame 
 57:    LDA  3,1(7)	Return address in ac 
 58:    JMP  7,-53(7)	call output
 59:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set:  -5
* EXPRESSION
* ASSIGN  =
 60:     ST  3,-2(1)	Store variable x
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
 61:    LDC  3,1(6)	Load integer constant 
* OP  +
 62:     LD  3,-2(1)	Load variable  x
 63:     ST  3,-6(1)	Push left side 
 64:     LD  4,-6(1)	Pop left into ac1 
 65:    ADD  3,4,3	Op + 
* END COMPOUND
* EXPRESSION
* ASSIGN  =
 66:    LDC  3,0(6)	Load integer constant 
 67:     ST  3,-2(1)	Store variable x
* EXPRESSION
* EXPRESSION
* IF
* EXPRESSION
 68:    LDC  3,0(6)	Load integer constant 
* EXPRESSION
* CALL  output
 69:     ST  1,-7(1)	Store fp in ghost frame for  output
* TOFF dec:  -8
* TOFF dec:  -9
* EXPRESSION
 70:    LDC  3,666(6)	Load integer constant 
* Param  3
 71:     ST  3,-9(1)	Push parameter 
* TOFF dec:  -10
* Param end  output
 72:    LDA  1,-7(1)	Ghost frame becomes new active frame 
 73:    LDA  3,1(7)	Return address in ac 
 74:    JMP  7,-69(7)	call output
 75:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set:  -7
* While
* EXPRESSION
* EXPRESSION
* EXPRESSION
 76:    LDC  3,10(6)	Load integer constant 
* OP  <
 77:     LD  4,-7(1)	Pop left into ac1 
 78:    TLT  3,4,3	Op < 
* COMPOUND
* TOFF set:  -6
* Compound body
* EXPRESSION
* CALL  output
 79:     ST  1,-6(1)	Store fp in ghost frame for  output
* TOFF dec:  -7
* TOFF dec:  -8
* EXPRESSION
* Param  4
 80:     LD  3,-2(1)	Load variable  x
 81:     ST  3,-8(1)	Push parameter 
* TOFF dec:  -9
* Param end  output
 82:    LDA  1,-6(1)	Ghost frame becomes new active frame 
 83:    LDA  3,1(7)	Return address in ac 
 84:    JMP  7,-79(7)	call output
 85:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set:  -6
* EXPRESSION
* ASSIGN  =
 86:     ST  3,-2(1)	Store variable x
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
 87:    LDC  3,1(6)	Load integer constant 
* OP  +
 88:     LD  3,-2(1)	Load variable  x
 89:     ST  3,-7(1)	Push left side 
 90:     LD  4,-7(1)	Pop left into ac1 
 91:    ADD  3,4,3	Op + 
* END COMPOUND
* END COMPOUND
* Add standard closing in case there is no return statement
 92:    LDC  2,0(6)	Set return value to 0 
 93:     LD  3,-1(1)	Load return address 
 94:     LD  1,0(1)	Adjust frame pointer 
 95:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,95(7)	Jump to init [backpatch] 
* =========================================
* INIT
 96:    LDA  1,0(0)	Set first frame at end of globals 
 97:     ST  1,0(1)	Store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
 98:    LDA  3,1(7)	Return address in ac 
 99:    JMP  7,-61(7)	Jump to main 
100:   HALT  0,0(0)	DONE! 
* END INIT
