* C- version: 1.00
* by Sydney Petrehn
* Input file: c16.c-
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
 44:     ST  3,-5(1)	Push index 
 45:    LDC  3,73(6)	Load integer constant 
 46:     LD  4,-5(1)	Pop index 
 47:    LDA  5,-1(0)	Load address of base of array x
 48:    SUB  5,5,4	Compute offset of value 
 49:     ST  3,0(5)	Store variable x
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  (null)
* EXPRESSION
 50:    LDC  3,73(6)	Load integer constant 
* EXPRESSION
* ASSIGN  =
 51:     ST  3,-5(1)	Push index 
 52:    LDC  3,211(6)	Load integer constant 
 53:     LD  4,-5(1)	Pop index 
 54:    LDA  5,-1(0)	Load address of base of array y
 55:    SUB  5,5,4	Compute offset of value 
 56:     ST  3,0(5)	Store variable y
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  (null)
* EXPRESSION
 57:    LDC  3,211(6)	Load integer constant 
* EXPRESSION
* CALL  output
 58:     ST  1,-5(1)	Store fp in ghost frame for  output
* TOFF dec: 
* TOFF dec: 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
 59:    LDC  3,33(6)	Load integer constant 
* EXPRESSION
 60:    LDC  3,31(6)	Load integer constant 
* OP  -
 61:     LD  4,-7(1)	Pop left into ac1 
 62:    SUB  3,4,3	Op - 
* OP  (null)
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
 63:    LDC  3,9123(6)	Load integer constant 
* EXPRESSION
* EXPRESSION
 64:    LDC  3,9100(6)	Load integer constant 
* EXPRESSION
 65:    LDC  3,23(6)	Load integer constant 
* OP  +
 66:     LD  4,-7(1)	Pop left into ac1 
 67:    ADD  3,4,3	Op + 
* OP  /
 68:     LD  4,-7(1)	Pop left into ac1 
 69:    DIV  3,4,3	Op / 
* OP  (null)
* OP  +
 70:     LD  4,-7(1)	Pop left into ac1 
 71:    ADD  3,4,3	Op + 
* Param 
 72:     ST  3,-7(1)	Push parameter 
* TOFF dec: 
* Param end  output
 73:    LDA  1,-5(1)	Ghost frame becomes new active frame 
 74:    LDA  3,1(7)	Return address in ac 
 75:    JMP  7,-70(7)	call output
 76:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set: 
* EXPRESSION
* CALL  outnl
 77:     ST  1,-5(1)	Store fp in ghost frame for  outnl
* TOFF dec: 
* TOFF dec: 
* Param end  outnl
 78:    LDA  1,-5(1)	Ghost frame becomes new active frame 
 79:    LDA  3,1(7)	Return address in ac 
 80:    JMP  7,-47(7)	call outnl
 81:    LDA  3,0(2)	save the result in ac 
* Call end  outnl
* TOFF set: 
* END COMPOUND
* Add standard closing in case there is no return statement
 82:    LDC  2,0(6)	Set return value to 0 
 83:     LD  3,-1(1)	Load return address 
 84:     LD  1,0(1)	Adjust frame pointer 
 85:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,85(7)	Jump to init [backpatch] 
* =========================================
* INIT
 86:    LDA  1,-16(0)	Set first frame at end of globals 
 87:     ST  1,0(1)	Store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
 88:    LDA  3,1(7)	Return address in ac 
 89:    JMP  7,-51(7)	Jump to main 
 90:   HALT  0,0(0)	DONE! 
* END INIT
