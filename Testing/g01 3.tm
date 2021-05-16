* C- version: 1.00
* by Sydney Petrehn
* Input file: g01.c-
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
* FUNCTION cat
* TOFF set:  -2
 39:     ST  3,-1(1)	store return address 
* PARM
* COMPOUND
* TOFF set:  -5
* Compound body
* EXPRESSION
* CALL  output
 40:     ST  1,-5(1)	Store fp in ghost frame for  output
* TOFF dec:  -6
* TOFF dec:  -7
* EXPRESSION
* Param  1
 41:     LD  3,0(1)	Load variable  z
 42:     ST  3,-7(1)	Push parameter 
* TOFF dec:  -8
* Param end  output
 43:    LDA  1,-5(1)	Ghost frame becomes new active frame 
 44:    LDA  3,1(7)	Return address in ac 
 45:    JMP  7,-40(7)	call output
 46:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set:  -5
* EXPRESSION
* ASSIGN  =
 47:    LDC  3,122(6)	Load integer constant 
 48:     ST  3,0(1)	Store variable z
* EXPRESSION
* EXPRESSION
* EXPRESSION
* CALL  output
 49:     ST  1,-6(1)	Store fp in ghost frame for  output
* TOFF dec:  -7
* TOFF dec:  -8
* EXPRESSION
* Param  2
 50:     LD  3,0(1)	Load variable  z
 51:     ST  3,-8(1)	Push parameter 
* TOFF dec:  -9
* Param end  output
 52:    LDA  1,-6(1)	Ghost frame becomes new active frame 
 53:    LDA  3,1(7)	Return address in ac 
 54:    JMP  7,-49(7)	call output
 55:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set:  -6
* END COMPOUND
* Add standard closing in case there is no return statement
 56:    LDC  2,0(6)	Set return value to 0 
 57:     LD  3,-1(1)	Load return address 
 58:     LD  1,0(1)	Adjust frame pointer 
 59:    JMP  7,0(3)	Return 
* END FUNCTION cat
* FUNCTION main
* TOFF set:  -2
 60:     ST  3,-1(1)	store return address 
* COMPOUND
* TOFF set:  -5
* Compound body
* Var
* EXPRESSION
* ASSIGN  =
 61:    LDC  3,637(6)	Load integer constant 
 62:     ST  3,-2(1)	Store variable z
* EXPRESSION
* EXPRESSION
* EXPRESSION
* CALL  cat
 63:     ST  1,-7(1)	Store fp in ghost frame for  cat
* TOFF dec:  -8
* TOFF dec:  -9
* EXPRESSION
* Param  3
 64:     LD  3,-2(1)	Load variable  z
 65:     ST  3,-9(1)	Push parameter 
* TOFF dec:  -10
* Param end  cat
 66:    LDA  1,-7(1)	Ghost frame becomes new active frame 
 67:    LDA  3,1(7)	Return address in ac 
 68:    JMP  7,-30(7)	call cat
 69:    LDA  3,0(2)	save the result in ac 
* Call end  cat
* TOFF set:  -7
* EXPRESSION
* CALL  output
 70:     ST  1,-7(1)	Store fp in ghost frame for  output
* TOFF dec:  -8
* TOFF dec:  -9
* EXPRESSION
* Param  4
 71:     LD  3,-2(1)	Load variable  z
 72:     ST  3,-9(1)	Push parameter 
* TOFF dec:  -10
* Param end  output
 73:    LDA  1,-7(1)	Ghost frame becomes new active frame 
 74:    LDA  3,1(7)	Return address in ac 
 75:    JMP  7,-70(7)	call output
 76:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set:  -7
* END COMPOUND
* Add standard closing in case there is no return statement
 77:    LDC  2,0(6)	Set return value to 0 
 78:     LD  3,-1(1)	Load return address 
 79:     LD  1,0(1)	Adjust frame pointer 
 80:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,80(7)	Jump to init [backpatch] 
* =========================================
* INIT
 81:    LDA  1,0(0)	Set first frame at end of globals 
 82:     ST  1,0(1)	Store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
 83:    LDA  3,1(7)	Return address in ac 
 84:    JMP  7,-25(7)	Jump to main 
 85:   HALT  0,0(0)	DONE! 
* END INIT
