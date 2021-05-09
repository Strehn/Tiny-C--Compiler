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
* TOFF dec: 
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
* TOFF dec: 
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
 59:     LD  3,-4(0)	Load variable z
 60:     ST  3,-12(1)	Push left side 
 61:     LD  3,0(0)	Load variable =
* EXPRESSION
* ASSIGN  =
 62:     ST  3,-4(1)	Store variable z
* EXPRESSION
* EXPRESSION
* ASSIGN  =
 63:     LD  3,-3(0)	Load variable  y
 64:     LD  4,-2(0)	Load lhs variable  x
 65:     ST  3,-2(1)	Store variable x
* EXPRESSION
* EXPRESSION
* Param 
 66:     ST  3,-14(1)	Push parameter 
* TOFF dec: 
* Param end  outputc
 67:    LDA  1,-10(1)	Ghost frame becomes new active frame 
 68:    LDA  3,1(7)	Return address in ac 
 69:    JMP  7,-42(7)	call outputc
 70:    LDA  3,0(2)	save the result in ac 
* Call end  outputc
* TOFF set: 
* EXPRESSION
* CALL  outputc
 71:     ST  1,-10(1)	Store fp in ghost frame for  outputc
* TOFF dec:  -11
* TOFF dec:  -12
* EXPRESSION
* Param 
 72:     LD  3,-2(1)	Load variable  x
 73:     ST  3,-12(1)	Push parameter 
* TOFF dec: 
* Param end  outputc
 74:    LDA  1,-10(1)	Ghost frame becomes new active frame 
 75:    LDA  3,1(7)	Return address in ac 
 76:    JMP  7,-49(7)	call outputc
 77:    LDA  3,0(2)	save the result in ac 
* Call end  outputc
* TOFF set: 
* EXPRESSION
* CALL  outputc
 78:     ST  1,-10(1)	Store fp in ghost frame for  outputc
* TOFF dec:  -11
* TOFF dec:  -12
* EXPRESSION
* Param 
 79:     LD  3,-3(1)	Load variable  y
 80:     ST  3,-12(1)	Push parameter 
* TOFF dec: 
* Param end  outputc
 81:    LDA  1,-10(1)	Ghost frame becomes new active frame 
 82:    LDA  3,1(7)	Return address in ac 
 83:    JMP  7,-56(7)	call outputc
 84:    LDA  3,0(2)	save the result in ac 
* Call end  outputc
* TOFF set: 
* EXPRESSION
* CALL  outputc
 85:     ST  1,-10(1)	Store fp in ghost frame for  outputc
* TOFF dec:  -11
* TOFF dec:  -12
* EXPRESSION
* Param 
 86:     LD  3,-4(1)	Load variable  z
 87:     ST  3,-12(1)	Push parameter 
* TOFF dec: 
* Param end  outputc
 88:    LDA  1,-10(1)	Ghost frame becomes new active frame 
 89:    LDA  3,1(7)	Return address in ac 
 90:    JMP  7,-63(7)	call outputc
 91:    LDA  3,0(2)	save the result in ac 
* Call end  outputc
* TOFF set: 
* EXPRESSION
* CALL  outnl
 92:     ST  1,-10(1)	Store fp in ghost frame for  outnl
* TOFF dec:  -11
* TOFF dec:  -12
* Param end  outnl
 93:    LDA  1,-10(1)	Ghost frame becomes new active frame 
 94:    LDA  3,1(7)	Return address in ac 
 95:    JMP  7,-62(7)	call outnl
 96:    LDA  3,0(2)	save the result in ac 
* Call end  outnl
* TOFF set: 
* END COMPOUND
* Add standard closing in case there is no return statement
 97:    LDC  2,0(6)	Set return value to 0 
 98:     LD  3,-1(1)	Load return address 
 99:     LD  1,0(1)	Adjust frame pointer 
100:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,100(7)	Jump to init [backpatch] 
* =========================================
* INIT
101:    LDA  1,0(0)	Set first frame at end of globals 
102:     ST  1,0(1)	Store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
103:    LDA  3,1(7)	Return address in ac 
104:    JMP  7,-66(7)	Jump to main 
105:   HALT  0,0(0)	DONE! 
* END INIT
