* C- version: 1.00
* by Sydney Petrehn
* Input file: g0e.c-
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
* FUNCTION cat
* TOFF set:  -2
 39:     ST  3,-1(1)	store return address 
* PARM
* IF
* EXPRESSION
* EXPRESSION
* EXPRESSION
 40:    LDC  3,0(6)	Load integer constant 
* OP  >
 41:     LD  4,-2(1)	Pop left into ac1 
 42:    TGT  3,4,3	Op > 
* Return
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  +
 43:     LD  3,0(1)	Load variable  x
 44:     ST  3,-2(1)	Push left side 
 45:     LD  3,0(1)	Load variable  x
 46:     LD  4,-2(1)	Pop left into ac1 
 47:    ADD  3,4,3	Op + 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  *
 48:     LD  4,-2(1)	Pop left into ac1 
 49:    MUL  3,4,3	Op * 
* Add standard closing in case there is no return statement
 50:    LDC  2,0(6)	Set return value to 0 
 51:     LD  3,-1(1)	Load return address 
 52:     LD  1,0(1)	Adjust frame pointer 
 53:    JMP  7,0(3)	Return 
* END FUNCTION cat
* FUNCTION main
* TOFF set:  -2
 54:     ST  3,-1(1)	store return address 
* COMPOUND
* TOFF set:  -4
* Compound body
* EXPRESSION
* CALL  output
 55:     ST  1,-2(1)	Store fp in ghost frame for  output
* TOFF dec:  -3
* TOFF dec:  -4
* TOFF inc:  -4
 56:    LDC  3,88(6)	Load integer constant 
* EXPRESSION
* CALL  cat
 57:     ST  1,-2(1)	Store fp in ghost frame for  cat
* TOFF dec:  -3
* TOFF dec:  -4
* EXPRESSION
 58:    LDC  3,88(6)	Load integer constant 
* Param  2
 59:     ST  3,-4(1)	Push parameter 
* TOFF dec:  -5
* Param end  cat
 60:    LDA  1,-2(1)	Ghost frame becomes new active frame 
 61:    LDA  3,1(7)	Return address in ac 
 62:    JMP  7,-24(7)	call cat
 63:    LDA  3,0(2)	save the result in ac 
* Call end  cat
* TOFF set:  -2
* Param  2
 64:     ST  3,-2(1)	Push parameter 
* TOFF dec:  -3
* Param end  output
 65:    LDA  1,-2(1)	Ghost frame becomes new active frame 
 66:    LDA  3,1(7)	Return address in ac 
 67:    JMP  7,-62(7)	call output
 68:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set:  -2
* EXPRESSION
* CALL  output
 69:     ST  1,-2(1)	Store fp in ghost frame for  output
* TOFF dec:  -3
* TOFF dec:  -4
* TOFF inc:  -4
* EXPRESSION
* CALL  cat
 70:     ST  1,-2(1)	Store fp in ghost frame for  cat
* TOFF dec:  -3
* TOFF dec:  -4
* TOFF inc:  -4
 71:    LDC  3,17(6)	Load integer constant 
* EXPRESSION
* EXPRESSION
 72:    LDC  3,17(6)	Load integer constant 
* OP  chsign
 73:    NEG  3,3,3	Op Unary - 
* Param  4
 74:     ST  3,-4(1)	Push parameter 
* TOFF dec:  -5
* Param end  cat
 75:    LDA  1,-2(1)	Ghost frame becomes new active frame 
 76:    LDA  3,1(7)	Return address in ac 
 77:    JMP  7,-39(7)	call cat
 78:    LDA  3,0(2)	save the result in ac 
* Call end  cat
* TOFF set:  -2
* Param  4
 79:     ST  3,-2(1)	Push parameter 
* TOFF dec:  -3
* Param end  output
 80:    LDA  1,-2(1)	Ghost frame becomes new active frame 
 81:    LDA  3,1(7)	Return address in ac 
 82:    JMP  7,-77(7)	call output
 83:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set:  -2
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
 91:    JMP  7,-38(7)	Jump to main 
 92:   HALT  0,0(0)	DONE! 
* END INIT
