* C- version: 1.00
* by Sydney Petrehn
* Input file: g05.c-
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
* TOFF set:  -6
* Compound body
* Return
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  *
 40:     LD  4,-6(1)	Pop left into ac1 
 41:    MUL  3,4,3	Op * 
* EXPRESSION
* OP  -
 42:     LD  4,-6(1)	Pop left into ac1 
 43:    SUB  3,4,3	Op - 
* END COMPOUND
* Add standard closing in case there is no return statement
 44:    LDC  2,0(6)	Set return value to 0 
 45:     LD  3,-1(1)	Load return address 
 46:     LD  1,0(1)	Adjust frame pointer 
 47:    JMP  7,0(3)	Return 
* END FUNCTION cat
* FUNCTION main
* TOFF set:  -2
 48:     ST  3,-1(1)	store return address 
* COMPOUND
* TOFF set:  -15
* Compound body
* Var
 49:    LDC  3,10(6)	Load size of array z
 50:     ST  3,-2(1)	store return address 
* EXPRESSION
* ASSIGN  =
 51:    LDC  3,3(6)	Load integer constant 
 52:     ST  3,-15(1)	Push index 
 53:    LDC  3,445(6)	Load integer constant 
 54:     LD  4,-15(1)	Pop index 
 55:    LDA  5,-3(1)	Load address of base of array z
 56:    SUB  5,5,4	Compute offset of value 
 57:     ST  3,0(5)	Store variable z
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  (null)
* EXPRESSION
* EXPRESSION
* CALL  output
 58:     ST  1,-15(1)	Store fp in ghost frame for  output
* TOFF dec:  -16
* TOFF dec:  -17
 59:    LDA  3,-3(1)	Load address of base of array z
 60:     ST  3,-17(1)	Push left side 
 61:    LDC  3,3(6)	Load integer constant 
 62:     LD  4,-17(1)	Pop left into ac1 
 63:    SUB  3,4,3	Compute location from index 
 64:     LD  3,0(3)	Load array element 
 65:     ST  3,-17(1)	Push left side 
