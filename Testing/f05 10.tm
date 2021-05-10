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
 44:    LMP  7,0(3)	Return 
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
 51:     ST  3,-2(1)	Store variable x
* EXPRESSION
* EXPRESSION
* CALL  cat
 52:     ST  1,-7(1)	Store fp in ghost frame for  cat
* TOFF dec:  -8
* TOFF dec:  -9
* Param end  cat
 53:    LDA  1,-7(1)	Ghost frame becomes new active frame 
 54:    LDA  3,1(7)	Return address in ac 
 55:    JMP  7,-17(7)	call cat
 56:    LDA  3,0(2)	save the result in ac 
* Call end  cat
* TOFF set:  -7
* EXPRESSION
* CALL  outputb
 57:     ST  1,-7(1)	Store fp in ghost frame for  outputb
* TOFF dec:  -8
* TOFF dec:  -9
* EXPRESSION
* Param  1
 58:     LD  3,-2(1)	Load variable  x
 59:     ST  3,-9(1)	Push parameter 
* TOFF dec:  -10
* Param end  outputb
 60:    LDA  1,-7(1)	Ghost frame becomes new active frame 
 61:    LDA  3,1(7)	Return address in ac 
 62:    JMP  7,-46(7)	call outputb
 63:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set:  -7
* END COMPOUND
* Add standard closing in case there is no return statement
 64:    LDC  2,0(6)	Set return value to 0 
 65:     LD  3,-1(1)	Load return address 
 66:     LD  1,0(1)	Adjust frame pointer 
 67:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,67(7)	Jump to init [backpatch] 
* =========================================
* INIT
 68:    LDA  1,0(0)	Set first frame at end of globals 
 69:     ST  1,0(1)	Store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
 70:    LDA  3,1(7)	Return address in ac 
 71:    JMP  7,-22(7)	Jump to main 
 72:   HALT  0,0(0)	DONE! 
* END INIT
