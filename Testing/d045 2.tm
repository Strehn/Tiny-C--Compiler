* C- version: 1.00
* by Sydney Petrehn
* Input file: d045.c-
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
* TOFF set:  -2
* Compound body
* EXPRESSION
* CALL  outputb
 40:     ST  1,-2(1)	Store fp in ghost frame for  outputb
* TOFF dec:  -3
* TOFF dec:  -4
 41:     ST  3,-4(1)	Push left side 
* TOFF dec:  -5
 42:    LDC  3,333(6)	Load integer constant 
 43:     ST  3,-5(1)	Push left side 
* TOFF dec:  -6
 44:    LDC  3,333(6)	Load integer constant 
* TOFF dec:  -7
* EXPRESSION
* EXPRESSION
* EXPRESSION
 45:    LDC  3,111(6)	Load integer constant 
* EXPRESSION
 46:    LDC  3,222(6)	Load integer constant 
* OP  >
 47:     LD  4,-7(1)	Pop left into ac1 
 48:    TGT  3,4,3	Op > 
* EXPRESSION
* EXPRESSION
 49:    LDC  3,333(6)	Load integer constant 
* EXPRESSION
 50:    LDC  3,444(6)	Load integer constant 
* OP  <
 51:     LD  4,-7(1)	Pop left into ac1 
 52:    TLT  3,4,3	Op < 
* OP  and
 53:     LD  4,-7(1)	Pop left into ac1 
 54:    AND  3,4,3	Op & 
* Param  1
 55:     ST  3,-7(1)	Push parameter 
* TOFF dec:  -8
* Param end  outputb
 56:    LDA  1,-2(1)	Ghost frame becomes new active frame 
 57:    LDA  3,1(7)	Return address in ac 
 58:    JMP  7,-42(7)	call outputb
 59:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set:  -2
* END COMPOUND
* Add standard closing in case there is no return statement
 60:    LDC  2,0(6)	Set return value to 0 
 61:     LD  3,-1(1)	Load return address 
 62:     LD  1,0(1)	Adjust frame pointer 
 63:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,63(7)	Jump to init [backpatch] 
* =========================================
* INIT
 64:    LDA  1,0(0)	Set first frame at end of globals 
 65:     ST  1,0(1)	Store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
 66:    LDA  3,1(7)	Return address in ac 
 67:    JMP  7,-29(7)	Jump to main 
 68:   HALT  0,0(0)	DONE! 
* END INIT
