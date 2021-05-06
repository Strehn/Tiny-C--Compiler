* C- version: 1.00
* by Sydney Petrehn
* Input file: c17.c-
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
 40:    LDC  3,5(6)	Load integer constant 
 41:     ST  3,-3(1)	Push index 
 42:    LDC  3,333(6)	Load integer constant 
 43:     LD  4,-3(1)	Pop index 
 44:    LDA  5,-1(1)	Load address of base of array x
 45:    SUB  5,5,4	Compute offset of value 
 46:     ST  3,-9(0)	Store variable x
 47:    LDC  3,333(6)	Load integer constant 
 48:     ST  3,0(1)	Store variable (null)
* EXPRESSION
* EXPRESSION
* EXPRESSION
 49:    LDC  3,5(6)	Load integer constant 
* OP  (null)
* EXPRESSION
* EXPRESSION
* ASSIGN  =
 50:    LDC  3,7(6)	Load integer constant 
 51:     ST  3,-4(1)	Push index 
 52:    LDC  3,444(6)	Load integer constant 
 53:     LD  4,-4(1)	Pop index 
 54:    LDA  5,-1(1)	Load address of base of array y
 55:    SUB  5,5,4	Compute offset of value 
 56:     ST  3,-20(0)	Store variable y
 57:    LDC  3,444(6)	Load integer constant 
 58:     ST  3,0(1)	Store variable (null)
* EXPRESSION
* EXPRESSION
* EXPRESSION
 59:    LDC  3,7(6)	Load integer constant 
* OP  (null)
* EXPRESSION
* EXPRESSION
* ASSIGN  +=
 60:    LDC  3,5(6)	Load integer constant 
 61:     ST  3,-5(1)	Push index 
 62:     LD  4,-5(1)	Pop index 
 63:    LDA  5,-1(1)	Load address of base of array x
 64:    SUB  5,5,4	Compute offset of value 
 65:     ST  3,-9(0)	Store variable x
 66:     ST  3,0(1)	Store variable (null)
* EXPRESSION
* EXPRESSION
* EXPRESSION
 67:    LDC  3,5(6)	Load integer constant 
* OP  (null)
* EXPRESSION
* EXPRESSION
* EXPRESSION
 68:    LDC  3,7(6)	Load integer constant 
* OP  (null)
* EXPRESSION
* CALL  output
 69:     ST  1,-6(1)	Store fp in ghost frame for  output
* TOFF dec: 
* TOFF dec: 
* EXPRESSION
* EXPRESSION
* EXPRESSION
 70:    LDC  3,5(6)	Load integer constant 
* OP  (null)
* Param 
 71:     ST  3,-8(1)	Push parameter 
* TOFF dec: 
* Param end  output
 72:    LDA  1,-6(1)	Ghost frame becomes new active frame 
 73:    LDA  3,1(7)	Return address in ac 
 74:    JMP  7,-69(7)	call output
 75:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set: 
* EXPRESSION
* ASSIGN  -=
 76:    LDC  3,7(6)	Load integer constant 
 77:     ST  3,-6(1)	Push index 
 78:     LD  4,-6(1)	Pop index 
 79:    LDA  5,-1(1)	Load address of base of array y
 80:    SUB  5,5,4	Compute offset of value 
 81:     ST  3,-20(0)	Store variable y
 82:     ST  3,0(1)	Store variable (null)
* EXPRESSION
* EXPRESSION
* EXPRESSION
 83:    LDC  3,7(6)	Load integer constant 
* OP  (null)
* EXPRESSION
* EXPRESSION
* EXPRESSION
 84:    LDC  3,5(6)	Load integer constant 
* OP  (null)
* EXPRESSION
* CALL  output
 85:     ST  1,-7(1)	Store fp in ghost frame for  output
* TOFF dec: 
* TOFF dec: 
* EXPRESSION
* EXPRESSION
* EXPRESSION
 86:    LDC  3,7(6)	Load integer constant 
* OP  (null)
* Param 
 87:     ST  3,-9(1)	Push parameter 
* TOFF dec: 
* Param end  output
 88:    LDA  1,-7(1)	Ghost frame becomes new active frame 
 89:    LDA  3,1(7)	Return address in ac 
 90:    JMP  7,-85(7)	call output
 91:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set: 
* EXPRESSION
* CALL  outnl
 92:     ST  1,-7(1)	Store fp in ghost frame for  outnl
* TOFF dec: 
* TOFF dec: 
* Param end  outnl
 93:    LDA  1,-7(1)	Ghost frame becomes new active frame 
 94:    LDA  3,1(7)	Return address in ac 
 95:    JMP  7,-62(7)	call outnl
 96:    LDA  3,0(2)	save the result in ac 
* Call end  outnl
* TOFF set: 
* END COMPOUND
* Add standard closing in case there is no return statement
 97:    LDC  2,0(6)	Set return value to 0 
 98:     LD  3,-1(1)	Load return address 
 99:     LD  1,0(1)	Adjust frame pointer 
100:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,100(7)	Jump to init [backpatch] 
* =========================================
* INIT
101:    LDA  1,-28(0)	Set first frame at end of globals 
102:     ST  1,0(1)	Store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
103:    LDA  3,1(7)	Return address in ac 
104:    JMP  7,-66(7)	Jump to main 
105:   HALT  0,0(0)	DONE! 
* END INIT
