* C- version: 1.00
* by Sydney Petrehn
* Input file: c14.c-
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
* TOFF set:  -13
* Compound body
* Var
 40:    LDC  3,3(6)	Load size of array x
 41:     ST  3,-2(1)	store return address 
* Var
 42:    LDC  3,4(6)	Load size of array y
 43:     ST  3,-6(1)	store return address 
* Var
* Var
* EXPRESSION
* ASSIGN  =
 44:    LDC  3,1(6)	Load integer constant 
 45:     ST  3,-11(1)	Store variable z
* EXPRESSION
* EXPRESSION
* EXPRESSION
* ASSIGN  =
 46:    LDC  3,2(6)	Load integer constant 
 47:     ST  3,-12(1)	Store variable zz
* EXPRESSION
* EXPRESSION
* EXPRESSION
* ASSIGN  =
 48:     ST  3,-17(1)	Push index 
 49:    LDC  3,73(6)	Load integer constant 
 50:     LD  4,-17(1)	Pop index 
 51:    LDA  5,-3(1)	Load address of base of array x
 52:    SUB  5,5,4	Compute offset of value 
 53:     ST  3,0(5)	Store variable x
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  (null)
* EXPRESSION
* EXPRESSION
* ASSIGN  =
 54:     ST  3,-17(1)	Push index 
 55:    LDC  3,211(6)	Load integer constant 
 56:     LD  4,-17(1)	Pop index 
 57:    LDA  5,-7(1)	Load address of base of array y
 58:    SUB  5,5,4	Compute offset of value 
 59:     ST  3,0(5)	Store variable y
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  (null)
* EXPRESSION
* EXPRESSION
* CALL  output
 60:     ST  1,-17(1)	Store fp in ghost frame for  output
* TOFF dec:  -18
* TOFF dec:  -19
 61:    LDA  3,-3(1)	Load address of base of array x
 62:     ST  3,-19(1)	Push left side 
 63:     LD  4,-19(1)	Pop left into ac1 
 64:    SUB  3,4,3	Compute location from index 
 65:     LD  3,0(3)	Load array element 
 66:     ST  3,-19(1)	Push left side 
 67:    LDA  3,-7(1)	Load address of base of array y
 68:     ST  3,-20(1)	Push left side 
 69:     LD  4,-20(1)	Pop left into ac1 
 70:    SUB  3,4,3	Compute location from index 
 71:     LD  3,0(3)	Load array element 
* TOFF inc:  -19
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
 72:     LD  4,-19(1)	Pop left into ac1 
 73:    ADD  3,4,3	Op + 
* Param  0
 74:     ST  3,-18(1)	Push parameter 
* TOFF dec:  -19
* Param end  output
 75:    LDA  1,-17(1)	Ghost frame becomes new active frame 
 76:    LDA  3,1(7)	Return address in ac 
 77:    JMP  7,-72(7)	call output
 78:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set:  -17
* EXPRESSION
* CALL  outnl
 79:     ST  1,-17(1)	Store fp in ghost frame for  outnl
* TOFF dec:  -18
* TOFF dec:  -19
* Param end  outnl
 80:    LDA  1,-17(1)	Ghost frame becomes new active frame 
 81:    LDA  3,1(7)	Return address in ac 
 82:    JMP  7,-49(7)	call outnl
 83:    LDA  3,0(2)	save the result in ac 
* Call end  outnl
* TOFF set:  -17
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
