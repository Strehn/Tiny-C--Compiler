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
* IF
* EXPRESSION
* EXPRESSION
* EXPRESSION
 63:    LDC  3,4(6)	Load integer constant 
* OP  ==
 64:     LD  4,-10(1)	Pop left into ac1 
 65:    TEQ  3,4,3	Op == 
* Break
 66:    JMP  7,-9(7)	break 
* EXPRESSION
* ASSIGN  =
 67:     ST  3,-3(1)	Store variable y
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
 68:    LDC  3,1(6)	Load integer constant 
* OP  +
 69:     LD  3,-3(1)	Load variable  y
 70:     ST  3,-11(1)	Push left side 
 71:     LD  4,-11(1)	Pop left into ac1 
 72:    ADD  3,4,3	Op + 
* END COMPOUND
* EXPRESSION
* CALL  output
 73:     ST  1,-11(1)	Store fp in ghost frame for  output
* TOFF dec:  -12
* TOFF dec:  -13
* EXPRESSION
* Param  2
 74:     LD  3,-2(1)	Load variable  x
 75:     ST  3,-13(1)	Push parameter 
* TOFF dec:  -14
* Param end  output
 76:    LDA  1,-11(1)	Ghost frame becomes new active frame 
 77:    LDA  3,1(7)	Return address in ac 
 78:    JMP  7,-73(7)	call output
 79:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set:  -11
* IF
* EXPRESSION
* EXPRESSION
* EXPRESSION
 80:    LDC  3,4(6)	Load integer constant 
* OP  ==
 81:     LD  4,-11(1)	Pop left into ac1 
 82:    TEQ  3,4,3	Op == 
* Break
 83:    JMP  7,-9(7)	break 
* EXPRESSION
* ASSIGN  =
 84:     ST  3,-2(1)	Store variable x
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
 85:    LDC  3,1(6)	Load integer constant 
* OP  +
 86:     LD  3,-2(1)	Load variable  x
 87:     ST  3,-12(1)	Push left side 
 88:     LD  4,-12(1)	Pop left into ac1 
 89:    ADD  3,4,3	Op + 
* END COMPOUND
* END COMPOUND
* Add standard closing in case there is no return statement
 90:    LDC  2,0(6)	Set return value to 0 
 91:     LD  3,-1(1)	Load return address 
 92:     LD  1,0(1)	Adjust frame pointer 
 93:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,93(7)	Jump to init [backpatch] 
* =========================================
* INIT
 94:    LDA  1,0(0)	Set first frame at end of globals 
 95:     ST  1,0(1)	Store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
 96:    LDA  3,1(7)	Return address in ac 
 97:    JMP  7,-59(7)	Jump to main 
 98:   HALT  0,0(0)	DONE! 
* END INIT
