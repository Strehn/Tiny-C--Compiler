* C- version: 1.00
* by Sydney Petrehn
* Input file: c15.c-
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
* TOFF set:  -6
* Compound body
* Var
* Var
* EXPRESSION
* ASSIGN  =
 40:    LDC  3,1(6)	Load integer constant 
 41:     ST  3,-2(1)	Store variable z
* EXPRESSION
* EXPRESSION
* EXPRESSION
* ASSIGN  =
 42:    LDC  3,2(6)	Load integer constant 
 43:     ST  3,-3(1)	Store variable zz
* EXPRESSION
* EXPRESSION
* EXPRESSION
* ASSIGN  =
 44:     ST  3,-10(1)	Push index 
 45:    LDC  3,73(6)	Load integer constant 
 46:     LD  4,-10(1)	Pop index 
 47:    LDA  5,-1(0)	Load address of base of array x
 48:    SUB  5,5,4	Compute offset of value 
 49:     ST  3,0(5)	Store variable x
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  (null)
* EXPRESSION
* EXPRESSION
* ASSIGN  =
 50:     ST  3,-10(1)	Push index 
 51:    LDC  3,211(6)	Load integer constant 
 52:     LD  4,-10(1)	Pop index 
 53:    LDA  5,-5(0)	Load address of base of array y
 54:    SUB  5,5,4	Compute offset of value 
 55:     ST  3,0(5)	Store variable y
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  (null)
* EXPRESSION
* EXPRESSION
* CALL  output
 56:     ST  1,-10(1)	Store fp in ghost frame for  output
* TOFF dec:  -11
* TOFF dec:  -12
 57:    LDA  3,-1(0)	Load address of base of array x
 58:     ST  3,-12(1)	Push left side 
 59:     LD  4,-12(1)	Pop left into ac1 
 60:    SUB  3,4,3	Compute location from index 
 61:     LD  3,0(3)	Load array element 
 62:     ST  3,-12(1)	Push left side 
 63:    LDA  3,-5(0)	Load address of base of array y
 64:     ST  3,-13(1)	Push left side 
 65:     LD  4,-13(1)	Pop left into ac1 
 66:    SUB  3,4,3	Compute location from index 
 67:     LD  3,0(3)	Load array element 
* TOFF inc:  -12
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  (null)
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  (null)
* OP  +
 68:     LD  4,-12(1)	Pop left into ac1 
 69:    ADD  3,4,3	Op + 
* Param  0
 70:     ST  3,-12(1)	Push parameter 
* TOFF dec:  -13
* Param end  output
 71:    LDA  1,-10(1)	Ghost frame becomes new active frame 
 72:    LDA  3,1(7)	Return address in ac 
 73:    JMP  7,-68(7)	call output
 74:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set:  -10
* EXPRESSION
* CALL  outnl
 75:     ST  1,-10(1)	Store fp in ghost frame for  outnl
* TOFF dec:  -11
* TOFF dec:  -12
* Param end  outnl
 76:    LDA  1,-10(1)	Ghost frame becomes new active frame 
 77:    LDA  3,1(7)	Return address in ac 
 78:    JMP  7,-45(7)	call outnl
 79:    LDA  3,0(2)	save the result in ac 
* Call end  outnl
* TOFF set:  -10
* END COMPOUND
* Add standard closing in case there is no return statement
 80:    LDC  2,0(6)	Set return value to 0 
 81:     LD  3,-1(1)	Load return address 
 82:     LD  1,0(1)	Adjust frame pointer 
 83:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,83(7)	Jump to init [backpatch] 
* =========================================
* INIT
 84:    LDA  1,-9(0)	Set first frame at end of globals 
 85:     ST  1,0(1)	Store old fp (point to self) 
* INIT GLOBALS AND STATICS
 86:    LDC  3,3(6)	load size of array x
 87:     ST  3,0(0)	save size of array x
 88:    LDC  3,4(6)	load size of array y
 89:     ST  3,-4(0)	save size of array y
* END INIT GLOBALS AND STATICS
 90:    LDA  3,1(7)	Return address in ac 
 91:    JMP  7,-53(7)	Jump to main 
 92:   HALT  0,0(0)	DONE! 
* END INIT
