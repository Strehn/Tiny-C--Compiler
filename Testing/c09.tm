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
* TOFF set:  -4
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
 44:     LD  3,-1(0)	Load variable  y
 45:     LD  4,0(0)	Load lhs variable  x
 46:    ADD  3,4,3	Op += 
 47:     ST  3,-6(1)	Push parameter 
 48:     ST  3,0(0)	Store variable x
* EXPRESSION
* EXPRESSION
* EXPRESSION
* CALL  output
 49:     ST  1,-7(1)	Store fp in ghost frame for  output
* TOFF dec:  -8
* TOFF dec:  -9
* EXPRESSION
* Param  1
 50:     LD  3,0(0)	Load variable  x
 51:     ST  3,-9(1)	Push parameter 
* TOFF dec:  -10
* Param end  output
 52:    LDA  1,-7(1)	Ghost frame becomes new active frame 
 53:    LDA  3,1(7)	Return address in ac 
 54:    JMP  7,-49(7)	call output
 55:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set:  -7
* EXPRESSION
* ASSIGN  -=
 56:     LD  3,0(0)	Load variable  x
 57:     LD  4,-1(0)	Load lhs variable  y
 58:    SUB  3,4,3	Op -= 
 59:     ST  3,-7(1)	Push parameter 
 60:     ST  3,-1(0)	Store variable y
* EXPRESSION
* EXPRESSION
* EXPRESSION
* CALL  output
 61:     ST  1,-8(1)	Store fp in ghost frame for  output
* TOFF dec:  -9
* TOFF dec:  -10
* EXPRESSION
* Param  2
 62:     LD  3,-1(0)	Load variable  y
 63:     ST  3,-10(1)	Push parameter 
* TOFF dec:  -11
* Param end  output
 64:    LDA  1,-8(1)	Ghost frame becomes new active frame 
 65:    LDA  3,1(7)	Return address in ac 
 66:    JMP  7,-61(7)	call output
 67:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set:  -8
* EXPRESSION
* CALL  outnl
 68:     ST  1,-8(1)	Store fp in ghost frame for  outnl
* TOFF dec:  -9
* TOFF dec:  -10
* Param end  outnl
 69:    LDA  1,-8(1)	Ghost frame becomes new active frame 
 70:    LDA  3,1(7)	Return address in ac 
 71:    JMP  7,-38(7)	call outnl
 72:    LDA  3,0(2)	save the result in ac 
* Call end  outnl
* TOFF set:  -8
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
 77:    LDA  1,-2(0)	Set first frame at end of globals 
 78:     ST  1,0(1)	Store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
 79:    LDA  3,1(7)	Return address in ac 
 80:    JMP  7,-42(7)	Jump to main 
 81:   HALT  0,0(0)	DONE! 
* END INIT
