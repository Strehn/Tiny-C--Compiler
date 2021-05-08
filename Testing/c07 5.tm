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
* TOFF set:  -2
 39:     ST  3,-1(1)	store return address 
* COMPOUND
* TOFF set:  -2
* Compound body
* Var
* Var
* EXPRESSION
* ASSIGN  =
 40:    LDC  3,1(6)	Load integer constant 
* TOFF inc:  -1
 41:     LD  4,-1(1)	Pop index 
 42:    LDA  5,0(1)	Load address of base of array (null)
 43:    SUB  5,5,4	Compute offset of value 
 44:     ST  3,0(1)	Store variable (null)
* TOFF dec:  -2
* EXPRESSION
* EXPRESSION
* EXPRESSION
 45:    LDC  3,2(6)	Load integer constant 
* OP  (null)
* EXPRESSION
* EXPRESSION
* ASSIGN  =
 46:    LDC  3,0(6)	Load integer constant 
* TOFF inc:  -1
 47:     LD  4,-1(1)	Pop index 
 48:    LDA  5,0(1)	Load address of base of array (null)
 49:    SUB  5,5,4	Compute offset of value 
 50:     ST  3,0(1)	Store variable (null)
* TOFF dec:  -2
* EXPRESSION
* EXPRESSION
* EXPRESSION
 51:    LDC  3,1(6)	Load integer constant 
* OP  (null)
* EXPRESSION
* EXPRESSION
* CALL  outputb
 52:     ST  1,-2(1)	Store fp in ghost frame for  outputb
* TOFF dec:  -2
 53:    LDA  3,-1(0)	Load address of array x
 54:     ST  3,-4(1)	Push left side 
 55:    LDC  3,2(6)	Load integer constant 
 56:     LD  4,-4(1)	Pop left into ac1 
 57:    SUB  3,4,3	Compute location from index 
 58:     LD  3,0(3)	Load array element 
 59:     ST  3,0(5)	Push left side 
 60:    LDA  3,-5(0)	Load address of base of array (null)
 61:     ST  3,-4(1)	Push left side 
 62:    LDC  3,1(6)	Load integer constant 
 63:     LD  4,-4(1)	Pop left into ac1 
 64:    SUB  3,4,3	Compute location from index 
 65:     LD  3,0(3)	Load array element 
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
 66:     LD  4,-4(1)	Pop left into ac1 
 67:     OR  3,4,3	Op | 
* Param 
 68:     ST  3,-4(1)	Push parameter 
* TOFF dec: 
* Param end  outputb
 69:    LDA  1,-2(1)	Ghost frame becomes new active frame 
 70:    LDA  3,1(7)	Return address in ac 
 71:    JMP  7,-55(7)	call outputb
 72:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set: 
* EXPRESSION
* CALL  outnl
 73:     ST  1,-2(1)	Store fp in ghost frame for  outnl
* TOFF dec:  -2
* Param end  outnl
 74:    LDA  1,-2(1)	Ghost frame becomes new active frame 
 75:    LDA  3,1(7)	Return address in ac 
 76:    JMP  7,-43(7)	call outnl
 77:    LDA  3,0(2)	save the result in ac 
* Call end  outnl
* TOFF set: 
* END COMPOUND
* Add standard closing in case there is no return statement
 78:    LDC  2,0(6)	Set return value to 0 
 79:     LD  3,-1(1)	Load return address 
 80:     LD  1,0(1)	Adjust frame pointer 
 81:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,81(7)	Jump to init [backpatch] 
* =========================================
* INIT
 82:    LDA  1,5(0)	Set first frame at end of globals 
 83:     ST  1,0(1)	Store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
 84:    LDA  3,1(7)	Return address in ac 
 85:    JMP  7,-47(7)	Jump to main 
 86:   HALT  0,0(0)	DONE! 
* END INIT
