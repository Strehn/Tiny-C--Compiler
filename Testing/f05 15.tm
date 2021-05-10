* C- version: 1.00
* by Sydney Petrehn
* Input file: f05.c-
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
 40:    LDC  3,1(6)	Load integer constant 
 41:    LDA  2,0(3)	copy result to return register 
 42:     LD  3,-1(1)	Load return address 
 43:     LD  1,0(1)	Adjust fp 
 44:    JMP  7,0(3)	Return 
* EXPRESSION
 45:    LDC  3,1(6)	Load integer constant 
* END COMPOUND
* Add standard closing in case there is no return statement
 46:    LDC  2,0(6)	Set return value to 0 
 47:     LD  3,-1(1)	Load return address 
 48:     LD  1,0(1)	Adjust frame pointer 
 49:    JMP  7,0(3)	Return 
* END FUNCTION cat
* FUNCTION main
* TOFF set:  -2
 50:     ST  3,-1(1)	store return address 
* COMPOUND
* TOFF set:  -5
* Compound body
* Var
* EXPRESSION
* ASSIGN  =
* EXPRESSION
* EXPRESSION
* CALL  cat
 51:     ST  1,-7(1)	Store fp in ghost frame for  cat
* TOFF dec:  -8
* TOFF dec:  -9
* Param end  cat
 52:    LDA  1,-7(1)	Ghost frame becomes new active frame 
 53:    LDA  3,1(7)	Return address in ac 
 54:    JMP  7,-16(7)	call cat
 55:    LDA  3,0(2)	save the result in ac 
* Call end  cat
* TOFF set:  -7
* EXPRESSION
* CALL  outputb
 56:     ST  1,-7(1)	Store fp in ghost frame for  outputb
* TOFF dec:  -8
* TOFF dec:  -9
* EXPRESSION
* Param  1
 57:     LD  3,-2(1)	Load variable  x
 58:     ST  3,-9(1)	Push parameter 
* TOFF dec:  -10
* Param end  outputb
 59:    LDA  1,-7(1)	Ghost frame becomes new active frame 
 60:    LDA  3,1(7)	Return address in ac 
 61:    JMP  7,-45(7)	call outputb
 62:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set:  -7
* END COMPOUND
* Add standard closing in case there is no return statement
 63:    LDC  2,0(6)	Set return value to 0 
 64:     LD  3,-1(1)	Load return address 
 65:     LD  1,0(1)	Adjust frame pointer 
 66:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,66(7)	Jump to init [backpatch] 
* =========================================
* INIT
 67:    LDA  1,0(0)	Set first frame at end of globals 
 68:     ST  1,0(1)	Store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
 69:    LDA  3,1(7)	Return address in ac 
 70:    JMP  7,-21(7)	Jump to main 
 71:   HALT  0,0(0)	DONE! 
* END INIT
