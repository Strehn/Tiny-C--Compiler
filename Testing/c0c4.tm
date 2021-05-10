* C- version: 1.00
* by Sydney Petrehn
* Input file: c0c4.c-
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
* TOFF set:  -4
* Compound body
* Var
* Var
* Var
* EXPRESSION
* ASSIGN  =
 40:    LDC  3,65(6)	Load char constant 
 41:     ST  3,0(1)	Store variable x
* EXPRESSION
* EXPRESSION
* EXPRESSION
* ASSIGN  =
 42:    LDC  3,66(6)	Load char constant 
 43:     ST  3,0(1)	Store variable y
* EXPRESSION
* EXPRESSION
* EXPRESSION
* CALL  outputc
 44:     ST  1,-6(1)	Store fp in ghost frame for  outputc
* TOFF dec:  -7
* TOFF dec:  -8
* EXPRESSION
* Param  1
 45:     LD  3,0(1)	Load variable  x
 46:     ST  3,-8(1)	Push parameter 
* TOFF dec:  -9
* Param end  outputc
 47:    LDA  1,-6(1)	Ghost frame becomes new active frame 
 48:    LDA  3,1(7)	Return address in ac 
 49:    JMP  7,-22(7)	call outputc
 50:    LDA  3,0(2)	save the result in ac 
* Call end  outputc
* TOFF set:  -6
* EXPRESSION
* CALL  outputc
 51:     ST  1,-6(1)	Store fp in ghost frame for  outputc
* TOFF dec:  -7
* TOFF dec:  -8
* EXPRESSION
* Param  2
 52:     LD  3,0(1)	Load variable  y
 53:     ST  3,-8(1)	Push parameter 
* TOFF dec:  -9
* Param end  outputc
 54:    LDA  1,-6(1)	Ghost frame becomes new active frame 
 55:    LDA  3,1(7)	Return address in ac 
 56:    JMP  7,-29(7)	call outputc
 57:    LDA  3,0(2)	save the result in ac 
* Call end  outputc
* TOFF set:  -6
* EXPRESSION
* CALL  outputc
 58:     ST  1,-6(1)	Store fp in ghost frame for  outputc
* TOFF dec:  -7
* TOFF dec:  -8
* Here: 
 59:     LD  3,0(1)	Load variable  y
 60:     ST  3,0(1)	Store variable x
 61:     ST  3,0(1)	Store variable z
 62:     ST  3,-8(1)	Push parameter 
* EXPRESSION
* ASSIGN  =
* EXPRESSION
* EXPRESSION
* ASSIGN  =
* EXPRESSION
* EXPRESSION
* Param end  outputc
 63:    LDA  1,-6(1)	Ghost frame becomes new active frame 
 64:    LDA  3,1(7)	Return address in ac 
 65:    JMP  7,-38(7)	call outputc
 66:    LDA  3,0(2)	save the result in ac 
* Call end  outputc
* TOFF set:  -6
* EXPRESSION
* CALL  outputc
 67:     ST  1,-6(1)	Store fp in ghost frame for  outputc
* TOFF dec:  -7
* TOFF dec:  -8
* EXPRESSION
* Param  3
 68:     LD  3,0(1)	Load variable  x
 69:     ST  3,-8(1)	Push parameter 
* TOFF dec:  -9
* Param end  outputc
 70:    LDA  1,-6(1)	Ghost frame becomes new active frame 
 71:    LDA  3,1(7)	Return address in ac 
 72:    JMP  7,-45(7)	call outputc
 73:    LDA  3,0(2)	save the result in ac 
* Call end  outputc
* TOFF set:  -6
* EXPRESSION
* CALL  outputc
 74:     ST  1,-6(1)	Store fp in ghost frame for  outputc
* TOFF dec:  -7
* TOFF dec:  -8
* EXPRESSION
* Param  4
 75:     LD  3,0(1)	Load variable  y
 76:     ST  3,-8(1)	Push parameter 
* TOFF dec:  -9
* Param end  outputc
 77:    LDA  1,-6(1)	Ghost frame becomes new active frame 
 78:    LDA  3,1(7)	Return address in ac 
 79:    JMP  7,-52(7)	call outputc
 80:    LDA  3,0(2)	save the result in ac 
* Call end  outputc
* TOFF set:  -6
* EXPRESSION
* CALL  outputc
 81:     ST  1,-6(1)	Store fp in ghost frame for  outputc
* TOFF dec:  -7
* TOFF dec:  -8
* EXPRESSION
* Param  5
 82:     LD  3,0(1)	Load variable  z
 83:     ST  3,-8(1)	Push parameter 
* TOFF dec:  -9
* Param end  outputc
 84:    LDA  1,-6(1)	Ghost frame becomes new active frame 
 85:    LDA  3,1(7)	Return address in ac 
 86:    JMP  7,-59(7)	call outputc
 87:    LDA  3,0(2)	save the result in ac 
* Call end  outputc
* TOFF set:  -6
* EXPRESSION
* CALL  outnl
 88:     ST  1,-6(1)	Store fp in ghost frame for  outnl
* TOFF dec:  -7
* TOFF dec:  -8
* Param end  outnl
 89:    LDA  1,-6(1)	Ghost frame becomes new active frame 
 90:    LDA  3,1(7)	Return address in ac 
 91:    JMP  7,-58(7)	call outnl
 92:    LDA  3,0(2)	save the result in ac 
* Call end  outnl
* TOFF set:  -6
* END COMPOUND
* Add standard closing in case there is no return statement
 93:    LDC  2,0(6)	Set return value to 0 
 94:     LD  3,-1(1)	Load return address 
 95:     LD  1,0(1)	Adjust frame pointer 
 96:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,96(7)	Jump to init [backpatch] 
* =========================================
* INIT
 97:    LDA  1,-3(0)	Set first frame at end of globals 
 98:     ST  1,0(1)	Store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
 99:    LDA  3,1(7)	Return address in ac 
100:    JMP  7,-62(7)	Jump to main 
101:   HALT  0,0(0)	DONE! 
* END INIT
