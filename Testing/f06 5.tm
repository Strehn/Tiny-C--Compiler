* C- version: 1.00
* by Sydney Petrehn
* Input file: f06.c-
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
 40:    LDC  3,1(6)	Load integer constant 
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
* TOFF set:  -5
* Compound body
* Var
* EXPRESSION
* ASSIGN  =
 46:     ST  3,-2(1)	Store variable x
* EXPRESSION
* EXPRESSION
* EXPRESSION
* CALL  cat
 47:     ST  1,-7(1)	Store fp in ghost frame for  cat
* TOFF dec:  -8
* TOFF dec:  -9
* Param end  cat
 48:    LDA  1,-7(1)	Ghost frame becomes new active frame 
 49:    LDA  3,1(7)	Return address in ac 
 50:    JMP  7,-12(7)	call cat
 51:    LDA  3,0(2)	save the result in ac 
* Call end  cat
* TOFF set:  -7
* EXPRESSION
 52:    LDC  3,0(6)	Load integer constant 
* OP  and
 53:     LD  4,-7(1)	Pop left into ac1 
 54:    AND  3,4,3	Op & 
* EXPRESSION
* CALL  outputb
 55:     ST  1,-7(1)	Store fp in ghost frame for  outputb
* TOFF dec:  -8
* TOFF dec:  -9
* EXPRESSION
* Param  1
 56:     LD  3,-2(1)	Load variable  x
 57:     ST  3,-9(1)	Push parameter 
* TOFF dec:  -10
* Param end  outputb
 58:    LDA  1,-7(1)	Ghost frame becomes new active frame 
 59:    LDA  3,1(7)	Return address in ac 
 60:    JMP  7,-43(7)	call outputb
 61:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set:  -7
* EXPRESSION
* ASSIGN  =
 62:     ST  3,-2(1)	Store variable x
* EXPRESSION
* EXPRESSION
* EXPRESSION
* CALL  cat
 63:     ST  1,-8(1)	Store fp in ghost frame for  cat
* TOFF dec:  -9
* TOFF dec:  -10
* Param end  cat
 64:    LDA  1,-8(1)	Ghost frame becomes new active frame 
 65:    LDA  3,1(7)	Return address in ac 
 66:    JMP  7,-28(7)	call cat
 67:    LDA  3,0(2)	save the result in ac 
* Call end  cat
* TOFF set:  -8
* EXPRESSION
 68:    LDC  3,0(6)	Load integer constant 
* OP  or
 69:     LD  4,-8(1)	Pop left into ac1 
 70:     OR  3,4,3	Op | 
* EXPRESSION
* CALL  outputb
 71:     ST  1,-8(1)	Store fp in ghost frame for  outputb
* TOFF dec:  -9
* TOFF dec:  -10
* EXPRESSION
* Param  2
 72:     LD  3,-2(1)	Load variable  x
 73:     ST  3,-10(1)	Push parameter 
* TOFF dec:  -11
* Param end  outputb
 74:    LDA  1,-8(1)	Ghost frame becomes new active frame 
 75:    LDA  3,1(7)	Return address in ac 
 76:    JMP  7,-59(7)	call outputb
 77:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set:  -8
* EXPRESSION
* ASSIGN  =
 78:     ST  3,-2(1)	Store variable x
* EXPRESSION
* EXPRESSION
* EXPRESSION
* CALL  cat
 79:     ST  1,-9(1)	Store fp in ghost frame for  cat
* TOFF dec:  -10
* TOFF dec:  -11
* Param end  cat
 80:    LDA  1,-9(1)	Ghost frame becomes new active frame 
 81:    LDA  3,1(7)	Return address in ac 
 82:    JMP  7,-44(7)	call cat
 83:    LDA  3,0(2)	save the result in ac 
* Call end  cat
* TOFF set:  -9
* OP  not
 84:    LDC  4,1(6)	Load 1 
 85:    XOR  3,3,4	Logical not 
* EXPRESSION
* CALL  outputb
 86:     ST  1,-9(1)	Store fp in ghost frame for  outputb
* TOFF dec:  -10
* TOFF dec:  -11
* EXPRESSION
* Param  3
 87:     LD  3,-2(1)	Load variable  x
 88:     ST  3,-11(1)	Push parameter 
* TOFF dec:  -12
* Param end  outputb
 89:    LDA  1,-9(1)	Ghost frame becomes new active frame 
 90:    LDA  3,1(7)	Return address in ac 
 91:    JMP  7,-74(7)	call outputb
 92:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set:  -9
* EXPRESSION
* CALL  outnl
 93:     ST  1,-9(1)	Store fp in ghost frame for  outnl
* TOFF dec:  -10
* TOFF dec:  -11
* Param end  outnl
 94:    LDA  1,-9(1)	Ghost frame becomes new active frame 
 95:    LDA  3,1(7)	Return address in ac 
 96:    JMP  7,-62(7)	call outnl
 97:    LDA  3,0(2)	save the result in ac 
* Call end  outnl
* TOFF set:  -9
* END COMPOUND
* Add standard closing in case there is no return statement
 98:    LDC  2,0(6)	Set return value to 0 
 99:     LD  3,-1(1)	Load return address 
100:     LD  1,0(1)	Adjust frame pointer 
101:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,101(7)	Jump to init [backpatch] 
* =========================================
* INIT
102:    LDA  1,0(0)	Set first frame at end of globals 
103:     ST  1,0(1)	Store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
104:    LDA  3,1(7)	Return address in ac 
105:    JMP  7,-61(7)	Jump to main 
106:   HALT  0,0(0)	DONE! 
* END INIT
