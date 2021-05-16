* C- version: 1.00
* by Sydney Petrehn
* Input file: g0f.c-
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
* EXPRESSION
* EXPRESSION
* CALL  cat
 56:     ST  1,-2(1)	Store fp in ghost frame for  cat
* TOFF dec:  -3
* TOFF dec:  -4
* EXPRESSION
 57:    LDC  3,88(6)	Load integer constant 
* Param  2
 58:     ST  3,-4(1)	Push parameter 
* TOFF dec:  -5
* Param end  cat
 59:    LDA  1,-2(1)	Ghost frame becomes new active frame 
 60:    LDA  3,1(7)	Return address in ac 
 61:    JMP  7,-23(7)	call cat
 62:    LDA  3,0(2)	save the result in ac 
* Call end  cat
* TOFF set:  -2
* EXPRESSION
* CALL  cat
 63:     ST  1,-2(1)	Store fp in ghost frame for  cat
* TOFF dec:  -3
* TOFF dec:  -4
* TOFF inc:  -4
 64:    LDC  3,17(6)	Load integer constant 
* EXPRESSION
* EXPRESSION
 65:    LDC  3,17(6)	Load integer constant 
* OP  chsign
 66:    NEG  3,3,3	Op Unary - 
* Param  3
 67:     ST  3,-4(1)	Push parameter 
* TOFF dec:  -5
* Param end  cat
 68:    LDA  1,-2(1)	Ghost frame becomes new active frame 
 69:    LDA  3,1(7)	Return address in ac 
 70:    JMP  7,-32(7)	call cat
 71:    LDA  3,0(2)	save the result in ac 
* Call end  cat
* TOFF set:  -2
* OP  +
 72:     LD  4,-2(1)	Pop left into ac1 
 73:    ADD  3,4,3	Op + 
* Param  3
 74:     ST  3,-2(1)	Push parameter 
* TOFF dec:  -3
* Param end  output
 75:    LDA  1,-2(1)	Ghost frame becomes new active frame 
 76:    LDA  3,1(7)	Return address in ac 
 77:    JMP  7,-72(7)	call output
 78:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set:  -2
* END COMPOUND
* Add standard closing in case there is no return statement
 79:    LDC  2,0(6)	Set return value to 0 
 80:     LD  3,-1(1)	Load return address 
 81:     LD  1,0(1)	Adjust frame pointer 
 82:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,82(7)	Jump to init [backpatch] 
* =========================================
* INIT
 83:    LDA  1,0(0)	Set first frame at end of globals 
 84:     ST  1,0(1)	Store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
 85:    LDA  3,1(7)	Return address in ac 
 86:    JMP  7,-33(7)	Jump to main 
 87:   HALT  0,0(0)	DONE! 
* END INIT
