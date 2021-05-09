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
 39:    LDC  3,7(6)	Load size of array x
 40:     ST  3,0(1)	store return address 
* Var
 41:    LDC  3,9(6)	Load size of array y
 42:     ST  3,-8(1)	store return address 
* FUNCTION main
* TOFF set:  -2
 43:     ST  3,-1(1)	store return address 
* COMPOUND
* TOFF set:  -2
* Compound body
* EXPRESSION
* ASSIGN  =
 44:    LDC  3,5(6)	Load integer constant 
 45:     ST  3,-2(1)	Push index 
 46:    LDC  3,333(6)	Load integer constant 
 47:     LD  4,-2(1)	Pop index 
 48:    LDA  5,-1(0)	Load address of base of array x
 49:    SUB  5,5,4	Compute offset of value 
 50:     ST  3,0(5)	Store variable x
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  (null)
* EXPRESSION
* EXPRESSION
* ASSIGN  =
 51:    LDC  3,7(6)	Load integer constant 
 52:     ST  3,-2(1)	Push index 
 53:    LDC  3,444(6)	Load integer constant 
 54:     LD  4,-2(1)	Pop index 
 55:    LDA  5,-9(0)	Load address of base of array y
 56:    SUB  5,5,4	Compute offset of value 
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
 60:     LD  4,-2(1)	Pop index 
 61:    LDA  5,-1(0)	Load address of base of array x
 62:    SUB  5,5,4	Compute offset of value 
 63:     ST  3,0(5)	Store variable x
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  (null)
* EXPRESSION
* EXPRESSION
* EXPRESSION
 64:    LDC  3,7(6)	Load integer constant 
* OP  (null)
* EXPRESSION
* CALL  output
 65:     ST  1,-2(1)	Store fp in ghost frame for  output
* TOFF dec:  -3
* TOFF dec:  -4
* EXPRESSION
* EXPRESSION
* EXPRESSION
 66:    LDC  3,5(6)	Load integer constant 
* OP  (null)
* Param 
 67:     ST  3,-4(1)	Push parameter 
* TOFF dec: 
* Param end  output
 68:    LDA  1,-2(1)	Ghost frame becomes new active frame 
 69:    LDA  3,1(7)	Return address in ac 
 70:    JMP  7,-65(7)	call output
 71:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set: 
* EXPRESSION
* ASSIGN  -=
 72:    LDC  3,7(6)	Load integer constant 
 73:     ST  3,-2(1)	Push index 
 74:     LD  4,-2(1)	Pop index 
 75:    LDA  5,-9(0)	Load address of base of array y
 76:    SUB  5,5,4	Compute offset of value 
 77:     ST  3,0(5)	Store variable y
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  (null)
* EXPRESSION
* EXPRESSION
* EXPRESSION
 78:    LDC  3,5(6)	Load integer constant 
* OP  (null)
* EXPRESSION
* CALL  output
 79:     ST  1,-2(1)	Store fp in ghost frame for  output
* TOFF dec:  -3
* TOFF dec:  -4
* EXPRESSION
* EXPRESSION
* EXPRESSION
 80:    LDC  3,7(6)	Load integer constant 
* OP  (null)
* Param 
 81:     ST  3,-4(1)	Push parameter 
* TOFF dec: 
* Param end  output
 82:    LDA  1,-2(1)	Ghost frame becomes new active frame 
 83:    LDA  3,1(7)	Return address in ac 
 84:    JMP  7,-79(7)	call output
 85:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set: 
* EXPRESSION
* CALL  outnl
 86:     ST  1,-2(1)	Store fp in ghost frame for  outnl
* TOFF dec:  -3
* TOFF dec:  -4
* Param end  outnl
 87:    LDA  1,-2(1)	Ghost frame becomes new active frame 
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
 95:    LDA  1,-18(0)	Set first frame at end of globals 
 96:     ST  1,0(1)	Store old fp (point to self) 
* INIT GLOBALS AND STATICS
 97:    LDC  3,7(6)	load size of array x
 98:     ST  3,0(0)	save size of array x
 99:    LDC  3,9(6)	load size of array y
100:     ST  3,-8(0)	save size of array y
* END INIT GLOBALS AND STATICS
101:    LDA  3,1(7)	Return address in ac 
102:    JMP  7,-60(7)	Jump to main 
103:   HALT  0,0(0)	DONE! 
* END INIT
