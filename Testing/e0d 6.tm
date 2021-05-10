* C- version: 1.00
* by Sydney Petrehn
* Input file: e0d.c-
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
 42:     LD  3,-2(0)	Load variable  x
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
 49:     LD  3,-3(0)	Load variable  y
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
* IF
* EXPRESSION
* EXPRESSION
* EXPRESSION
 61:    LDC  3,4(6)	Load integer constant 
* OP  ==
 62:     LD  4,-8(1)	Pop left into ac1 
 63:    TEQ  3,4,3	Op == 
* Break
* EXPRESSION
* ASSIGN  =
 64:     ST  3,-3(1)	Store variable y
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
 65:    LDC  3,1(6)	Load integer constant 
* OP  +
 66:     LD  3,-3(1)	Load variable  y
 67:     ST  3,-9(1)	Push left side 
 68:     LD  4,-9(1)	Pop left into ac1 
 69:    ADD  3,4,3	Op + 
* END COMPOUND
 70:    JNZ  3,1(7)	Jump to while part 
* EXPRESSION
* CALL  output
 71:     ST  1,-9(1)	Store fp in ghost frame for  output
* TOFF dec:  -10
* TOFF dec:  -11
* EXPRESSION
* Param  2
 72:     LD  3,-2(1)	Load variable  x
 73:     ST  3,-11(1)	Push parameter 
* TOFF dec:  -12
* Param end  output
 74:    LDA  1,-9(1)	Ghost frame becomes new active frame 
 75:    LDA  3,1(7)	Return address in ac 
 76:    JMP  7,-71(7)	call output
 77:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set:  -9
* IF
* EXPRESSION
* EXPRESSION
* EXPRESSION
 78:    LDC  3,4(6)	Load integer constant 
* OP  ==
 79:     LD  4,-9(1)	Pop left into ac1 
 80:    TEQ  3,4,3	Op == 
* Break
* EXPRESSION
* ASSIGN  =
 81:     ST  3,-2(1)	Store variable x
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
 82:    LDC  3,1(6)	Load integer constant 
* OP  +
 83:     LD  3,-2(1)	Load variable  x
 84:     ST  3,-10(1)	Push left side 
 85:     LD  4,-10(1)	Pop left into ac1 
 86:    ADD  3,4,3	Op + 
* END COMPOUND
 87:    JNZ  3,1(7)	Jump to while part 
* END COMPOUND
* Add standard closing in case there is no return statement
 88:    LDC  2,0(6)	Set return value to 0 
 89:     LD  3,-1(1)	Load return address 
 90:     LD  1,0(1)	Adjust frame pointer 
 91:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,91(7)	Jump to init [backpatch] 
* =========================================
* INIT
 92:    LDA  1,0(0)	Set first frame at end of globals 
 93:     ST  1,0(1)	Store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
 94:    LDA  3,1(7)	Return address in ac 
 95:    JMP  7,-57(7)	Jump to main 
 96:   HALT  0,0(0)	DONE! 
* END INIT
