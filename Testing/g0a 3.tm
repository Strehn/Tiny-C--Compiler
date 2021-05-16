* C- version: 1.00
* by Sydney Petrehn
* Input file: g0a.c-
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
* TOFF set:  -5
* Compound body
* Return
* EXPRESSION
* END COMPOUND
* Add standard closing in case there is no return statement
 40:    LDC  2,0(6)	Set return value to 0 
 41:     LD  3,-1(1)	Load return address 
 42:     LD  1,0(1)	Adjust frame pointer 
 43:    JMP  7,0(3)	Return 
* END FUNCTION cat
* FUNCTION main
* TOFF set:  -2
 44:     ST  3,-1(1)	store return address 
* COMPOUND
* TOFF set:  -15
* Compound body
* Var
 45:    LDC  3,10(6)	Load size of array z
 46:     ST  3,-2(1)	store return address 
* EXPRESSION
* ASSIGN  =
 47:    LDC  3,3(6)	Load integer constant 
 48:     ST  3,-15(1)	Push index 
 49:    LDC  3,445(6)	Load integer constant 
 50:     LD  4,-15(1)	Pop index 
 51:    LDA  5,-3(1)	Load address of base of array z
 52:    SUB  5,5,4	Compute offset of value 
 53:     ST  3,0(5)	Store variable z
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  (null)
* EXPRESSION
* EXPRESSION
* CALL  output
 54:     ST  1,-15(1)	Store fp in ghost frame for  output
* TOFF dec:  -16
* TOFF dec:  -17
* EXPRESSION
* EXPRESSION
* EXPRESSION
* CALL  cat
 55:     ST  1,-17(1)	Store fp in ghost frame for  cat
* TOFF dec:  -18
* TOFF dec:  -19
* EXPRESSION
 56:    LDC  3,3(6)	Load integer constant 
* Param  2
 57:     ST  3,-19(1)	Push parameter 
* TOFF dec:  -20
* Param end  cat
 58:    LDA  1,-17(1)	Ghost frame becomes new active frame 
 59:    LDA  3,1(7)	Return address in ac 
 60:    JMP  7,-22(7)	call cat
 61:    LDA  3,0(2)	save the result in ac 
* Call end  cat
* TOFF set:  -17
* OP  (null)
* Param  2
 62:     ST  3,-17(1)	Push parameter 
* TOFF dec:  -18
* Param end  output
 63:    LDA  1,-17(1)	Ghost frame becomes new active frame 
 64:    LDA  3,1(7)	Return address in ac 
 65:    JMP  7,-60(7)	call output
 66:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set:  -17
* END COMPOUND
* Add standard closing in case there is no return statement
 67:    LDC  2,0(6)	Set return value to 0 
 68:     LD  3,-1(1)	Load return address 
 69:     LD  1,0(1)	Adjust frame pointer 
 70:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,70(7)	Jump to init [backpatch] 
* =========================================
* INIT
 71:    LDA  1,0(0)	Set first frame at end of globals 
 72:     ST  1,0(1)	Store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
 73:    LDA  3,1(7)	Return address in ac 
 74:    JMP  7,-31(7)	Jump to main 
 75:   HALT  0,0(0)	DONE! 
* END INIT
