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
* TOFF set:  -12
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
 42:     LD  3,-2(0)	Load variable  x
 43:     ST  3,-15(1)	Push left side 
* EXPRESSION
* EXPRESSION
* EXPRESSION
 44:    LDC  3,6(6)	Load integer constant 
* OP  <
 45:     LD  4,-15(1)	Pop left into ac1 
 46:    TLT  3,4,3	Op < 
 47:    JNZ  3,1(7)	Jump to while part 
* COMPOUND
* TOFF set:  -11
* Compound body
* EXPRESSION
* ASSIGN  =
 48:    LDC  3,0(6)	Load integer constant 
 49:     ST  3,-3(1)	Store variable y
* EXPRESSION
* EXPRESSION
* While
 50:     LD  3,-3(0)	Load variable  y
 51:     ST  3,-12(1)	Push left side 
* EXPRESSION
* EXPRESSION
* EXPRESSION
 52:    LDC  3,6(6)	Load integer constant 
* OP  <
 53:     LD  4,-12(1)	Pop left into ac1 
 54:    TLT  3,4,3	Op < 
 55:    JNZ  3,1(7)	Jump to while part 
* COMPOUND
* TOFF set:  -10
* Compound body
* EXPRESSION
* CALL  output
 56:     ST  1,-10(1)	Store fp in ghost frame for  output
* TOFF dec:  -11
* TOFF dec:  -12
* EXPRESSION
* Param  1
 57:     LD  3,-3(1)	Load variable  y
 58:     ST  3,-12(1)	Push parameter 
* TOFF dec:  -13
* Param end  output
 59:    LDA  1,-10(1)	Ghost frame becomes new active frame 
 60:    LDA  3,1(7)	Return address in ac 
 61:    JMP  7,-56(7)	call output
 62:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set:  -10
* EXPRESSION
* ASSIGN  =
 63:     ST  3,-3(1)	Store variable y
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
 64:    LDC  3,1(6)	Load integer constant 
* OP  +
 65:     LD  3,-3(1)	Load variable  y
 66:     ST  3,-11(1)	Push left side 
 67:     LD  4,-11(1)	Pop left into ac1 
 68:    ADD  3,4,3	Op + 
* END COMPOUND
* EXPRESSION
* CALL  outnl
 69:     ST  1,-11(1)	Store fp in ghost frame for  outnl
* TOFF dec:  -12
* TOFF dec:  -13
* Param end  outnl
 70:    LDA  1,-11(1)	Ghost frame becomes new active frame 
 71:    LDA  3,1(7)	Return address in ac 
 72:    JMP  7,-39(7)	call outnl
 73:    LDA  3,0(2)	save the result in ac 
* Call end  outnl
* TOFF set:  -11
* EXPRESSION
* CALL  output
 74:     ST  1,-11(1)	Store fp in ghost frame for  output
* TOFF dec:  -12
* TOFF dec:  -13
* EXPRESSION
* Param  2
 75:     LD  3,-2(1)	Load variable  x
 76:     ST  3,-13(1)	Push parameter 
* TOFF dec:  -14
* Param end  output
 77:    LDA  1,-11(1)	Ghost frame becomes new active frame 
 78:    LDA  3,1(7)	Return address in ac 
 79:    JMP  7,-74(7)	call output
 80:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set:  -11
* EXPRESSION
* CALL  outnl
 81:     ST  1,-11(1)	Store fp in ghost frame for  outnl
* TOFF dec:  -12
* TOFF dec:  -13
* Param end  outnl
 82:    LDA  1,-11(1)	Ghost frame becomes new active frame 
 83:    LDA  3,1(7)	Return address in ac 
 84:    JMP  7,-51(7)	call outnl
 85:    LDA  3,0(2)	save the result in ac 
* Call end  outnl
* TOFF set:  -11
* EXPRESSION
* ASSIGN  =
 86:     ST  3,-2(1)	Store variable x
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
 87:    LDC  3,1(6)	Load integer constant 
* OP  +
 88:     LD  3,-2(1)	Load variable  x
 89:     ST  3,-12(1)	Push left side 
 90:     LD  4,-12(1)	Pop left into ac1 
 91:    ADD  3,4,3	Op + 
* END COMPOUND
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
