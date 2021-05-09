* C- version: 1.00
* by Sydney Petrehn
* Input file: c0c2.c-
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
* Var
* Var
* EXPRESSION
* ASSIGN  =
 40:    LDC  3,65(6)	Load char constant 
 41:     ST  3,-2(1)	Store variable x
* EXPRESSION
* EXPRESSION
* EXPRESSION
* ASSIGN  =
 42:    LDC  3,66(6)	Load char constant 
 43:     ST  3,-3(1)	Store variable y
* EXPRESSION
* EXPRESSION
* EXPRESSION
* CALL  outputc
 44:     ST  1,-10(1)	Store fp in ghost frame for  outputc
* TOFF dec:  -11
* TOFF dec:  -12
* EXPRESSION
* Param 
 45:     LD  3,-2(1)	Load variable  x
 46:     ST  3,-12(1)	Push parameter 
* TOFF dec:  -11
* Param end  outputc
 47:    LDA  1,-10(1)	Ghost frame becomes new active frame 
 48:    LDA  3,1(7)	Return address in ac 
 49:    JMP  7,-22(7)	call outputc
 50:    LDA  3,0(2)	save the result in ac 
* Call end  outputc
* TOFF set: 
* EXPRESSION
* CALL  outputc
 51:     ST  1,-10(1)	Store fp in ghost frame for  outputc
* TOFF dec:  -11
* TOFF dec:  -12
* EXPRESSION
* Param 
 52:     LD  3,-3(1)	Load variable  y
 53:     ST  3,-12(1)	Push parameter 
* TOFF dec:  -11
* Param end  outputc
 54:    LDA  1,-10(1)	Ghost frame becomes new active frame 
 55:    LDA  3,1(7)	Return address in ac 
 56:    JMP  7,-29(7)	call outputc
 57:    LDA  3,0(2)	save the result in ac 
* Call end  outputc
* TOFF set: 
* EXPRESSION
* CALL  outputc
 58:     ST  1,-10(1)	Store fp in ghost frame for  outputc
* TOFF dec:  -11
* TOFF dec:  -12
* EXPRESSION
* ASSIGN  =
 59:     ST  3,-4(1)	Store variable z
* EXPRESSION
* EXPRESSION
* ASSIGN  =
 60:     LD  3,-3(0)	Load variable  y
 61:     LD  4,-2(0)	Load lhs variable  x
 62:     ST  3,-2(1)	Store variable x
* EXPRESSION
* EXPRESSION
* Param 
 63:     ST  3,-14(1)	Push parameter 
* TOFF dec:  -13
* Param end  outputc
 64:    LDA  1,-10(1)	Ghost frame becomes new active frame 
 65:    LDA  3,1(7)	Return address in ac 
 66:    JMP  7,-39(7)	call outputc
 67:    LDA  3,0(2)	save the result in ac 
* Call end  outputc
* TOFF set: 
* EXPRESSION
* CALL  outputc
 68:     ST  1,-10(1)	Store fp in ghost frame for  outputc
* TOFF dec:  -11
* TOFF dec:  -12
* EXPRESSION
* Param 
 69:     LD  3,-2(1)	Load variable  x
 70:     ST  3,-12(1)	Push parameter 
* TOFF dec:  -11
* Param end  outputc
 71:    LDA  1,-10(1)	Ghost frame becomes new active frame 
 72:    LDA  3,1(7)	Return address in ac 
 73:    JMP  7,-46(7)	call outputc
 74:    LDA  3,0(2)	save the result in ac 
* Call end  outputc
* TOFF set: 
* EXPRESSION
* CALL  outputc
 75:     ST  1,-10(1)	Store fp in ghost frame for  outputc
* TOFF dec:  -11
* TOFF dec:  -12
* EXPRESSION
* Param 
 76:     LD  3,-3(1)	Load variable  y
 77:     ST  3,-12(1)	Push parameter 
* TOFF dec:  -11
* Param end  outputc
 78:    LDA  1,-10(1)	Ghost frame becomes new active frame 
 79:    LDA  3,1(7)	Return address in ac 
 80:    JMP  7,-53(7)	call outputc
 81:    LDA  3,0(2)	save the result in ac 
* Call end  outputc
* TOFF set: 
* EXPRESSION
* CALL  outputc
 82:     ST  1,-10(1)	Store fp in ghost frame for  outputc
* TOFF dec:  -11
* TOFF dec:  -12
* EXPRESSION
* Param 
 83:     LD  3,-4(1)	Load variable  z
 84:     ST  3,-12(1)	Push parameter 
* TOFF dec:  -11
* Param end  outputc
 85:    LDA  1,-10(1)	Ghost frame becomes new active frame 
 86:    LDA  3,1(7)	Return address in ac 
 87:    JMP  7,-60(7)	call outputc
 88:    LDA  3,0(2)	save the result in ac 
* Call end  outputc
* TOFF set: 
* EXPRESSION
* CALL  outnl
 89:     ST  1,-10(1)	Store fp in ghost frame for  outnl
* TOFF dec:  -11
* TOFF dec:  -12
* Param end  outnl
 90:    LDA  1,-10(1)	Ghost frame becomes new active frame 
 91:    LDA  3,1(7)	Return address in ac 
 92:    JMP  7,-59(7)	call outnl
 93:    LDA  3,0(2)	save the result in ac 
* Call end  outnl
* TOFF set: 
* END COMPOUND
* Add standard closing in case there is no return statement
 94:    LDC  2,0(6)	Set return value to 0 
 95:     LD  3,-1(1)	Load return address 
 96:     LD  1,0(1)	Adjust frame pointer 
 97:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,97(7)	Jump to init [backpatch] 
* =========================================
* INIT
 98:    LDA  1,0(0)	Set first frame at end of globals 
 99:     ST  1,0(1)	Store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
100:    LDA  3,1(7)	Return address in ac 
101:    JMP  7,-63(7)	Jump to main 
102:   HALT  0,0(0)	DONE! 
* END INIT
