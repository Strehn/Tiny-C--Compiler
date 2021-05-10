* C- version: 1.00
* by Sydney Petrehn
* Input file: f0a.c-
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
* COMPOUND
* TOFF set:  -4
* Compound body
* Return
* EXPRESSION
 40:    LDC  3,93(6)	Load integer constant 
* END COMPOUND
* Add standard closing in case there is no return statement
 41:    LDC  2,0(6)	Set return value to 0 
 42:     LD  3,-1(1)	Load return address 
 43:     LD  1,0(1)	Adjust frame pointer 
 44:    JMP  7,0(3)	Return 
* END FUNCTION cat
* FUNCTION main
* TOFF set:  -2
 45:     ST  3,-1(1)	store return address 
* COMPOUND
* TOFF set:  -4
* Compound body
* EXPRESSION
* CALL  output
 46:     ST  1,-2(1)	Store fp in ghost frame for  output
* TOFF dec:  -3
* TOFF dec:  -4
* EXPRESSION
* EXPRESSION
* EXPRESSION
* CALL  cat
 47:     ST  1,-2(1)	Store fp in ghost frame for  cat
* TOFF dec:  -3
* TOFF dec:  -4
* Param end  cat
 48:    LDA  1,-2(1)	Ghost frame becomes new active frame 
 49:    LDA  3,1(7)	Return address in ac 
 50:    JMP  7,-13(7)	call cat
 51:    LDA  3,0(2)	save the result in ac 
* Call end  cat
* TOFF set:  -2
* EXPRESSION
* CALL  cat
 52:     ST  1,-2(1)	Store fp in ghost frame for  cat
* TOFF dec:  -3
* TOFF dec:  -4
* Param end  cat
 53:    LDA  1,-2(1)	Ghost frame becomes new active frame 
 54:    LDA  3,1(7)	Return address in ac 
 55:    JMP  7,-18(7)	call cat
 56:    LDA  3,0(2)	save the result in ac 
* Call end  cat
* TOFF set:  -2
* OP  +
 57:     LD  4,-2(1)	Pop left into ac1 
 58:    ADD  3,4,3	Op + 
* EXPRESSION
* CALL  cat
 59:     ST  1,-2(1)	Store fp in ghost frame for  cat
* TOFF dec:  -3
* TOFF dec:  -4
* Param end  cat
 60:    LDA  1,-2(1)	Ghost frame becomes new active frame 
 61:    LDA  3,1(7)	Return address in ac 
 62:    JMP  7,-25(7)	call cat
 63:    LDA  3,0(2)	save the result in ac 
* Call end  cat
* TOFF set:  -2
* OP  *
 64:     LD  4,-2(1)	Pop left into ac1 
 65:    MUL  3,4,3	Op * 
* Param  1
 66:     ST  3,-2(1)	Push parameter 
* TOFF dec:  -3
* Param end  output
 67:    LDA  1,-2(1)	Ghost frame becomes new active frame 
 68:    LDA  3,1(7)	Return address in ac 
 69:    JMP  7,-64(7)	call output
 70:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set:  -2
* EXPRESSION
* CALL  outnl
 71:     ST  1,-2(1)	Store fp in ghost frame for  outnl
* TOFF dec:  -3
* TOFF dec:  -4
* Param end  outnl
 72:    LDA  1,-2(1)	Ghost frame becomes new active frame 
 73:    LDA  3,1(7)	Return address in ac 
 74:    JMP  7,-41(7)	call outnl
 75:    LDA  3,0(2)	save the result in ac 
* Call end  outnl
* TOFF set:  -2
* END COMPOUND
* Add standard closing in case there is no return statement
 76:    LDC  2,0(6)	Set return value to 0 
 77:     LD  3,-1(1)	Load return address 
 78:     LD  1,0(1)	Adjust frame pointer 
 79:    JMP  7,0(3)	Return 
* END FUNCTION main
* =========================================
* INIT
 80:    LDA  1,0(0)	Set first frame at end of globals 
 81:     ST  1,0(1)	Store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
 82:    LDA  3,1(7)	Return address in ac 
 83:    JMP  7,-39(7)	Jump to main 
 84:   HALT  0,0(0)	DONE! 
* END INIT
