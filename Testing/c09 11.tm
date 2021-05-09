* C- version: 1.00
* by Sydney Petrehn
* Input file: c09.c-
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
* FUNCTION main
* TOFF set:  -2
 39:     ST  3,-1(1)	store return address 
* COMPOUND
* TOFF set:  -2
* Compound body
* EXPRESSION
* ASSIGN  =
 40:    LDC  3,753(6)	Load integer constant 
 41:     ST  3,0(0)	Store variable x
* EXPRESSION
* EXPRESSION
* EXPRESSION
* ASSIGN  =
 42:    LDC  3,444(6)	Load integer constant 
 43:     ST  3,-1(0)	Store variable y
* EXPRESSION
* EXPRESSION
* EXPRESSION
* ASSIGN  +=
 44:     ST  3,0(0)	Store variable x
* EXPRESSION
* EXPRESSION
* EXPRESSION
* CALL  output
 45:     ST  1,-5(1)	Store fp in ghost frame for  output
* TOFF dec:  -6
* TOFF dec:  -7
* EXPRESSION
* Param 
 46:     LD  3,0(0)	Load variable  x
 47:     ST  3,-7(1)	Push parameter 
* TOFF dec: 
* Param end  output
 48:    LDA  1,-5(1)	Ghost frame becomes new active frame 
 49:    LDA  3,1(7)	Return address in ac 
 50:    JMP  7,-45(7)	call output
 51:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set: 
* EXPRESSION
* ASSIGN  -=
 52:     ST  3,-1(0)	Store variable y
* EXPRESSION
* EXPRESSION
* EXPRESSION
* CALL  output
 53:     ST  1,-6(1)	Store fp in ghost frame for  output
* TOFF dec:  -7
* TOFF dec:  -8
* EXPRESSION
* Param 
 54:     LD  3,-1(0)	Load variable  y
 55:     ST  3,-8(1)	Push parameter 
* TOFF dec: 
* Param end  output
 56:    LDA  1,-6(1)	Ghost frame becomes new active frame 
 57:    LDA  3,1(7)	Return address in ac 
 58:    JMP  7,-53(7)	call output
 59:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set: 
* EXPRESSION
* CALL  outnl
 60:     ST  1,-6(1)	Store fp in ghost frame for  outnl
* TOFF dec:  -7
* TOFF dec:  -8
* Param end  outnl
 61:    LDA  1,-6(1)	Ghost frame becomes new active frame 
 62:    LDA  3,1(7)	Return address in ac 
 63:    JMP  7,-30(7)	call outnl
 64:    LDA  3,0(2)	save the result in ac 
* Call end  outnl
* TOFF set: 
* END COMPOUND
* Add standard closing in case there is no return statement
 65:    LDC  2,0(6)	Set return value to 0 
 66:     LD  3,-1(1)	Load return address 
 67:     LD  1,0(1)	Adjust frame pointer 
 68:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,68(7)	Jump to init [backpatch] 
* =========================================
* INIT
 69:    LDA  1,-2(0)	Set first frame at end of globals 
 70:     ST  1,0(1)	Store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
 71:    LDA  3,1(7)	Return address in ac 
 72:    JMP  7,-34(7)	Jump to main 
 73:   HALT  0,0(0)	DONE! 
* END INIT