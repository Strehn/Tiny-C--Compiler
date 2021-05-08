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
 41:     ST  3,0(0)	Store variable x
* TOFF dec:  -3
* EXPRESSION
* EXPRESSION
* EXPRESSION
* ASSIGN  =
 42:    LDC  3,66(6)	Load char constant 
 43:     ST  3,-1(0)	Store variable y
* TOFF dec:  -4
* EXPRESSION
* EXPRESSION
* EXPRESSION
* CALL  outputc
 44:     ST  1,-4(1)	Store fp in ghost frame for  outputc
* TOFF dec:  -3
* TOFF dec:  -4
* EXPRESSION
* Param 
 45:     LD  3,0(0)	Load variable  x
 46:     ST  3,-4(1)	Push parameter 
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
* TOFF dec:  -3
* TOFF dec:  -4
* EXPRESSION
* Param 
 52:     LD  3,-1(0)	Load variable  y
 53:     ST  3,-4(1)	Push parameter 
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
* TOFF dec:  -3
* TOFF dec:  -4
* EXPRESSION
* ASSIGN  =
 59:     ST  3,-2(0)	Store variable z
* TOFF dec:  -5
* EXPRESSION
* EXPRESSION
* ASSIGN  =
 60:     ST  3,0(0)	Store variable x
* TOFF dec:  -6
* EXPRESSION
* EXPRESSION
* Param 
 61:     ST  3,-6(1)	Push parameter 
* TOFF dec: 
* Param end  outputc
 62:    LDA  1,-4(1)	Ghost frame becomes new active frame 
 63:    LDA  3,1(7)	Return address in ac 
 64:    JMP  7,-37(7)	call outputc
 65:    LDA  3,0(2)	save the result in ac 
* Call end  outputc
* TOFF set: 
* EXPRESSION
* CALL  outputc
 66:     ST  1,-4(1)	Store fp in ghost frame for  outputc
* TOFF dec:  -3
* TOFF dec:  -4
* EXPRESSION
* Param 
 67:     LD  3,0(0)	Load variable  x
 68:     ST  3,-4(1)	Push parameter 
* TOFF dec: 
* Param end  outputc
 69:    LDA  1,-4(1)	Ghost frame becomes new active frame 
 70:    LDA  3,1(7)	Return address in ac 
 71:    JMP  7,-44(7)	call outputc
 72:    LDA  3,0(2)	save the result in ac 
* Call end  outputc
* TOFF set: 
* EXPRESSION
* CALL  outputc
 73:     ST  1,-4(1)	Store fp in ghost frame for  outputc
* TOFF dec:  -3
* TOFF dec:  -4
* EXPRESSION
* Param 
 74:     LD  3,-1(0)	Load variable  y
 75:     ST  3,-4(1)	Push parameter 
* TOFF dec: 
* Param end  outputc
 76:    LDA  1,-4(1)	Ghost frame becomes new active frame 
 77:    LDA  3,1(7)	Return address in ac 
 78:    JMP  7,-51(7)	call outputc
 79:    LDA  3,0(2)	save the result in ac 
* Call end  outputc
* TOFF set: 
* EXPRESSION
* CALL  outputc
 80:     ST  1,-4(1)	Store fp in ghost frame for  outputc
* TOFF dec:  -3
* TOFF dec:  -4
* EXPRESSION
* Param 
 81:     LD  3,-2(0)	Load variable  z
 82:     ST  3,-4(1)	Push parameter 
* TOFF dec: 
* Param end  outputc
 83:    LDA  1,-4(1)	Ghost frame becomes new active frame 
 84:    LDA  3,1(7)	Return address in ac 
 85:    JMP  7,-58(7)	call outputc
 86:    LDA  3,0(2)	save the result in ac 
* Call end  outputc
* TOFF set: 
* EXPRESSION
* CALL  outnl
 87:     ST  1,-4(1)	Store fp in ghost frame for  outnl
* TOFF dec:  -3
* TOFF dec:  -4
* Param end  outnl
 88:    LDA  1,-4(1)	Ghost frame becomes new active frame 
 89:    LDA  3,1(7)	Return address in ac 
 90:    JMP  7,-57(7)	call outnl
 91:    LDA  3,0(2)	save the result in ac 
* Call end  outnl
* TOFF set: 
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
