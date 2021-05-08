* C- version: 1.00
* by Sydney Petrehn
* Input file: c09.c-
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
 40:    LDC  3,753(6)	Load integer constant 
* TOFF inc:  -1
 41:     LD  4,-1(1)	Pop index 
 42:    LDA  5,0(0)	Load address of base of array x
 43:    SUB  5,5,4	Compute offset of value 
 44:     ST  3,0(0)	Store variable x
* TOFF dec:  -2
* EXPRESSION
* EXPRESSION
* EXPRESSION
* ASSIGN  =
 45:    LDC  3,444(6)	Load integer constant 
* TOFF inc:  -1
 46:     LD  4,-1(1)	Pop index 
 47:    LDA  5,-1(0)	Load address of base of array y
 48:    SUB  5,5,4	Compute offset of value 
 49:     ST  3,-1(0)	Store variable y
* TOFF dec:  -2
* EXPRESSION
* EXPRESSION
* EXPRESSION
* ASSIGN  +=
* TOFF inc:  -1
 50:     LD  4,-1(1)	Pop index 
 51:    LDA  5,0(0)	Load address of base of array x
 52:    SUB  5,5,4	Compute offset of value 
 53:     ST  3,0(0)	Store variable x
* TOFF dec:  -2
* EXPRESSION
* EXPRESSION
* EXPRESSION
* CALL  output
 54:     ST  1,-2(1)	Store fp in ghost frame for  output
* TOFF dec:  -2
* EXPRESSION
* Param 
 55:     LD  3,0(0)	Load variable  x
 56:     ST  3,-4(1)	Push parameter 
* TOFF dec: 
* Param end  output
 57:    LDA  1,-2(1)	Ghost frame becomes new active frame 
 58:    LDA  3,1(7)	Return address in ac 
 59:    JMP  7,-54(7)	call output
 60:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set: 
* EXPRESSION
* ASSIGN  -=
* TOFF inc:  -1
 61:     LD  4,-1(1)	Pop index 
 62:    LDA  5,-1(0)	Load address of base of array y
 63:    SUB  5,5,4	Compute offset of value 
 64:     ST  3,-1(0)	Store variable y
* TOFF dec:  -2
* EXPRESSION
* EXPRESSION
* EXPRESSION
* CALL  output
 65:     ST  1,-2(1)	Store fp in ghost frame for  output
* TOFF dec:  -2
* EXPRESSION
* Param 
 66:     LD  3,-1(0)	Load variable  y
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
* CALL  outnl
 72:     ST  1,-2(1)	Store fp in ghost frame for  outnl
* TOFF dec:  -2
* Param end  outnl
 73:    LDA  1,-2(1)	Ghost frame becomes new active frame 
 74:    LDA  3,1(7)	Return address in ac 
 75:    JMP  7,-42(7)	call outnl
 76:    LDA  3,0(2)	save the result in ac 
* Call end  outnl
* TOFF set: 
* END COMPOUND
* Add standard closing in case there is no return statement
 77:    LDC  2,0(6)	Set return value to 0 
 78:     LD  3,-1(1)	Load return address 
 79:     LD  1,0(1)	Adjust frame pointer 
 80:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,80(7)	Jump to init [backpatch] 
* =========================================
* INIT
 81:    LDA  1,-2(0)	Set first frame at end of globals 
 82:     ST  1,0(1)	Store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
 83:    LDA  3,1(7)	Return address in ac 
 84:    JMP  7,-46(7)	Jump to main 
 85:   HALT  0,0(0)	DONE! 
* END INIT
