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
 44:    LDA  5,-1(0)	Load address of base of array x
 45:    SUB  5,5,4	Compute offset of value 
 46:     ST  3,0(5)	Store variable x
* EXPRESSION
* EXPRESSION
* EXPRESSION
 47:    LDC  3,5(6)	Load integer constant 
* OP  (null)
* EXPRESSION
 48:    LDC  3,333(6)	Load integer constant 
* EXPRESSION
* ASSIGN  =
 49:    LDC  3,7(6)	Load integer constant 
 50:     ST  3,-3(1)	Push index 
 51:    LDC  3,444(6)	Load integer constant 
 52:     LD  4,-3(1)	Pop index 
 53:    LDA  5,-1(0)	Load address of base of array y
 54:    SUB  5,5,4	Compute offset of value 
 55:     ST  3,0(5)	Store variable y
* EXPRESSION
* EXPRESSION
* EXPRESSION
 56:    LDC  3,7(6)	Load integer constant 
* OP  (null)
* EXPRESSION
 57:    LDC  3,444(6)	Load integer constant 
* EXPRESSION
* ASSIGN  +=
 58:    LDC  3,5(6)	Load integer constant 
 59:     ST  3,-3(1)	Push index 
 60:     LD  4,-3(1)	Pop index 
 61:    LDA  5,-1(0)	Load address of base of array x
 62:    SUB  5,5,4	Compute offset of value 
 63:     ST  3,0(5)	Store variable x
* EXPRESSION
* EXPRESSION
* EXPRESSION
 64:    LDC  3,5(6)	Load integer constant 
* OP  (null)
* EXPRESSION
* EXPRESSION
* EXPRESSION
 65:    LDC  3,7(6)	Load integer constant 
* OP  (null)
* EXPRESSION
* CALL  output
 66:     ST  1,-3(1)	Store fp in ghost frame for  output
* TOFF dec: 
* TOFF dec: 
* EXPRESSION
* EXPRESSION
* EXPRESSION
 67:    LDC  3,5(6)	Load integer constant 
* OP  (null)
* Param 
 68:     ST  3,-5(1)	Push parameter 
* TOFF dec: 
* Param end  output
 69:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 70:    LDA  3,1(7)	Return address in ac 
 71:    JMP  7,-66(7)	call output
 72:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set: 
* EXPRESSION
* ASSIGN  -=
 73:    LDC  3,7(6)	Load integer constant 
 74:     ST  3,-3(1)	Push index 
 75:     LD  4,-3(1)	Pop index 
 76:    LDA  5,-1(0)	Load address of base of array y
 77:    SUB  5,5,4	Compute offset of value 
 78:     ST  3,0(5)	Store variable y
* EXPRESSION
* EXPRESSION
* EXPRESSION
 79:    LDC  3,7(6)	Load integer constant 
* OP  (null)
* EXPRESSION
* EXPRESSION
* EXPRESSION
 80:    LDC  3,5(6)	Load integer constant 
* OP  (null)
* EXPRESSION
* CALL  output
 81:     ST  1,-3(1)	Store fp in ghost frame for  output
* TOFF dec: 
* TOFF dec: 
* EXPRESSION
* EXPRESSION
* EXPRESSION
 82:    LDC  3,7(6)	Load integer constant 
* OP  (null)
* Param 
 83:     ST  3,-5(1)	Push parameter 
* TOFF dec: 
* Param end  output
 84:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 85:    LDA  3,1(7)	Return address in ac 
 86:    JMP  7,-81(7)	call output
 87:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set: 
* EXPRESSION
* CALL  outnl
 88:     ST  1,-3(1)	Store fp in ghost frame for  outnl
* TOFF dec: 
* TOFF dec: 
* Param end  outnl
 89:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 90:    LDA  3,1(7)	Return address in ac 
 91:    JMP  7,-58(7)	call outnl
 92:    LDA  3,0(2)	save the result in ac 
* Call end  outnl
* TOFF set: 
* END COMPOUND
* Add standard closing in case there is no return statement
 93:    LDC  2,0(6)	Set return value to 0 
 94:     LD  3,-1(1)	Load return address 
 95:     LD  1,0(1)	Adjust frame pointer 
 96:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,96(7)	Jump to init [backpatch] 
* =========================================
* INIT
 97:    LDA  1,-28(0)	Set first frame at end of globals 
 98:     ST  1,0(1)	Store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
 99:    LDA  3,1(7)	Return address in ac 
100:    JMP  7,-62(7)	Jump to main 
101:   HALT  0,0(0)	DONE! 
* END INIT
