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
* TOFF set:  -2
 39:     ST  3,-1(1)	store return address 
* COMPOUND
* TOFF set:  -2
* Compound body
* EXPRESSION
* ASSIGN  =
 40:    LDC  3,5(6)	Load integer constant 
 41:     ST  3,-2(1)	Push index 
 42:    LDC  3,5(6)	Load integer constant 
 43:     LD  4,-2(1)	Pop index 
 44:    LDA  5,-9(0)	Load address of base of array x
 45:    SUB  5,5,4	Compute offset of value 
 46:     ST  3,0(5)	Store variable x
 47:    LDC  3,333(6)	Load integer constant 
 48:     ST  3,0(5)	Store variable x
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  (null)
* EXPRESSION
* EXPRESSION
* ASSIGN  =
 49:    LDC  3,7(6)	Load integer constant 
 50:     ST  3,-2(1)	Push index 
 51:    LDC  3,7(6)	Load integer constant 
 52:     LD  4,-2(1)	Pop index 
 53:    LDA  5,-20(0)	Load address of base of array y
 54:    SUB  5,5,4	Compute offset of value 
 55:     ST  3,0(5)	Store variable y
 56:    LDC  3,444(6)	Load integer constant 
 57:     ST  3,0(5)	Store variable y
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  (null)
* EXPRESSION
* EXPRESSION
* ASSIGN  +=
 58:    LDC  3,5(6)	Load integer constant 
 59:     ST  3,-2(1)	Push index 
 60:    LDC  3,5(6)	Load integer constant 
 61:     LD  4,-2(1)	Pop index 
 62:    LDA  5,-9(0)	Load address of base of array x
 63:    SUB  5,5,4	Compute offset of value 
 64:     ST  3,0(5)	Store variable x
 65:     ST  3,0(5)	Store variable x
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  (null)
* EXPRESSION
* EXPRESSION
* EXPRESSION
 66:    LDC  3,7(6)	Load integer constant 
* OP  (null)
* EXPRESSION
* CALL  output
 67:     ST  1,-2(1)	Store fp in ghost frame for  output
* TOFF dec:  -2
* EXPRESSION
* EXPRESSION
* EXPRESSION
 68:    LDC  3,5(6)	Load integer constant 
* OP  (null)
* Param 
 69:     ST  3,-4(1)	Push parameter 
* TOFF dec: 
* Param end  output
 70:    LDA  1,-2(1)	Ghost frame becomes new active frame 
 71:    LDA  3,1(7)	Return address in ac 
 72:    JMP  7,-67(7)	call output
 73:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set: 
* EXPRESSION
* ASSIGN  -=
 74:    LDC  3,7(6)	Load integer constant 
 75:     ST  3,-2(1)	Push index 
 76:    LDC  3,7(6)	Load integer constant 
 77:     LD  4,-2(1)	Pop index 
 78:    LDA  5,-20(0)	Load address of base of array y
 79:    SUB  5,5,4	Compute offset of value 
 80:     ST  3,0(5)	Store variable y
 81:     ST  3,0(5)	Store variable y
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  (null)
* EXPRESSION
* EXPRESSION
* EXPRESSION
 82:    LDC  3,5(6)	Load integer constant 
* OP  (null)
* EXPRESSION
* CALL  output
 83:     ST  1,-2(1)	Store fp in ghost frame for  output
* TOFF dec:  -2
* EXPRESSION
* EXPRESSION
* EXPRESSION
 84:    LDC  3,7(6)	Load integer constant 
* OP  (null)
* Param 
 85:     ST  3,-4(1)	Push parameter 
* TOFF dec: 
* Param end  output
 86:    LDA  1,-2(1)	Ghost frame becomes new active frame 
 87:    LDA  3,1(7)	Return address in ac 
 88:    JMP  7,-83(7)	call output
 89:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set: 
* EXPRESSION
* CALL  outnl
 90:     ST  1,-2(1)	Store fp in ghost frame for  outnl
* TOFF dec:  -2
* Param end  outnl
 91:    LDA  1,-2(1)	Ghost frame becomes new active frame 
 92:    LDA  3,1(7)	Return address in ac 
 93:    JMP  7,-60(7)	call outnl
 94:    LDA  3,0(2)	save the result in ac 
* Call end  outnl
* TOFF set: 
* END COMPOUND
* Add standard closing in case there is no return statement
 95:    LDC  2,0(6)	Set return value to 0 
 96:     LD  3,-1(1)	Load return address 
 97:     LD  1,0(1)	Adjust frame pointer 
 98:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,98(7)	Jump to init [backpatch] 
* =========================================
* INIT
 99:    LDA  1,-28(0)	Set first frame at end of globals 
100:     ST  1,0(1)	Store old fp (point to self) 
* INIT GLOBALS AND STATICS
101:    LDC  3,7(6)	load size of array x
102:     ST  3,-8(0)	save size of array x
103:    LDC  3,9(6)	load size of array y
104:     ST  3,-19(0)	save size of array y
* END INIT GLOBALS AND STATICS
105:    LDA  3,1(7)	Return address in ac 
106:    JMP  7,-68(7)	Jump to main 
107:   HALT  0,0(0)	DONE! 
* END INIT
