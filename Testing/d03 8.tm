* C- version: 1.00
* by Sydney Petrehn
* Input file: d03.c-
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
* TOFF set:  -7
* Compound body
* Var
* Var
* Var
* EXPRESSION
* ASSIGN  =
 40:    LDC  3,755(6)	Load integer constant 
 41:     ST  3,-2(1)	Store variable x
* EXPRESSION
* EXPRESSION
* EXPRESSION
* ASSIGN  =
 42:    LDC  3,88(6)	Load integer constant 
 43:     ST  3,-3(1)	Store variable y
* EXPRESSION
* EXPRESSION
* EXPRESSION
* ASSIGN  =
 44:    LDC  3,3(6)	Load integer constant 
 45:     ST  3,-4(1)	Store variable z
* EXPRESSION
* EXPRESSION
* EXPRESSION
* CALL  output
 46:     ST  1,-13(1)	Store fp in ghost frame for  output
* TOFF dec:  -14
* TOFF dec:  -15
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  *
 47:     LD  4,-15(1)	Pop left into ac1 
 48:    MUL  3,4,3	Op * 
* OP  +
 49:     LD  3,-2(1)	Load variable  x
 50:     ST  3,-15(1)	Push left side 
 51:     LD  4,-15(1)	Pop left into ac1 
 52:    ADD  3,4,3	Op + 
* Param  1
 53:     ST  3,-15(1)	Push parameter 
* TOFF dec:  -16
* Param end  output
 54:    LDA  1,-13(1)	Ghost frame becomes new active frame 
 55:    LDA  3,1(7)	Return address in ac 
 56:    JMP  7,-51(7)	call output
 57:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set:  -13
* EXPRESSION
* CALL  output
 58:     ST  1,-13(1)	Store fp in ghost frame for  output
* TOFF dec:  -14
* TOFF dec:  -15
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  *
 59:     LD  4,-15(1)	Pop left into ac1 
 60:    MUL  3,4,3	Op * 
* EXPRESSION
* OP  +
 61:     LD  3,-4(1)	Load variable  z
 62:     LD  4,-15(1)	Pop left into ac1 
 63:    ADD  3,4,3	Op + 
* Param  2
 64:     ST  3,-15(1)	Push parameter 
* TOFF dec:  -16
* Param end  output
 65:    LDA  1,-13(1)	Ghost frame becomes new active frame 
 66:    LDA  3,1(7)	Return address in ac 
 67:    JMP  7,-62(7)	call output
 68:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set:  -13
* EXPRESSION
* CALL  output
 69:     ST  1,-13(1)	Store fp in ghost frame for  output
* TOFF dec:  -14
* TOFF dec:  -15
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  -
 70:     LD  4,-15(1)	Pop left into ac1 
 71:    SUB  3,4,3	Op - 
* EXPRESSION
* OP  -
 72:     LD  4,-15(1)	Pop left into ac1 
 73:    SUB  3,4,3	Op - 
* Param  3
 74:     ST  3,-15(1)	Push parameter 
* TOFF dec:  -16
* Param end  output
 75:    LDA  1,-13(1)	Ghost frame becomes new active frame 
 76:    LDA  3,1(7)	Return address in ac 
 77:    JMP  7,-72(7)	call output
 78:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set:  -13
* EXPRESSION
* CALL  output
 79:     ST  1,-13(1)	Store fp in ghost frame for  output
* TOFF dec:  -14
* TOFF dec:  -15
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  /
 80:     LD  4,-15(1)	Pop left into ac1 
 81:    DIV  3,4,3	Op / 
* EXPRESSION
* OP  /
 82:     LD  4,-15(1)	Pop left into ac1 
 83:    DIV  3,4,3	Op / 
* Param  4
 84:     ST  3,-15(1)	Push parameter 
* TOFF dec:  -16
* Param end  output
 85:    LDA  1,-13(1)	Ghost frame becomes new active frame 
 86:    LDA  3,1(7)	Return address in ac 
 87:    JMP  7,-82(7)	call output
 88:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set:  -13
* EXPRESSION
* CALL  output
 89:     ST  1,-13(1)	Store fp in ghost frame for  output
* TOFF dec:  -14
* TOFF dec:  -15
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  *
 90:     LD  4,-15(1)	Pop left into ac1 
 91:    MUL  3,4,3	Op * 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  *
 92:     LD  4,-15(1)	Pop left into ac1 
 93:    MUL  3,4,3	Op * 
* OP  +
 94:     LD  4,-15(1)	Pop left into ac1 
 95:    ADD  3,4,3	Op + 
* Param  5
 96:     ST  3,-15(1)	Push parameter 
* TOFF dec:  -16
* Param end  output
 97:    LDA  1,-13(1)	Ghost frame becomes new active frame 
 98:    LDA  3,1(7)	Return address in ac 
 99:    JMP  7,-94(7)	call output
100:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set:  -13
* EXPRESSION
* CALL  output
101:     ST  1,-13(1)	Store fp in ghost frame for  output
* TOFF dec:  -14
* TOFF dec:  -15
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  %
102:     LD  4,-15(1)	Pop left into ac1 
103:    MOD  3,4,3	Op % 
* EXPRESSION
* OP  %
104:     LD  4,-15(1)	Pop left into ac1 
105:    MOD  3,4,3	Op % 
* Param  6
106:     ST  3,-15(1)	Push parameter 
* TOFF dec:  -16
* Param end  output
107:    LDA  1,-13(1)	Ghost frame becomes new active frame 
108:    LDA  3,1(7)	Return address in ac 
109:    JMP  7,-104(7)	call output
110:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set:  -13
* EXPRESSION
* CALL  output
111:     ST  1,-13(1)	Store fp in ghost frame for  output
* TOFF dec:  -14
* TOFF dec:  -15
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  chsign
112:    NEG  3,3,3	Op Unary - 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  *
113:     LD  4,-15(1)	Pop left into ac1 
114:    MUL  3,4,3	Op * 
* OP  +
115:     LD  4,-15(1)	Pop left into ac1 
116:    ADD  3,4,3	Op + 
* Param  7
117:     ST  3,-15(1)	Push parameter 
* TOFF dec:  -16
* Param end  output
118:    LDA  1,-13(1)	Ghost frame becomes new active frame 
119:    LDA  3,1(7)	Return address in ac 
120:    JMP  7,-115(7)	call output
121:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set:  -13
* EXPRESSION
* CALL  outnl
122:     ST  1,-13(1)	Store fp in ghost frame for  outnl
* TOFF dec:  -14
* TOFF dec:  -15
* Param end  outnl
123:    LDA  1,-13(1)	Ghost frame becomes new active frame 
124:    LDA  3,1(7)	Return address in ac 
125:    JMP  7,-92(7)	call outnl
126:    LDA  3,0(2)	save the result in ac 
* Call end  outnl
* TOFF set:  -13
* END COMPOUND
* Add standard closing in case there is no return statement
127:    LDC  2,0(6)	Set return value to 0 
128:     LD  3,-1(1)	Load return address 
129:     LD  1,0(1)	Adjust frame pointer 
130:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,130(7)	Jump to init [backpatch] 
* =========================================
* INIT
131:    LDA  1,0(0)	Set first frame at end of globals 
132:     ST  1,0(1)	Store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
133:    LDA  3,1(7)	Return address in ac 
134:    JMP  7,-96(7)	Jump to main 
135:   HALT  0,0(0)	DONE! 
* END INIT
