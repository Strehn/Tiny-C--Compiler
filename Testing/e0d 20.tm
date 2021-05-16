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
* EXPRESSION
* EXPRESSION
* EXPRESSION
 42:    LDC  3,6(6)	Load integer constant 
* OP  <
 43:     LD  4,-15(1)	Pop left into ac1 
 44:    TLT  3,4,3	Op < 
* COMPOUND
* TOFF set:  -11
* Compound body
* EXPRESSION
* ASSIGN  =
 45:    LDC  3,0(6)	Load integer constant 
 46:     ST  3,-3(1)	Store variable y
* EXPRESSION
* EXPRESSION
* While
* EXPRESSION
* EXPRESSION
* EXPRESSION
 47:    LDC  3,6(6)	Load integer constant 
* OP  <
 48:     LD  4,-12(1)	Pop left into ac1 
 49:    TLT  3,4,3	Op < 
* COMPOUND
* TOFF set:  -10
* Compound body
* EXPRESSION
* CALL  output
 50:     ST  1,-10(1)	Store fp in ghost frame for  output
* TOFF dec:  -11
* TOFF dec:  -12
* EXPRESSION
* Param  1
 51:     LD  3,-3(1)	Load variable  y
 52:     ST  3,-12(1)	Push parameter 
* TOFF dec:  -13
* Param end  output
 53:    LDA  1,-10(1)	Ghost frame becomes new active frame 
 54:    LDA  3,1(7)	Return address in ac 
 55:    JMP  7,-50(7)	call output
 56:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set:  -10
* IF
* EXPRESSION
* EXPRESSION
* EXPRESSION
 57:    LDC  3,4(6)	Load integer constant 
* OP  ==
 58:     LD  4,-10(1)	Pop left into ac1 
 59:    TEQ  3,4,3	Op == 
* Break
 60:    JMP  7,-9(7)	break 
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
 64:     ST  3,-11(1)	Push left side 
 65:     LD  4,-11(1)	Pop left into ac1 
 66:    ADD  3,4,3	Op + 
* END COMPOUND
* EXPRESSION
* CALL  output
 67:     ST  1,-11(1)	Store fp in ghost frame for  output
* TOFF dec:  -12
* TOFF dec:  -13
* EXPRESSION
* Param  2
 68:     LD  3,-2(1)	Load variable  x
 69:     ST  3,-13(1)	Push parameter 
* TOFF dec:  -14
* Param end  output
 70:    LDA  1,-11(1)	Ghost frame becomes new active frame 
 71:    LDA  3,1(7)	Return address in ac 
 72:    JMP  7,-67(7)	call output
 73:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set:  -11
* IF
* EXPRESSION
* EXPRESSION
* EXPRESSION
 74:    LDC  3,4(6)	Load integer constant 
* OP  ==
 75:     LD  4,-11(1)	Pop left into ac1 
 76:    TEQ  3,4,3	Op == 
* Break
 77:    JMP  7,-9(7)	break 
* EXPRESSION
* ASSIGN  =
 78:     ST  3,-2(1)	Store variable x
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
 79:    LDC  3,1(6)	Load integer constant 
* OP  +
 80:     LD  3,-2(1)	Load variable  x
 81:     ST  3,-12(1)	Push left side 
 82:     LD  4,-12(1)	Pop left into ac1 
 83:    ADD  3,4,3	Op + 
* END COMPOUND
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
