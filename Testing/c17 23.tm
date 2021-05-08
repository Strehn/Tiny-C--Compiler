* C- version: 1.00
* by Sydney Petrehn
* Input file: c17.c-
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
 40:    LDC  3,333(6)	Load integer constant 
 41:     ST  3,0(1)	Store variable (null)
* TOFF dec:  -3
* EXPRESSION
* EXPRESSION
* EXPRESSION
 42:    LDC  3,5(6)	Load integer constant 
* OP  (null)
* EXPRESSION
* EXPRESSION
* ASSIGN  =
 43:    LDC  3,444(6)	Load integer constant 
 44:     ST  3,0(1)	Store variable (null)
* TOFF dec:  -4
* EXPRESSION
* EXPRESSION
* EXPRESSION
 45:    LDC  3,7(6)	Load integer constant 
* OP  (null)
* EXPRESSION
* EXPRESSION
* ASSIGN  +=
 46:     ST  3,0(1)	Store variable (null)
* TOFF dec:  -5
* EXPRESSION
* EXPRESSION
* EXPRESSION
 47:    LDC  3,5(6)	Load integer constant 
* OP  (null)
* EXPRESSION
* EXPRESSION
* EXPRESSION
 48:    LDC  3,7(6)	Load integer constant 
* OP  (null)
* EXPRESSION
* CALL  output
 49:     ST  1,-5(1)	Store fp in ghost frame for  output
* TOFF dec:  -5
* EXPRESSION
* EXPRESSION
* EXPRESSION
 50:    LDC  3,5(6)	Load integer constant 
* OP  (null)
* Param 
 51:     ST  3,-7(1)	Push parameter 
* TOFF dec: 
* Param end  output
 52:    LDA  1,-5(1)	Ghost frame becomes new active frame 
 53:    LDA  3,1(7)	Return address in ac 
 54:    JMP  7,-49(7)	call output
 55:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set: 
* EXPRESSION
* ASSIGN  -=
 56:     ST  3,0(1)	Store variable (null)
* TOFF dec:  -6
* EXPRESSION
* EXPRESSION
* EXPRESSION
 57:    LDC  3,7(6)	Load integer constant 
* OP  (null)
* EXPRESSION
* EXPRESSION
* EXPRESSION
 58:    LDC  3,5(6)	Load integer constant 
* OP  (null)
* EXPRESSION
* CALL  output
 59:     ST  1,-6(1)	Store fp in ghost frame for  output
* TOFF dec:  -6
* EXPRESSION
* EXPRESSION
* EXPRESSION
 60:    LDC  3,7(6)	Load integer constant 
* OP  (null)
* Param 
 61:     ST  3,-8(1)	Push parameter 
* TOFF dec: 
* Param end  output
 62:    LDA  1,-6(1)	Ghost frame becomes new active frame 
 63:    LDA  3,1(7)	Return address in ac 
 64:    JMP  7,-59(7)	call output
 65:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set: 
* EXPRESSION
* CALL  outnl
 66:     ST  1,-6(1)	Store fp in ghost frame for  outnl
* TOFF dec:  -6
* Param end  outnl
 67:    LDA  1,-6(1)	Ghost frame becomes new active frame 
 68:    LDA  3,1(7)	Return address in ac 
 69:    JMP  7,-36(7)	call outnl
 70:    LDA  3,0(2)	save the result in ac 
* Call end  outnl
* TOFF set: 
* END COMPOUND
* Add standard closing in case there is no return statement
 71:    LDC  2,0(6)	Set return value to 0 
 72:     LD  3,-1(1)	Load return address 
 73:     LD  1,0(1)	Adjust frame pointer 
 74:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,74(7)	Jump to init [backpatch] 
* =========================================
* INIT
 75:    LDA  1,-28(0)	Set first frame at end of globals 
 76:     ST  1,0(1)	Store old fp (point to self) 
* INIT GLOBALS AND STATICS
 77:    LDC  3,7(6)	load size of array x
 78:     ST  3,-8(0)	save size of array x
 79:    LDC  3,9(6)	load size of array y
 80:     ST  3,-19(0)	save size of array y
* END INIT GLOBALS AND STATICS
 81:    LDA  3,1(7)	Return address in ac 
 82:    JMP  7,-44(7)	Jump to main 
 83:   HALT  0,0(0)	DONE! 
* END INIT
