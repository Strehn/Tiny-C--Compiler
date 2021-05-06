* C- version: 1.00
* by Sydney Petrehn
* Input file: c05.c-
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
* TOFF set: 
 39:     ST  3,-1(1)	store return address 
* COMPOUND
* TOFF set: 
* Compound body
* EXPRESSION
* ASSIGN  =
 40:    LDC  3,2(6)	Load integer constant 
 41:     ST  3,-3(1)	Push index 
 42:    LDC  3,73(6)	Load integer constant 
 43:     LD  4,-3(1)	Pop index 
 44:    LDA  5,-1(0)	Load address of base of array x
 45:    SUB  5,5,4	Compute offset of value 
 46:     ST  3,0(5)	Store variable x
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  (null)
* EXPRESSION
* EXPRESSION
* ASSIGN  =
 47:    LDC  3,1(6)	Load integer constant 
 48:     ST  3,-3(1)	Push index 
 49:    LDC  3,211(6)	Load integer constant 
 50:     LD  4,-3(1)	Pop index 
 51:    LDA  5,-1(0)	Load address of base of array y
 52:    SUB  5,5,4	Compute offset of value 
 53:     ST  3,0(5)	Store variable y
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  (null)
* EXPRESSION
* EXPRESSION
* CALL  output
 54:     ST  1,-3(1)	Store fp in ghost frame for  output
* TOFF dec: 
* TOFF dec: 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
 55:    LDC  3,2(6)	Load integer constant 
* OP  (null)
* EXPRESSION
* EXPRESSION
* EXPRESSION
 56:    LDC  3,1(6)	Load integer constant 
* OP  (null)
* OP  +
 57:     LD  4,-5(1)	Pop left into ac1 
 58:    ADD  3,4,3	Op + 
* Param 
 59:     ST  3,-5(1)	Push parameter 
* TOFF dec: 
* Param end  output
 60:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 61:    LDA  3,1(7)	Return address in ac 
 62:    JMP  7,-57(7)	call output
 63:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set: 
* EXPRESSION
* CALL  outnl
 64:     ST  1,-3(1)	Store fp in ghost frame for  outnl
* TOFF dec: 
* TOFF dec: 
* Param end  outnl
 65:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 66:    LDA  3,1(7)	Return address in ac 
 67:    JMP  7,-34(7)	call outnl
 68:    LDA  3,0(2)	save the result in ac 
* Call end  outnl
* TOFF set: 
* END COMPOUND
* Add standard closing in case there is no return statement
 69:    LDC  2,0(6)	Set return value to 0 
 70:     LD  3,-1(1)	Load return address 
 71:     LD  1,0(1)	Adjust frame pointer 
 72:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,72(7)	Jump to init [backpatch] 
* =========================================
* INIT
 73:    LDA  1,-15(0)	Set first frame at end of globals 
 74:     ST  1,0(1)	Store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
 75:    LDA  3,1(7)	Return address in ac 
 76:    JMP  7,-38(7)	Jump to main 
 77:   HALT  0,0(0)	DONE! 
* END INIT
