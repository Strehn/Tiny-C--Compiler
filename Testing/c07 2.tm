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
* TOFF set:  -11
* Compound body
* Var
 40:    LDC  3,3(6)	Load size of array x
 41:     ST  3,-2(1)	store return address 
* Var
 42:    LDC  3,4(6)	Load size of array y
 43:     ST  3,-6(1)	store return address 
* EXPRESSION
* ASSIGN  =
 44:    LDC  3,2(6)	Load integer constant 
 45:     ST  3,-11(1)	Push index 
 46:    LDC  3,1(6)	Load integer constant 
 47:     LD  4,-11(1)	Pop index 
 48:    LDA  5,-3(1)	Load address of base of array x
 49:    SUB  5,5,4	Compute offset of value 
 50:     ST  3,0(5)	Store variable x
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  (null)
* EXPRESSION
* EXPRESSION
* ASSIGN  =
 51:    LDC  3,1(6)	Load integer constant 
 52:     ST  3,-11(1)	Push index 
 53:    LDC  3,0(6)	Load integer constant 
 54:     LD  4,-11(1)	Pop index 
 55:    LDA  5,-7(1)	Load address of base of array y
 56:    SUB  5,5,4	Compute offset of value 
 57:     ST  3,0(5)	Store variable y
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  (null)
* EXPRESSION
* EXPRESSION
* CALL  outputb
 58:     ST  1,-11(1)	Store fp in ghost frame for  outputb
* TOFF dec:  -12
* TOFF dec:  -13
 59:    LDA  3,-3(1)	Load address of base of array x
 60:     ST  3,-13(1)	Push left side 
 61:    LDC  3,2(6)	Load integer constant 
 62:     LD  4,-13(1)	Pop left into ac1 
 63:    SUB  3,4,3	Compute location from index 
 64:     LD  3,0(3)	Load array element 
 65:     ST  3,-13(1)	Push left side 
 66:    LDA  3,-7(1)	Load address of base of array y
 67:     ST  3,-14(1)	Push left side 
 68:    LDC  3,1(6)	Load integer constant 
 69:     LD  4,-14(1)	Pop left into ac1 
 70:    SUB  3,4,3	Compute location from index 
 71:     LD  3,0(3)	Load array element 
* TOFF inc:  -13
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
 72:     LD  4,-13(1)	Pop left into ac1 
 73:     OR  3,4,3	Op | 
* Param  0
 74:     ST  3,-13(1)	Push parameter 
* TOFF dec:  -14
* Param end  outputb
 75:    LDA  1,-11(1)	Ghost frame becomes new active frame 
 76:    LDA  3,1(7)	Return address in ac 
 77:    JMP  7,-61(7)	call outputb
 78:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set:  -11
* EXPRESSION
* CALL  outnl
 79:     ST  1,-11(1)	Store fp in ghost frame for  outnl
* TOFF dec:  -12
* TOFF dec:  -13
* Param end  outnl
 80:    LDA  1,-11(1)	Ghost frame becomes new active frame 
 81:    LDA  3,1(7)	Return address in ac 
 82:    JMP  7,-49(7)	call outnl
 83:    LDA  3,0(2)	save the result in ac 
* Call end  outnl
* TOFF set:  -11
* END COMPOUND
* Add standard closing in case there is no return statement
 84:    LDC  2,0(6)	Set return value to 0 
 85:     LD  3,-1(1)	Load return address 
 86:     LD  1,0(1)	Adjust frame pointer 
 87:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,87(7)	Jump to init [backpatch] 
* =========================================
* INIT
 88:    LDA  1,0(0)	Set first frame at end of globals 
 89:     ST  1,0(1)	Store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
 90:    LDA  3,1(7)	Return address in ac 
 91:    JMP  7,-53(7)	Jump to main 
 92:   HALT  0,0(0)	DONE! 
* END INIT
