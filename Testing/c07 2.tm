* C- version: 1.00
* by Sydney Petrehn
* Input file: c07.c-
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
* TOFF set: 
 39:     ST  3,-1(1)	store return address 
* COMPOUND
* TOFF set: 
* Compound body
* Var
* Var
* EXPRESSION
* ASSIGN  =
 40:    LDC  3,2(6)	Load integer constant 
 41:     ST  3,-3(1)	Push index 
 42:    LDC  3,1(6)	Load integer constant 
 43:     LD  4,-3(1)	Pop index 
 44:    LDA  5,-1(0)	Load address of base of array x
 45:    SUB  5,5,4	Compute offset of value 
 46:     ST  3,0(5)	Store variable x
* EXPRESSION
* EXPRESSION
* EXPRESSION
 47:    LDC  3,2(6)	Load integer constant 
* OP  (null)
* EXPRESSION
 48:    LDC  3,1(6)	Load integer constant 
* EXPRESSION
* ASSIGN  =
 49:    LDC  3,1(6)	Load integer constant 
 50:     ST  3,-3(1)	Push index 
 51:    LDC  3,0(6)	Load integer constant 
 52:     LD  4,-3(1)	Pop index 
 53:    LDA  5,-1(0)	Load address of base of array y
 54:    SUB  5,5,4	Compute offset of value 
 55:     ST  3,0(5)	Store variable y
* EXPRESSION
* EXPRESSION
* EXPRESSION
 56:    LDC  3,1(6)	Load integer constant 
* OP  (null)
* EXPRESSION
 57:    LDC  3,0(6)	Load integer constant 
* EXPRESSION
* CALL  outputb
 58:     ST  1,-3(1)	Store fp in ghost frame for  outputb
* TOFF dec: 
* TOFF dec: 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
 59:    LDC  3,2(6)	Load integer constant 
* OP  (null)
* EXPRESSION
* EXPRESSION
* EXPRESSION
 60:    LDC  3,1(6)	Load integer constant 
* OP  (null)
* OP  or
 61:     LD  4,-5(1)	Pop left into ac1 
 62:     OR  3,4,3	Op | 
* Param 
 63:     ST  3,-5(1)	Push parameter 
* TOFF dec: 
* Param end  outputb
 64:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 65:    LDA  3,1(7)	Return address in ac 
 66:    JMP  7,-50(7)	call outputb
 67:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set: 
* EXPRESSION
* CALL  outnl
 68:     ST  1,-3(1)	Store fp in ghost frame for  outnl
* TOFF dec: 
* TOFF dec: 
* Param end  outnl
 69:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 70:    LDA  3,1(7)	Return address in ac 
 71:    JMP  7,-38(7)	call outnl
 72:    LDA  3,0(2)	save the result in ac 
* Call end  outnl
* TOFF set: 
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
 77:    LDA  1,5(0)	Set first frame at end of globals 
 78:     ST  1,0(1)	Store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
 79:    LDA  3,1(7)	Return address in ac 
 80:    JMP  7,-42(7)	Jump to main 
 81:   HALT  0,0(0)	DONE! 
* END INIT
