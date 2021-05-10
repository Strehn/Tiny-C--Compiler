* C- version: 1.00
* by Sydney Petrehn
* Input file: f0b.c-
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
* FUNCTION cat
* TOFF set:  -2
 39:     ST  3,-1(1)	store return address 
* COMPOUND
* TOFF set:  -4
* Compound body
* EXPRESSION
* CALL  output
 40:     ST  1,-2(1)	Store fp in ghost frame for  output
* TOFF dec:  -3
* TOFF dec:  -4
* EXPRESSION
* Param  1
 41:     LD  3,0(0)	Load variable  z
 42:     ST  3,-4(1)	Push parameter 
* TOFF dec:  -5
* Param end  output
 43:    LDA  1,-2(1)	Ghost frame becomes new active frame 
 44:    LDA  3,1(7)	Return address in ac 
 45:    JMP  7,6(7)	call output
 46:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set:  -2
* EXPRESSION
* ASSIGN  =
 47:    LDC  3,99(6)	Load integer constant 
 48:     ST  3,0(0)	Store variable z
* EXPRESSION
* EXPRESSION
* END COMPOUND
* Add standard closing in case there is no return statement
 49:    LDC  2,0(6)	Set return value to 0 
 50:     LD  3,-1(1)	Load return address 
 51:     LD  1,0(1)	Adjust frame pointer 
 52:    JMP  7,0(3)	Return 
* END FUNCTION cat
* FUNCTION main
* TOFF set:  -2
 53:     ST  3,-1(1)	store return address 
* COMPOUND
* TOFF set:  -4
* Compound body
* EXPRESSION
* ASSIGN  =
 54:    LDC  3,1001(6)	Load integer constant 
 55:     ST  3,0(0)	Store variable z
* EXPRESSION
* EXPRESSION
* EXPRESSION
* CALL  cat
 56:     ST  1,-5(1)	Store fp in ghost frame for  cat
* TOFF dec:  -6
* TOFF dec:  -7
* Param end  cat
 57:    LDA  1,-5(1)	Ghost frame becomes new active frame 
 58:    LDA  3,1(7)	Return address in ac 
 59:    JMP  7,38(7)	call cat
 60:    LDA  3,0(2)	save the result in ac 
* Call end  cat
* TOFF set:  -5
* EXPRESSION
* CALL  output
 61:     ST  1,-5(1)	Store fp in ghost frame for  output
* TOFF dec:  -6
* TOFF dec:  -7
* EXPRESSION
* Param  2
 62:     LD  3,0(0)	Load variable  z
 63:     ST  3,-7(1)	Push parameter 
* TOFF dec:  -8
* Param end  output
 64:    LDA  1,-5(1)	Ghost frame becomes new active frame 
 65:    LDA  3,1(7)	Return address in ac 
 66:    JMP  7,6(7)	call output
 67:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set:  -5
* EXPRESSION
* CALL  outnl
 68:     ST  1,-5(1)	Store fp in ghost frame for  outnl
* TOFF dec:  -6
* TOFF dec:  -7
* Param end  outnl
 69:    LDA  1,-5(1)	Ghost frame becomes new active frame 
 70:    LDA  3,1(7)	Return address in ac 
 71:    JMP  7,34(7)	call outnl
 72:    LDA  3,0(2)	save the result in ac 
* Call end  outnl
* TOFF set:  -5
* END COMPOUND
* Add standard closing in case there is no return statement
 73:    LDC  2,0(6)	Set return value to 0 
 74:     LD  3,-1(1)	Load return address 
 75:     LD  1,0(1)	Adjust frame pointer 
 76:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,76(7)	Jump to init [backpatch] 
* =========================================
* INIT
 77:    LDA  1,-1(0)	Set first frame at end of globals 
 78:     ST  1,0(1)	Store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
 79:    LDA  3,1(7)	Return address in ac 
 80:    JMP  7,-28(7)	Jump to main 
 81:   HALT  0,0(0)	DONE! 
* END INIT
