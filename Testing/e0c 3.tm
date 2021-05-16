* C- version: 1.00
* by Sydney Petrehn
* Input file: e0c.c-
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
* TOFF set:  -6
* Compound body
* Var
* Var
* EXPRESSION
* ASSIGN  =
 40:    LDC  3,0(6)	Load integer constant 
 41:     ST  3,-2(1)	Store variable x
* EXPRESSION
* EXPRESSION
* While
 42:     LD  3,0(0)	Load variable  (null)
 43:     ST  3,-9(1)	Push left side 
* EXPRESSION
* EXPRESSION
* EXPRESSION
 44:    LDC  3,6(6)	Load integer constant 
* OP  <
 45:     LD  4,-9(1)	Pop left into ac1 
 46:    TLT  3,4,3	Op < 
* COMPOUND
* TOFF set:  -7
* Compound body
* EXPRESSION
* ASSIGN  =
 47:    LDC  3,0(6)	Load integer constant 
 48:     ST  3,-3(1)	Store variable y
* EXPRESSION
* EXPRESSION
* While
 49:     LD  3,0(0)	Load variable  (null)
 50:     ST  3,-8(1)	Push left side 
* EXPRESSION
* EXPRESSION
* EXPRESSION
 51:    LDC  3,6(6)	Load integer constant 
* OP  <
 52:     LD  4,-8(1)	Pop left into ac1 
 53:    TLT  3,4,3	Op < 
* COMPOUND
* TOFF set:  -8
* Compound body
* EXPRESSION
* CALL  output
 54:     ST  1,-8(1)	Store fp in ghost frame for  output
* TOFF dec:  -9
* TOFF dec:  -10
* EXPRESSION
* Param  1
 55:     LD  3,-3(1)	Load variable  y
 56:     ST  3,-10(1)	Push parameter 
* TOFF dec:  -11
* Param end  output
 57:    LDA  1,-8(1)	Ghost frame becomes new active frame 
 58:    LDA  3,1(7)	Return address in ac 
 59:    JMP  7,-54(7)	call output
 60:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set:  -8
* EXPRESSION
* ASSIGN  =
 61:     ST  3,-3(1)	Store variable y
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
 62:    LDC  3,1(6)	Load integer constant 
* OP  +
 63:     LD  3,-3(1)	Load variable  y
 64:     ST  3,-9(1)	Push left side 
 65:     LD  4,-9(1)	Pop left into ac1 
 66:    ADD  3,4,3	Op + 
* END COMPOUND
 67:    JNZ  3,1(7)	Jump to while part 
* EXPRESSION
* CALL  outnl
 68:     ST  1,-9(1)	Store fp in ghost frame for  outnl
* TOFF dec:  -10
* TOFF dec:  -11
* Param end  outnl
 69:    LDA  1,-9(1)	Ghost frame becomes new active frame 
 70:    LDA  3,1(7)	Return address in ac 
 71:    JMP  7,-38(7)	call outnl
 72:    LDA  3,0(2)	save the result in ac 
* Call end  outnl
* TOFF set:  -9
* EXPRESSION
* CALL  output
 73:     ST  1,-9(1)	Store fp in ghost frame for  output
* TOFF dec:  -10
* TOFF dec:  -11
* EXPRESSION
* Param  2
 74:     LD  3,-2(1)	Load variable  x
 75:     ST  3,-11(1)	Push parameter 
* TOFF dec:  -12
* Param end  output
 76:    LDA  1,-9(1)	Ghost frame becomes new active frame 
 77:    LDA  3,1(7)	Return address in ac 
 78:    JMP  7,-73(7)	call output
 79:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set:  -9
* EXPRESSION
* CALL  outnl
 80:     ST  1,-9(1)	Store fp in ghost frame for  outnl
* TOFF dec:  -10
* TOFF dec:  -11
* Param end  outnl
 81:    LDA  1,-9(1)	Ghost frame becomes new active frame 
 82:    LDA  3,1(7)	Return address in ac 
 83:    JMP  7,-50(7)	call outnl
 84:    LDA  3,0(2)	save the result in ac 
* Call end  outnl
* TOFF set:  -9
* EXPRESSION
* ASSIGN  =
 85:     ST  3,-2(1)	Store variable x
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
 86:    LDC  3,1(6)	Load integer constant 
* OP  +
 87:     LD  3,-2(1)	Load variable  x
 88:     ST  3,-10(1)	Push left side 
 89:     LD  4,-10(1)	Pop left into ac1 
 90:    ADD  3,4,3	Op + 
* END COMPOUND
 91:    JNZ  3,1(7)	Jump to while part 
* END COMPOUND
* Add standard closing in case there is no return statement
 92:    LDC  2,0(6)	Set return value to 0 
 93:     LD  3,-1(1)	Load return address 
 94:     LD  1,0(1)	Adjust frame pointer 
 95:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,95(7)	Jump to init [backpatch] 
* =========================================
* INIT
 96:    LDA  1,0(0)	Set first frame at end of globals 
 97:     ST  1,0(1)	Store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
 98:    LDA  3,1(7)	Return address in ac 
 99:    JMP  7,-61(7)	Jump to main 
100:   HALT  0,0(0)	DONE! 
* END INIT