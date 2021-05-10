* C- version: 1.00
* by Sydney Petrehn
* Input file: d02.c-
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
* EXPRESSION
* EXPRESSION
* EXPRESSION
* ASSIGN  =
 41:    LDC  3,88(6)	Load integer constant 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* ASSIGN  =
 42:    LDC  3,3(6)	Load integer constant 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* CALL  output
 43:     ST  1,-13(1)	Store fp in ghost frame for  output
* TOFF dec:  -14
* TOFF dec:  -15
* EXPRESSION
* EXPRESSION
 44:    LDC  3,755(6)	Load integer constant 
 45:     ST  3,-15(1)	Push left side 
* EXPRESSION
* EXPRESSION
 46:    LDC  3,88(6)	Load integer constant 
* EXPRESSION
 47:    LDC  3,3(6)	Load integer constant 
* OP  *
 48:     LD  4,-15(1)	Pop left into ac1 
 49:    MUL  3,4,3	Op * 
* OP  +
 50:     LD  4,-15(1)	Pop left into ac1 
 51:    ADD  3,4,3	Op + 
* Param  1
 52:     ST  3,-15(1)	Push parameter 
* TOFF dec:  -16
* Param end  output
 53:    LDA  1,-13(1)	Ghost frame becomes new active frame 
 54:    LDA  3,1(7)	Return address in ac 
 55:    JMP  7,-50(7)	call output
 56:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set:  -13
* EXPRESSION
* CALL  output
 57:     ST  1,-13(1)	Store fp in ghost frame for  output
* TOFF dec:  -14
* TOFF dec:  -15
* EXPRESSION
* EXPRESSION
* EXPRESSION
 58:    LDC  3,755(6)	Load integer constant 
* EXPRESSION
 59:    LDC  3,88(6)	Load integer constant 
* OP  *
 60:     LD  4,-15(1)	Pop left into ac1 
 61:    MUL  3,4,3	Op * 
* EXPRESSION
 62:    LDC  3,3(6)	Load integer constant 
* OP  +
 63:     LD  4,-15(1)	Pop left into ac1 
 64:    ADD  3,4,3	Op + 
* Param  2
 65:     ST  3,-15(1)	Push parameter 
* TOFF dec:  -16
* Param end  output
 66:    LDA  1,-13(1)	Ghost frame becomes new active frame 
 67:    LDA  3,1(7)	Return address in ac 
 68:    JMP  7,-63(7)	call output
 69:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set:  -13
* EXPRESSION
* CALL  output
 70:     ST  1,-13(1)	Store fp in ghost frame for  output
* TOFF dec:  -14
* TOFF dec:  -15
* EXPRESSION
* EXPRESSION
* EXPRESSION
 71:    LDC  3,755(6)	Load integer constant 
* EXPRESSION
 72:    LDC  3,88(6)	Load integer constant 
* OP  -
 73:     LD  4,-15(1)	Pop left into ac1 
 74:    SUB  3,4,3	Op - 
* EXPRESSION
 75:    LDC  3,3(6)	Load integer constant 
* OP  -
 76:     LD  4,-15(1)	Pop left into ac1 
 77:    SUB  3,4,3	Op - 
* Param  3
 78:     ST  3,-15(1)	Push parameter 
* TOFF dec:  -16
* Param end  output
 79:    LDA  1,-13(1)	Ghost frame becomes new active frame 
 80:    LDA  3,1(7)	Return address in ac 
 81:    JMP  7,-76(7)	call output
 82:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set:  -13
* EXPRESSION
* CALL  output
 83:     ST  1,-13(1)	Store fp in ghost frame for  output
* TOFF dec:  -14
* TOFF dec:  -15
* EXPRESSION
* EXPRESSION
* EXPRESSION
 84:    LDC  3,755(6)	Load integer constant 
* EXPRESSION
 85:    LDC  3,88(6)	Load integer constant 
* OP  /
 86:     LD  4,-15(1)	Pop left into ac1 
 87:    DIV  3,4,3	Op / 
* EXPRESSION
 88:    LDC  3,3(6)	Load integer constant 
* OP  /
 89:     LD  4,-15(1)	Pop left into ac1 
 90:    DIV  3,4,3	Op / 
* Param  4
 91:     ST  3,-15(1)	Push parameter 
* TOFF dec:  -16
* Param end  output
 92:    LDA  1,-13(1)	Ghost frame becomes new active frame 
 93:    LDA  3,1(7)	Return address in ac 
 94:    JMP  7,-89(7)	call output
 95:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set:  -13
