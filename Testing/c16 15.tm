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
* TOFF set:  -2
 39:     ST  3,-1(1)	store return address 
* COMPOUND
* TOFF set:  -3
* Compound body
* Var
* Var
* EXPRESSION
* ASSIGN  =
 40:    LDC  3,1(6)	Load integer constant 
 41:     ST  3,-2(1)	Store variable z
* TOFF dec:  -4
* EXPRESSION
* EXPRESSION
* EXPRESSION
* ASSIGN  =
 42:    LDC  3,2(6)	Load integer constant 
 43:     ST  3,-3(1)	Store variable zz
* TOFF dec:  -5
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
* EXPRESSION
* ASSIGN  =
 50:     ST  3,-5(1)	Push index 
 51:    LDC  3,211(6)	Load integer constant 
 52:     LD  4,-5(1)	Pop index 
 53:    LDA  5,-1(0)	Load address of base of array y
 54:    SUB  5,5,4	Compute offset of value 
 55:     ST  3,0(5)	Store variable y
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  (null)
* EXPRESSION
* EXPRESSION
* CALL  output
 56:     ST  1,-5(1)	Store fp in ghost frame for  output
* TOFF dec:  -5
 57:    LDA  3,-1(0)	Load address of array x
 58:     ST  3,-7(1)	Push left side 
 59:     LD  4,-7(1)	Pop left into ac1 
 60:    SUB  3,4,3	Compute location from index 
 61:     LD  3,0(3)	Load array element 
 62:     ST  3,0(5)	Push left side 
 63:    LDA  3,-1(0)	Load address of base of array -
 64:     ST  3,-7(1)	Push left side 
 65:     LD  4,-7(1)	Pop left into ac1 
 66:    SUB  3,4,3	Compute location from index 
 67:     LD  3,0(3)	Load array element 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
 68:    LDC  3,33(6)	Load integer constant 
* EXPRESSION
 69:    LDC  3,31(6)	Load integer constant 
* OP  -
 70:     LD  4,-7(1)	Pop left into ac1 
 71:    SUB  3,4,3	Op - 
* OP  (null)
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
 72:    LDC  3,9123(6)	Load integer constant 
* EXPRESSION
* EXPRESSION
 73:    LDC  3,9100(6)	Load integer constant 
* EXPRESSION
 74:    LDC  3,23(6)	Load integer constant 
* OP  +
 75:     LD  4,-7(1)	Pop left into ac1 
 76:    ADD  3,4,3	Op + 
* OP  /
 77:     LD  4,-7(1)	Pop left into ac1 
 78:    DIV  3,4,3	Op / 
* OP  (null)
* OP  +
 79:     LD  4,-7(1)	Pop left into ac1 
 80:    ADD  3,4,3	Op + 
* Param 
 81:     ST  3,-7(1)	Push parameter 
* TOFF dec: 
* Param end  output
 82:    LDA  1,-5(1)	Ghost frame becomes new active frame 
 83:    LDA  3,1(7)	Return address in ac 
 84:    JMP  7,-79(7)	call output
 85:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set: 
* EXPRESSION
* CALL  outnl
 86:     ST  1,-5(1)	Store fp in ghost frame for  outnl
* TOFF dec:  -5
* Param end  outnl
 87:    LDA  1,-5(1)	Ghost frame becomes new active frame 
 88:    LDA  3,1(7)	Return address in ac 
 89:    JMP  7,-56(7)	call outnl
 90:    LDA  3,0(2)	save the result in ac 
* Call end  outnl
* TOFF set: 
* END COMPOUND
* Add standard closing in case there is no return statement
 91:    LDC  2,0(6)	Set return value to 0 
 92:     LD  3,-1(1)	Load return address 
 93:     LD  1,0(1)	Adjust frame pointer 
 94:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,94(7)	Jump to init [backpatch] 
* =========================================
* INIT
 95:    LDA  1,-16(0)	Set first frame at end of globals 
 96:     ST  1,0(1)	Store old fp (point to self) 
* INIT GLOBALS AND STATICS
 97:    LDC  3,3(6)	load size of array x
 98:     ST  3,-4(0)	save size of array x
 99:    LDC  3,4(6)	load size of array y
100:     ST  3,-10(0)	save size of array y
* END INIT GLOBALS AND STATICS
101:    LDA  3,1(7)	Return address in ac 
102:    JMP  7,-64(7)	Jump to main 
103:   HALT  0,0(0)	DONE! 
* END INIT
