* C- version: 1.00
* by Sydney Petrehn
* Input file: g09.c-
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
* PARM
* COMPOUND
* TOFF set:  -14
* Compound body
* Return
* EXPRESSION
* EXPRESSION
 40:    LDC  3,77(6)	Load integer constant 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  (null)
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  (null)
* OP  *
 41:     LD  4,-14(1)	Pop left into ac1 
 42:    MUL  3,4,3	Op * 
* OP  +
 43:     LD  4,-14(1)	Pop left into ac1 
 44:    ADD  3,4,3	Op + 
* END COMPOUND
* Add standard closing in case there is no return statement
 45:    LDC  2,0(6)	Set return value to 0 
 46:     LD  3,-1(1)	Load return address 
 47:     LD  1,0(1)	Adjust frame pointer 
 48:    JMP  7,0(3)	Return 
* END FUNCTION cat
* FUNCTION main
* TOFF set:  -2
 49:     ST  3,-1(1)	store return address 
* COMPOUND
* TOFF set:  -15
* Compound body
* Var
 50:    LDC  3,10(6)	Load size of array z
 51:     ST  3,-2(1)	store return address 
* EXPRESSION
* ASSIGN  =
 52:    LDC  3,3(6)	Load integer constant 
 53:     ST  3,-15(1)	Push index 
 54:    LDC  3,445(6)	Load integer constant 
 55:     LD  4,-15(1)	Pop index 
 56:    LDA  5,-3(1)	Load address of base of array z
 57:    SUB  5,5,4	Compute offset of value 
 58:     ST  3,0(5)	Store variable z
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  (null)
* EXPRESSION
* EXPRESSION
* CALL  output
 59:     ST  1,-15(1)	Store fp in ghost frame for  output
* TOFF dec:  -16
* TOFF dec:  -17
 60:    LDA  3,-3(1)	Load address of base of array z
 61:     ST  3,-17(1)	Push left side 
* EXPRESSION
* EXPRESSION
* CALL  cat
 62:     ST  1,-17(1)	Store fp in ghost frame for  cat
* TOFF dec:  -18
* TOFF dec:  -19
* EXPRESSION
* Param  2
 63:     LD  3,-3(1)	Load variable  z
 64:     ST  3,-19(1)	Push parameter 
* TOFF dec:  -20
* EXPRESSION
 65:    LDC  3,3(6)	Load integer constant 
* Param end  cat
 66:    LDA  1,-17(1)	Ghost frame becomes new active frame 
 67:    LDA  3,1(7)	Return address in ac 
 68:    JMP  7,-30(7)	call cat
 69:    LDA  3,0(2)	save the result in ac 
* Call end  cat
* TOFF set:  -17
* EXPRESSION
 70:    LDC  3,100(6)	Load integer constant 
* OP  %
 71:     LD  4,-17(1)	Pop left into ac1 
 72:    MOD  3,4,3	Op % 
* Param  2
 73:     ST  3,-17(1)	Push parameter 
* TOFF dec:  -18
* Param end  output
 74:    LDA  1,-17(1)	Ghost frame becomes new active frame 
 75:    LDA  3,1(7)	Return address in ac 
 76:    JMP  7,-71(7)	call output
 77:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set:  -17
* END COMPOUND
* Add standard closing in case there is no return statement
 78:    LDC  2,0(6)	Set return value to 0 
 79:     LD  3,-1(1)	Load return address 
 80:     LD  1,0(1)	Adjust frame pointer 
 81:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,81(7)	Jump to init [backpatch] 
* =========================================
* INIT
 82:    LDA  1,0(0)	Set first frame at end of globals 
 83:     ST  1,0(1)	Store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
 84:    LDA  3,1(7)	Return address in ac 
 85:    JMP  7,-37(7)	Jump to main 
 86:   HALT  0,0(0)	DONE! 
* END INIT
