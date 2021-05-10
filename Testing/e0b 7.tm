* C- version: 1.00
* by Sydney Petrehn
* Input file: e0b.c-
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
* TOFF set:  -11
* Compound body
* Var
* EXPRESSION
* ASSIGN  =
 40:    LDC  3,0(6)	Load integer constant 
 41:     ST  3,-2(1)	Store variable x
* EXPRESSION
* EXPRESSION
* IF
* EXPRESSION
 42:    LDC  3,1(6)	Load integer constant 
* EXPRESSION
* CALL  output
 43:     ST  1,-13(1)	Store fp in ghost frame for  output
* TOFF dec:  -14
* TOFF dec:  -15
* EXPRESSION
 44:    LDC  3,666(6)	Load integer constant 
* Param  1
 45:     ST  3,-15(1)	Push parameter 
* TOFF dec:  -16
* Param end  output
 46:    LDA  1,-13(1)	Ghost frame becomes new active frame 
 47:    LDA  3,1(7)	Return address in ac 
 48:    JMP  7,-43(7)	call output
 49:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set:  -13
* While
 50:     LD  3,-2(0)	Load variable  x
 51:     ST  3,-13(1)	Push left side 
* EXPRESSION
* EXPRESSION
* EXPRESSION
 52:    LDC  3,10(6)	Load integer constant 
* OP  <
 53:     LD  4,-13(1)	Pop left into ac1 
 54:    TLT  3,4,3	Op < 
* COMPOUND
* TOFF set:  -7
* Compound body
* EXPRESSION
* CALL  output
 55:     ST  1,-7(1)	Store fp in ghost frame for  output
* TOFF dec:  -8
* TOFF dec:  -9
* EXPRESSION
* Param  2
 56:     LD  3,-2(1)	Load variable  x
 57:     ST  3,-9(1)	Push parameter 
* TOFF dec:  -10
* Param end  output
 58:    LDA  1,-7(1)	Ghost frame becomes new active frame 
 59:    LDA  3,1(7)	Return address in ac 
 60:    JMP  7,-55(7)	call output
 61:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set:  -7
* EXPRESSION
* ASSIGN  =
 62:     ST  3,-2(1)	Store variable x
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
 63:    LDC  3,1(6)	Load integer constant 
* OP  +
 64:     LD  3,-2(1)	Load variable  x
 65:     ST  3,-8(1)	Push left side 
 66:     LD  4,-8(1)	Pop left into ac1 
 67:    ADD  3,4,3	Op + 
* END COMPOUND
 68:    JNZ  3,1(7)	Jump to while part 
* EXPRESSION
* ASSIGN  =
 69:    LDC  3,0(6)	Load integer constant 
 70:     ST  3,-2(1)	Store variable x
* EXPRESSION
* EXPRESSION
* IF
* EXPRESSION
 71:    LDC  3,0(6)	Load integer constant 
* EXPRESSION
* CALL  output
 72:     ST  1,-9(1)	Store fp in ghost frame for  output
* TOFF dec:  -10
* TOFF dec:  -11
* EXPRESSION
 73:    LDC  3,666(6)	Load integer constant 
* Param  3
 74:     ST  3,-11(1)	Push parameter 
* TOFF dec:  -12
* Param end  output
 75:    LDA  1,-9(1)	Ghost frame becomes new active frame 
 76:    LDA  3,1(7)	Return address in ac 
 77:    JMP  7,-72(7)	call output
 78:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set:  -9
* While
 79:     LD  3,-2(0)	Load variable  x
 80:     ST  3,-9(1)	Push left side 
* EXPRESSION
* EXPRESSION
* EXPRESSION
 81:    LDC  3,10(6)	Load integer constant 
* OP  <
 82:     LD  4,-9(1)	Pop left into ac1 
 83:    TLT  3,4,3	Op < 
* COMPOUND
* TOFF set:  -10
* Compound body
* EXPRESSION
* CALL  output
 84:     ST  1,-10(1)	Store fp in ghost frame for  output
* TOFF dec:  -11
* TOFF dec:  -12
* EXPRESSION
* Param  4
 85:     LD  3,-2(1)	Load variable  x
 86:     ST  3,-12(1)	Push parameter 
* TOFF dec:  -13
* Param end  output
 87:    LDA  1,-10(1)	Ghost frame becomes new active frame 
 88:    LDA  3,1(7)	Return address in ac 
 89:    JMP  7,-84(7)	call output
 90:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set:  -10
* EXPRESSION
* ASSIGN  =
 91:     ST  3,-2(1)	Store variable x
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
 92:    LDC  3,1(6)	Load integer constant 
* OP  +
 93:     LD  3,-2(1)	Load variable  x
 94:     ST  3,-11(1)	Push left side 
 95:     LD  4,-11(1)	Pop left into ac1 
 96:    ADD  3,4,3	Op + 
* END COMPOUND
 97:    JNZ  3,1(7)	Jump to while part 
* END COMPOUND
* Add standard closing in case there is no return statement
 98:    LDC  2,0(6)	Set return value to 0 
 99:     LD  3,-1(1)	Load return address 
100:     LD  1,0(1)	Adjust frame pointer 
101:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,101(7)	Jump to init [backpatch] 
* =========================================
* INIT
102:    LDA  1,0(0)	Set first frame at end of globals 
103:     ST  1,0(1)	Store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
104:    LDA  3,1(7)	Return address in ac 
105:    JMP  7,-67(7)	Jump to main 
106:   HALT  0,0(0)	DONE! 
* END INIT
