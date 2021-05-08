* C- version: 1.00
* by Sydney Petrehn
* Input file: c08.c-
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
 40:    LDC  3,1(6)	Load integer constant 
 41:     ST  3,0(1)	Store variable (null)
* TOFF dec:  -3
* EXPRESSION
* EXPRESSION
* EXPRESSION
 42:    LDC  3,2(6)	Load integer constant 
* OP  (null)
* EXPRESSION
* EXPRESSION
* ASSIGN  =
 43:    LDC  3,0(6)	Load integer constant 
 44:     ST  3,0(1)	Store variable (null)
* TOFF dec:  -4
* EXPRESSION
* EXPRESSION
* EXPRESSION
 45:    LDC  3,1(6)	Load integer constant 
* OP  (null)
* EXPRESSION
* EXPRESSION
* CALL  outputb
 46:     ST  1,-4(1)	Store fp in ghost frame for  outputb
* TOFF dec:  -4
 47:    LDA  3,-1(0)	Load address of array x
 48:     ST  3,-6(1)	Push left side 
 49:    LDC  3,2(6)	Load integer constant 
 50:     LD  4,-6(1)	Pop left into ac1 
 51:    SUB  3,4,3	Compute location from index 
 52:     LD  3,0(3)	Load array element 
 53:     ST  3,0(5)	Push left side 
 54:    LDA  3,-5(0)	Load address of base of array (null)
 55:     ST  3,-6(1)	Push left side 
 56:    LDC  3,1(6)	Load integer constant 
 57:     LD  4,-6(1)	Pop left into ac1 
 58:    SUB  3,4,3	Compute location from index 
 59:     LD  3,0(3)	Load array element 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  (null)
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  (null)
* OP  or
 60:     LD  4,-6(1)	Pop left into ac1 
 61:     OR  3,4,3	Op | 
* Param 
 62:     ST  3,-6(1)	Push parameter 
* TOFF dec: 
* Param end  outputb
 63:    LDA  1,-4(1)	Ghost frame becomes new active frame 
 64:    LDA  3,1(7)	Return address in ac 
 65:    JMP  7,-49(7)	call outputb
 66:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set: 
* EXPRESSION
* CALL  outnl
 67:     ST  1,-4(1)	Store fp in ghost frame for  outnl
* TOFF dec:  -4
* Param end  outnl
 68:    LDA  1,-4(1)	Ghost frame becomes new active frame 
 69:    LDA  3,1(7)	Return address in ac 
 70:    JMP  7,-37(7)	call outnl
 71:    LDA  3,0(2)	save the result in ac 
* Call end  outnl
* TOFF set: 
* END COMPOUND
* Add standard closing in case there is no return statement
 72:    LDC  2,0(6)	Set return value to 0 
 73:     LD  3,-1(1)	Load return address 
 74:     LD  1,0(1)	Adjust frame pointer 
 75:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,75(7)	Jump to init [backpatch] 
* =========================================
* INIT
 76:    LDA  1,-9(0)	Set first frame at end of globals 
 77:     ST  1,0(1)	Store old fp (point to self) 
* INIT GLOBALS AND STATICS
 78:    LDC  3,3(6)	load size of array x
 79:     ST  3,-4(0)	save size of array x
 80:    LDC  3,4(6)	load size of array y
 81:     ST  3,-10(0)	save size of array y
* END INIT GLOBALS AND STATICS
 82:    LDA  3,1(7)	Return address in ac 
 83:    JMP  7,-45(7)	Jump to main 
 84:   HALT  0,0(0)	DONE! 
* END INIT
