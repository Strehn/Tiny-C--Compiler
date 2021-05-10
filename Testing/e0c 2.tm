* C- version: 1.00
* by Sydney Petrehn
* Input file: e0c.c-
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
* TOFF set:  -6
* Compound body
* Var
* Var
* EXPRESSION
* ASSIGN  =
 40:    LDC  3,0(6)	Load integer constant 
 41:     ST  3,-2(1)	Store variable x
* EXPRESSION
* EXPRESSION
* While
* EXPRESSION
* EXPRESSION
* EXPRESSION
 42:    LDC  3,6(6)	Load integer constant 
* OP  <
 43:     LD  4,-9(1)	Pop left into ac1 
 44:    TLT  3,4,3	Op < 
* COMPOUND
* TOFF set:  -7
* Compound body
* EXPRESSION
* ASSIGN  =
 45:    LDC  3,0(6)	Load integer constant 
 46:     ST  3,-3(1)	Store variable y
* EXPRESSION
* EXPRESSION
* While
* EXPRESSION
* EXPRESSION
* EXPRESSION
 47:    LDC  3,6(6)	Load integer constant 
* OP  <
 48:     LD  4,-8(1)	Pop left into ac1 
 49:    TLT  3,4,3	Op < 
* COMPOUND
* TOFF set:  -8
* Compound body
* EXPRESSION
* CALL  output
 50:     ST  1,-8(1)	Store fp in ghost frame for  output
* TOFF dec:  -9
* TOFF dec:  -10
* EXPRESSION
* Param  1
 51:     LD  3,-3(1)	Load variable  y
 52:     ST  3,-10(1)	Push parameter 
* TOFF dec:  -11
* Param end  output
 53:    LDA  1,-8(1)	Ghost frame becomes new active frame 
 54:    LDA  3,1(7)	Return address in ac 
 55:    JMP  7,-50(7)	call output
 56:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set:  -8
* EXPRESSION
* ASSIGN  =
 57:     ST  3,-3(1)	Store variable y
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
 58:    LDC  3,1(6)	Load integer constant 
* OP  +
 59:     LD  3,-3(1)	Load variable  y
 60:     ST  3,-9(1)	Push left side 
 61:     LD  4,-9(1)	Pop left into ac1 
 62:    ADD  3,4,3	Op + 
* END COMPOUND
* EXPRESSION
* CALL  outnl
 63:     ST  1,-9(1)	Store fp in ghost frame for  outnl
* TOFF dec:  -10
* TOFF dec:  -11
* Param end  outnl
 64:    LDA  1,-9(1)	Ghost frame becomes new active frame 
 65:    LDA  3,1(7)	Return address in ac 
 66:    JMP  7,-33(7)	call outnl
 67:    LDA  3,0(2)	save the result in ac 
* Call end  outnl
* TOFF set:  -9
* EXPRESSION
* CALL  output
 68:     ST  1,-9(1)	Store fp in ghost frame for  output
* TOFF dec:  -10
* TOFF dec:  -11
* EXPRESSION
* Param  2
 69:     LD  3,-2(1)	Load variable  x
 70:     ST  3,-11(1)	Push parameter 
* TOFF dec:  -12
* Param end  output
 71:    LDA  1,-9(1)	Ghost frame becomes new active frame 
 72:    LDA  3,1(7)	Return address in ac 
 73:    JMP  7,-68(7)	call output
 74:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set:  -9
* EXPRESSION
* CALL  outnl
 75:     ST  1,-9(1)	Store fp in ghost frame for  outnl
* TOFF dec:  -10
* TOFF dec:  -11
* Param end  outnl
 76:    LDA  1,-9(1)	Ghost frame becomes new active frame 
 77:    LDA  3,1(7)	Return address in ac 
 78:    JMP  7,-45(7)	call outnl
 79:    LDA  3,0(2)	save the result in ac 
* Call end  outnl
* TOFF set:  -9
* EXPRESSION
* ASSIGN  =
 80:     ST  3,-2(1)	Store variable x
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
 81:    LDC  3,1(6)	Load integer constant 
* OP  +
 82:     LD  3,-2(1)	Load variable  x
 83:     ST  3,-10(1)	Push left side 
 84:     LD  4,-10(1)	Pop left into ac1 
 85:    ADD  3,4,3	Op + 
* END COMPOUND
* END COMPOUND
* Add standard closing in case there is no return statement
 86:    LDC  2,0(6)	Set return value to 0 
 87:     LD  3,-1(1)	Load return address 
 88:     LD  1,0(1)	Adjust frame pointer 
 89:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,89(7)	Jump to init [backpatch] 
* =========================================
* INIT
 90:    LDA  1,0(0)	Set first frame at end of globals 
 91:     ST  1,0(1)	Store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
 92:    LDA  3,1(7)	Return address in ac 
 93:    JMP  7,-55(7)	Jump to main 
 94:   HALT  0,0(0)	DONE! 
* END INIT