* EXPRESSION
* CALL  output
 96:     ST  1,-13(1)	Store fp in ghost frame for  output
* TOFF dec:  -14
* TOFF dec:  -15
* EXPRESSION
* EXPRESSION
* EXPRESSION
 97:    LDC  3,755(6)	Load integer constant 
* EXPRESSION
 98:    LDC  3,88(6)	Load integer constant 
* OP  *
 99:     LD  4,-15(1)	Pop left into ac1 
100:    MUL  3,4,3	Op * 
* EXPRESSION
* EXPRESSION
101:    LDC  3,3(6)	Load integer constant 
* EXPRESSION
102:    LDC  3,3(6)	Load integer constant 
* OP  *
103:     LD  4,-15(1)	Pop left into ac1 
104:    MUL  3,4,3	Op * 
* OP  +
105:     LD  4,-15(1)	Pop left into ac1 
106:    ADD  3,4,3	Op + 
* Param  5
107:     ST  3,-15(1)	Push parameter 
* TOFF dec:  -16
* Param end  output
108:    LDA  1,-13(1)	Ghost frame becomes new active frame 
109:    LDA  3,1(7)	Return address in ac 
110:    JMP  7,-105(7)	call output
111:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set:  -13
* EXPRESSION
* CALL  output
112:     ST  1,-13(1)	Store fp in ghost frame for  output
* TOFF dec:  -14
* TOFF dec:  -15
* EXPRESSION
* EXPRESSION
* EXPRESSION
113:    LDC  3,755(6)	Load integer constant 
* EXPRESSION
114:    LDC  3,88(6)	Load integer constant 
* OP  %
115:     LD  4,-15(1)	Pop left into ac1 
116:    MOD  3,4,3	Op % 
* EXPRESSION
117:    LDC  3,3(6)	Load integer constant 
* OP  %
118:     LD  4,-15(1)	Pop left into ac1 
119:    MOD  3,4,3	Op % 
* Param  6
120:     ST  3,-15(1)	Push parameter 
* TOFF dec:  -16
* Param end  output
121:    LDA  1,-13(1)	Ghost frame becomes new active frame 
122:    LDA  3,1(7)	Return address in ac 
123:    JMP  7,-118(7)	call output
124:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set:  -13
* EXPRESSION
* CALL  output
125:     ST  1,-13(1)	Store fp in ghost frame for  output
* TOFF dec:  -14
* TOFF dec:  -15
* EXPRESSION
* EXPRESSION
* EXPRESSION
126:    LDC  3,755(6)	Load integer constant 
* OP  chsign
127:    NEG  3,3,3	Op Unary - 
* EXPRESSION
* EXPRESSION
128:    LDC  3,88(6)	Load integer constant 
* EXPRESSION
129:    LDC  3,3(6)	Load integer constant 
* OP  *
130:     LD  4,-15(1)	Pop left into ac1 
131:    MUL  3,4,3	Op * 
* OP  +
132:     LD  4,-15(1)	Pop left into ac1 
133:    ADD  3,4,3	Op + 
* Param  7
134:     ST  3,-15(1)	Push parameter 
* TOFF dec:  -16
* Param end  output
135:    LDA  1,-13(1)	Ghost frame becomes new active frame 
136:    LDA  3,1(7)	Return address in ac 
137:    JMP  7,-132(7)	call output
138:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set:  -13
* EXPRESSION
* CALL  outnl
139:     ST  1,-13(1)	Store fp in ghost frame for  outnl
* TOFF dec:  -14
* TOFF dec:  -15
* Param end  outnl
140:    LDA  1,-13(1)	Ghost frame becomes new active frame 
141:    LDA  3,1(7)	Return address in ac 
142:    JMP  7,-109(7)	call outnl
143:    LDA  3,0(2)	save the result in ac 
* Call end  outnl
* TOFF set:  -13
* END COMPOUND
* Add standard closing in case there is no return statement
144:    LDC  2,0(6)	Set return value to 0 
145:     LD  3,-1(1)	Load return address 
146:     LD  1,0(1)	Adjust frame pointer 
147:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,147(7)	Jump to init [backpatch] 
* =========================================
* INIT
148:    LDA  1,0(0)	Set first frame at end of globals 
149:     ST  1,0(1)	Store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
150:    LDA  3,1(7)	Return address in ac 
151:    JMP  7,-113(7)	Jump to main 
152:   HALT  0,0(0)	DONE! 
* END INIT
