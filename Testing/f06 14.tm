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
 56:    LDC  3,0(6)	Load integer constant 
* OP  and
 57:     LD  4,-7(1)	Pop left into ac1 
 58:    AND  3,4,3	Op & 
* EXPRESSION
* CALL  outputb
 59:     ST  1,-7(1)	Store fp in ghost frame for  outputb
* TOFF dec:  -8
* TOFF dec:  -9
* EXPRESSION
* Param  1
 60:     LD  3,-2(1)	Load variable  x
 61:     ST  3,-9(1)	Push parameter 
* TOFF dec:  -10
* Param end  outputb
 62:    LDA  1,-7(1)	Ghost frame becomes new active frame 
 63:    LDA  3,1(7)	Return address in ac 
 64:    JMP  7,-48(7)	call outputb
 65:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set:  -7
* EXPRESSION
* ASSIGN  =
* EXPRESSION
* EXPRESSION
* EXPRESSION
* CALL  cat
 66:     ST  1,-8(1)	Store fp in ghost frame for  cat
* TOFF dec:  -9
* TOFF dec:  -10
* Param end  cat
 67:    LDA  1,-8(1)	Ghost frame becomes new active frame 
 68:    LDA  3,1(7)	Return address in ac 
 69:    JMP  7,-31(7)	call cat
 70:    LDA  3,0(2)	save the result in ac 
* Call end  cat
* TOFF set:  -8
* EXPRESSION
 71:    LDC  3,0(6)	Load integer constant 
* OP  or
 72:     LD  4,-8(1)	Pop left into ac1 
 73:     OR  3,4,3	Op | 
* EXPRESSION
* CALL  outputb
 74:     ST  1,-8(1)	Store fp in ghost frame for  outputb
* TOFF dec:  -9
* TOFF dec:  -10
* EXPRESSION
* Param  2
 75:     LD  3,-2(1)	Load variable  x
 76:     ST  3,-10(1)	Push parameter 
* TOFF dec:  -11
* Param end  outputb
 77:    LDA  1,-8(1)	Ghost frame becomes new active frame 
 78:    LDA  3,1(7)	Return address in ac 
 79:    JMP  7,-63(7)	call outputb
 80:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set:  -8
* EXPRESSION
* ASSIGN  =
* EXPRESSION
* EXPRESSION
* EXPRESSION
* CALL  cat
 81:     ST  1,-9(1)	Store fp in ghost frame for  cat
* TOFF dec:  -10
* TOFF dec:  -11
* Param end  cat
 82:    LDA  1,-9(1)	Ghost frame becomes new active frame 
 83:    LDA  3,1(7)	Return address in ac 
 84:    JMP  7,-46(7)	call cat
 85:    LDA  3,0(2)	save the result in ac 
* Call end  cat
* TOFF set:  -9
* OP  not
 86:    LDC  4,1(6)	Load 1 
 87:    XOR  3,3,4	Logical not 
* EXPRESSION
* CALL  outputb
 88:     ST  1,-9(1)	Store fp in ghost frame for  outputb
* TOFF dec:  -10
* TOFF dec:  -11
* EXPRESSION
* Param  3
 89:     LD  3,-2(1)	Load variable  x
 90:     ST  3,-11(1)	Push parameter 
* TOFF dec:  -12
* Param end  outputb
 91:    LDA  1,-9(1)	Ghost frame becomes new active frame 
 92:    LDA  3,1(7)	Return address in ac 
 93:    JMP  7,-77(7)	call outputb
 94:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set:  -9
* EXPRESSION
* CALL  outnl
 95:     ST  1,-9(1)	Store fp in ghost frame for  outnl
* TOFF dec:  -10
* TOFF dec:  -11
* Param end  outnl
 96:    LDA  1,-9(1)	Ghost frame becomes new active frame 
 97:    LDA  3,1(7)	Return address in ac 
 98:    JMP  7,-65(7)	call outnl
 99:    LDA  3,0(2)	save the result in ac 
* Call end  outnl
* TOFF set:  -9
* END COMPOUND
* Add standard closing in case there is no return statement
100:    LDC  2,0(6)	Set return value to 0 
101:     LD  3,-1(1)	Load return address 
102:     LD  1,0(1)	Adjust frame pointer 
103:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,103(7)	Jump to init [backpatch] 
* =========================================
* INIT
104:    LDA  1,0(0)	Set first frame at end of globals 
105:     ST  1,0(1)	Store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
106:    LDA  3,1(7)	Return address in ac 
107:    JMP  7,-58(7)	Jump to main 
108:   HALT  0,0(0)	DONE! 
* END INIT
