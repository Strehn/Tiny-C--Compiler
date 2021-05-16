* C- version: 1.00
* by Sydney Petrehn
* Input file: g06.c-
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
* COMPOUND
* TOFF set:  -13
* Compound body
* Return
* EXPRESSION
* EXPRESSION
* EXPRESSION
 40:    LDC  3,3(6)	Load integer constant 
* OP  (null)
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
* TOFF set:  -15
* Compound body
* Var
 46:    LDC  3,10(6)	Load size of array z
 47:     ST  3,-2(1)	store return address 
* EXPRESSION
* ASSIGN  =
 48:    LDC  3,3(6)	Load integer constant 
 49:     ST  3,-15(1)	Push index 
 50:    LDC  3,445(6)	Load integer constant 
 51:     LD  4,-15(1)	Pop index 
 52:    LDA  5,-3(1)	Load address of base of array z
 53:    SUB  5,5,4	Compute offset of value 
 54:     ST  3,0(5)	Store variable z
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  (null)
* EXPRESSION
* EXPRESSION
* CALL  output
 55:     ST  1,-15(1)	Store fp in ghost frame for  output
* TOFF dec:  -16
* TOFF dec:  -17
* EXPRESSION
* CALL  cat
 56:     ST  1,-17(1)	Store fp in ghost frame for  cat
* TOFF dec:  -18
* TOFF dec:  -19
* EXPRESSION
* Param  2
 57:     LD  3,-3(1)	Load variable  z
 58:     ST  3,-19(1)	Push parameter 
* TOFF dec:  -20
* Param end  cat
 59:    LDA  1,-17(1)	Ghost frame becomes new active frame 
 60:    LDA  3,1(7)	Return address in ac 
 61:    JMP  7,-23(7)	call cat
 62:    LDA  3,0(2)	save the result in ac 
* Call end  cat
* TOFF set:  -17
* Param  2
 63:     ST  3,-17(1)	Push parameter 
* TOFF dec:  -18
* Param end  output
 64:    LDA  1,-17(1)	Ghost frame becomes new active frame 
 65:    LDA  3,1(7)	Return address in ac 
 66:    JMP  7,-61(7)	call output
 67:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set:  -17
* END COMPOUND
* Add standard closing in case there is no return statement
 68:    LDC  2,0(6)	Set return value to 0 
 69:     LD  3,-1(1)	Load return address 
 70:     LD  1,0(1)	Adjust frame pointer 
 71:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,71(7)	Jump to init [backpatch] 
* =========================================
* INIT
 72:    LDA  1,0(0)	Set first frame at end of globals 
 73:     ST  1,0(1)	Store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
 74:    LDA  3,1(7)	Return address in ac 
 75:    JMP  7,-31(7)	Jump to main 
 76:   HALT  0,0(0)	DONE! 
* END INIT
