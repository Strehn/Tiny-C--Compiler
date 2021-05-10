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
 57:    LDC  3,0(6)	Load integer constant 
* OP  and
 58:     LD  4,-7(1)	Pop left into ac1 
 59:    AND  3,4,3	Op & 
* EXPRESSION
* CALL  outputb
 60:     ST  1,-7(1)	Store fp in ghost frame for  outputb
* TOFF dec:  -8
* TOFF dec:  -9
* EXPRESSION
* Param  1
 61:     LD  3,-2(1)	Load variable  x
 62:     ST  3,-9(1)	Push parameter 
* TOFF dec:  -10
* Param end  outputb
 63:    LDA  1,-7(1)	Ghost frame becomes new active frame 
 64:    LDA  3,1(7)	Return address in ac 
 65:    JMP  7,-49(7)	call outputb
 66:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set:  -7
* EXPRESSION
* ASSIGN  =
 67:     ST  3,-2(1)	Store variable x
* EXPRESSION
* EXPRESSION
* EXPRESSION
* CALL  cat
 68:     ST  1,-8(1)	Store fp in ghost frame for  cat
* TOFF dec:  -9
* TOFF dec:  -10
* Param end  cat
 69:    LDA  1,-8(1)	Ghost frame becomes new active frame 
 70:    LDA  3,1(7)	Return address in ac 
 71:    JMP  7,-33(7)	call cat
 72:    LDA  3,0(2)	save the result in ac 
* Call end  cat
* TOFF set:  -8
* EXPRESSION
 73:    LDC  3,0(6)	Load integer constant 
* OP  or
 74:     LD  4,-8(1)	Pop left into ac1 
 75:     OR  3,4,3	Op | 
* EXPRESSION
* CALL  outputb
 76:     ST  1,-8(1)	Store fp in ghost frame for  outputb
* TOFF dec:  -9
* TOFF dec:  -10
* EXPRESSION
* Param  2
 77:     LD  3,-2(1)	Load variable  x
 78:     ST  3,-10(1)	Push parameter 
* TOFF dec:  -11
* Param end  outputb
 79:    LDA  1,-8(1)	Ghost frame becomes new active frame 
 80:    LDA  3,1(7)	Return address in ac 
 81:    JMP  7,-65(7)	call outputb
 82:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set:  -8
* EXPRESSION
* ASSIGN  =
 83:     ST  3,-2(1)	Store variable x
* EXPRESSION
* EXPRESSION
* EXPRESSION
* CALL  cat
 84:     ST  1,-9(1)	Store fp in ghost frame for  cat
* TOFF dec:  -10
* TOFF dec:  -11
* Param end  cat
 85:    LDA  1,-9(1)	Ghost frame becomes new active frame 
 86:    LDA  3,1(7)	Return address in ac 
 87:    JMP  7,-49(7)	call cat
 88:    LDA  3,0(2)	save the result in ac 
* Call end  cat
* TOFF set:  -9
* OP  not
 89:    LDC  4,1(6)	Load 1 
 90:    XOR  3,3,4	Logical not 
* EXPRESSION
* CALL  outputb
 91:     ST  1,-9(1)	Store fp in ghost frame for  outputb
* TOFF dec:  -10
* TOFF dec:  -11
* EXPRESSION
* Param  3
 92:     LD  3,-2(1)	Load variable  x
 93:     ST  3,-11(1)	Push parameter 
* TOFF dec:  -12
* Param end  outputb
 94:    LDA  1,-9(1)	Ghost frame becomes new active frame 
 95:    LDA  3,1(7)	Return address in ac 
 96:    JMP  7,-80(7)	call outputb
 97:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set:  -9
* EXPRESSION
* CALL  outnl
 98:     ST  1,-9(1)	Store fp in ghost frame for  outnl
* TOFF dec:  -10
* TOFF dec:  -11
* Param end  outnl
 99:    LDA  1,-9(1)	Ghost frame becomes new active frame 
100:    LDA  3,1(7)	Return address in ac 
101:    JMP  7,-68(7)	call outnl
102:    LDA  3,0(2)	save the result in ac 
* Call end  outnl
* TOFF set:  -9
* END COMPOUND
* Add standard closing in case there is no return statement
103:    LDC  2,0(6)	Set return value to 0 
104:     LD  3,-1(1)	Load return address 
105:     LD  1,0(1)	Adjust frame pointer 
106:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,106(7)	Jump to init [backpatch] 
* =========================================
* INIT
107:    LDA  1,0(0)	Set first frame at end of globals 
108:     ST  1,0(1)	Store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
109:    LDA  3,1(7)	Return address in ac 
110:    JMP  7,-61(7)	Jump to main 
111:   HALT  0,0(0)	DONE! 
* END INIT
