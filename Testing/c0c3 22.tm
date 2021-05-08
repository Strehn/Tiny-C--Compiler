* C- version: 1.00
* by Sydney Petrehn
* Input file: c0c3.c-
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
* Var
* Var
* Var
* FUNCTION main
* TOFF set:  -2
 39:     ST  3,-1(1)	store return address 
* COMPOUND
* TOFF set:  -2
* Compound body
* EXPRESSION
* ASSIGN  =
 40:    LDC  3,65(6)	Load char constant 
 41:     ST  3,-2(0)	Store variable x
* EXPRESSION
* EXPRESSION
* EXPRESSION
* ASSIGN  =
 42:    LDC  3,66(6)	Load char constant 
 43:     ST  3,-3(0)	Store variable y
* EXPRESSION
* EXPRESSION
* EXPRESSION
* CALL  outputc
 44:     ST  1,-4(1)	Store fp in ghost frame for  outputc
* TOFF dec:  -5
* TOFF dec:  -6
* EXPRESSION
* Param 
 45:     LD  3,0(0)	Load variable  x
 46:     ST  3,-6(1)	Push parameter 
* TOFF dec: 
* Param end  outputc
 47:    LDA  1,-4(1)	Ghost frame becomes new active frame 
 48:    LDA  3,1(7)	Return address in ac 
 49:    JMP  7,-22(7)	call outputc
 50:    LDA  3,0(2)	save the result in ac 
* Call end  outputc
* TOFF set: 
* EXPRESSION
* CALL  outputc
 51:     ST  1,-4(1)	Store fp in ghost frame for  outputc
* TOFF dec:  -5
* TOFF dec:  -6
* EXPRESSION
* Param 
 52:     LD  3,-1(0)	Load variable  y
 53:     ST  3,-6(1)	Push parameter 
* TOFF dec: 
* Param end  outputc
 54:    LDA  1,-4(1)	Ghost frame becomes new active frame 
 55:    LDA  3,1(7)	Return address in ac 
 56:    JMP  7,-29(7)	call outputc
 57:    LDA  3,0(2)	save the result in ac 
* Call end  outputc
* TOFF set: 
* EXPRESSION
* CALL  outputc
 58:     ST  1,-4(1)	Store fp in ghost frame for  outputc
* TOFF dec:  -5
* TOFF dec:  -6
 59:     LD  3,-2(1)	Load variable z
 60:     ST  3,-6(1)	Push left side 
 61:     LD  3,0(1)	Load variable =
* EXPRESSION
* ASSIGN  =
 62:     ST  3,-6(0)	Store variable z
* EXPRESSION
* EXPRESSION
* ASSIGN  =
 63:     ST  3,-7(0)	Store variable x
* EXPRESSION
* EXPRESSION
* Param 
 64:     ST  3,-8(1)	Push parameter 
* TOFF dec: 
* Param end  outputc
 65:    LDA  1,-4(1)	Ghost frame becomes new active frame 
 66:    LDA  3,1(7)	Return address in ac 
 67:    JMP  7,-40(7)	call outputc
 68:    LDA  3,0(2)	save the result in ac 
* Call end  outputc
* TOFF set: 
* EXPRESSION
* CALL  outputc
 69:     ST  1,-4(1)	Store fp in ghost frame for  outputc
* TOFF dec:  -5
* TOFF dec:  -6
* EXPRESSION
* Param 
 70:     LD  3,0(0)	Load variable  x
 71:     ST  3,-6(1)	Push parameter 
* TOFF dec: 
* Param end  outputc
 72:    LDA  1,-4(1)	Ghost frame becomes new active frame 
 73:    LDA  3,1(7)	Return address in ac 
 74:    JMP  7,-47(7)	call outputc
 75:    LDA  3,0(2)	save the result in ac 
* Call end  outputc
* TOFF set: 
* EXPRESSION
* CALL  outputc
 76:     ST  1,-4(1)	Store fp in ghost frame for  outputc
* TOFF dec:  -5
* TOFF dec:  -6
* EXPRESSION
* Param 
 77:     LD  3,-1(0)	Load variable  y
 78:     ST  3,-6(1)	Push parameter 
* TOFF dec: 
* Param end  outputc
 79:    LDA  1,-4(1)	Ghost frame becomes new active frame 
 80:    LDA  3,1(7)	Return address in ac 
 81:    JMP  7,-54(7)	call outputc
 82:    LDA  3,0(2)	save the result in ac 
* Call end  outputc
* TOFF set: 
* EXPRESSION
* CALL  outputc
 83:     ST  1,-4(1)	Store fp in ghost frame for  outputc
* TOFF dec:  -5
* TOFF dec:  -6
* EXPRESSION
* Param 
 84:     LD  3,-2(0)	Load variable  z
 85:     ST  3,-6(1)	Push parameter 
* TOFF dec: 
* Param end  outputc
 86:    LDA  1,-4(1)	Ghost frame becomes new active frame 
 87:    LDA  3,1(7)	Return address in ac 
 88:    JMP  7,-61(7)	call outputc
 89:    LDA  3,0(2)	save the result in ac 
* Call end  outputc
* TOFF set: 
* EXPRESSION
* CALL  outnl
 90:     ST  1,-4(1)	Store fp in ghost frame for  outnl
* TOFF dec:  -5
* TOFF dec:  -6
* Param end  outnl
 91:    LDA  1,-4(1)	Ghost frame becomes new active frame 
 92:    LDA  3,1(7)	Return address in ac 
 93:    JMP  7,-60(7)	call outnl
 94:    LDA  3,0(2)	save the result in ac 
* Call end  outnl
* TOFF set: 
* END COMPOUND
* Add standard closing in case there is no return statement
 95:    LDC  2,0(6)	Set return value to 0 
 96:     LD  3,-1(1)	Load return address 
 97:     LD  1,0(1)	Adjust frame pointer 
 98:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,98(7)	Jump to init [backpatch] 
* =========================================
* INIT
 99:    LDA  1,-3(0)	Set first frame at end of globals 
100:     ST  1,0(1)	Store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
101:    LDA  3,1(7)	Return address in ac 
102:    JMP  7,-64(7)	Jump to main 
103:   HALT  0,0(0)	DONE! 
* END INIT
