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
 47:    LDC  3,755(6)	Load integer constant 
 48:     ST  3,-15(1)	Push left side 
* EXPRESSION
* EXPRESSION
 49:    LDC  3,88(6)	Load integer constant 
* EXPRESSION
 50:    LDC  3,3(6)	Load integer constant 
* OP  *
 51:     LD  4,-15(1)	Pop left into ac1 
 52:    MUL  3,4,3	Op * 
* OP  +
 53:     LD  4,-15(1)	Pop left into ac1 
 54:    ADD  3,4,3	Op + 
* Param  1
 55:     ST  3,-15(1)	Push parameter 
* TOFF dec:  -16
* Param end  output
 56:    LDA  1,-13(1)	Ghost frame becomes new active frame 
 57:    LDA  3,1(7)	Return address in ac 
 58:    JMP  7,-53(7)	call output
 59:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set:  -13
* EXPRESSION
* CALL  output
 60:     ST  1,-13(1)	Store fp in ghost frame for  output
* TOFF dec:  -14
* TOFF dec:  -15
* EXPRESSION
* EXPRESSION
* EXPRESSION
 61:    LDC  3,755(6)	Load integer constant 
* EXPRESSION
 62:    LDC  3,88(6)	Load integer constant 
* OP  *
 63:     LD  4,-15(1)	Pop left into ac1 
 64:    MUL  3,4,3	Op * 
* EXPRESSION
 65:    LDC  3,3(6)	Load integer constant 
* OP  +
 66:     LD  4,-15(1)	Pop left into ac1 
 67:    ADD  3,4,3	Op + 
* Param  2
 68:     ST  3,-15(1)	Push parameter 
* TOFF dec:  -16
* Param end  output
 69:    LDA  1,-13(1)	Ghost frame becomes new active frame 
 70:    LDA  3,1(7)	Return address in ac 
 71:    JMP  7,-66(7)	call output
 72:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set:  -13
* EXPRESSION
* CALL  output
 73:     ST  1,-13(1)	Store fp in ghost frame for  output
* TOFF dec:  -14
* TOFF dec:  -15
* EXPRESSION
* EXPRESSION
* EXPRESSION
 74:    LDC  3,755(6)	Load integer constant 
* EXPRESSION
 75:    LDC  3,88(6)	Load integer constant 
* OP  -
 76:     LD  4,-15(1)	Pop left into ac1 
 77:    SUB  3,4,3	Op - 
* EXPRESSION
 78:    LDC  3,3(6)	Load integer constant 
* OP  -
 79:     LD  4,-15(1)	Pop left into ac1 
 80:    SUB  3,4,3	Op - 
* Param  3
 81:     ST  3,-15(1)	Push parameter 
* TOFF dec:  -16
* Param end  output
 82:    LDA  1,-13(1)	Ghost frame becomes new active frame 
 83:    LDA  3,1(7)	Return address in ac 
 84:    JMP  7,-79(7)	call output
 85:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set:  -13
* EXPRESSION
* CALL  output
 86:     ST  1,-13(1)	Store fp in ghost frame for  output
* TOFF dec:  -14
* TOFF dec:  -15
* EXPRESSION
* EXPRESSION
* EXPRESSION
 87:    LDC  3,755(6)	Load integer constant 
* EXPRESSION
 88:    LDC  3,88(6)	Load integer constant 
* OP  /
 89:     LD  4,-15(1)	Pop left into ac1 
 90:    DIV  3,4,3	Op / 
* EXPRESSION
 91:    LDC  3,3(6)	Load integer constant 
* OP  /
 92:     LD  4,-15(1)	Pop left into ac1 
 93:    DIV  3,4,3	Op / 
* Param  4
 94:     ST  3,-15(1)	Push parameter 
* TOFF dec:  -16
* Param end  output
 95:    LDA  1,-13(1)	Ghost frame becomes new active frame 
 96:    LDA  3,1(7)	Return address in ac 
 97:    JMP  7,-92(7)	call output
 98:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set:  -13
* EXPRESSION
* CALL  output
 99:     ST  1,-13(1)	Store fp in ghost frame for  output
* TOFF dec:  -14
* TOFF dec:  -15
* EXPRESSION
* EXPRESSION
* EXPRESSION
100:    LDC  3,755(6)	Load integer constant 
* EXPRESSION
101:    LDC  3,88(6)	Load integer constant 
* OP  *
102:     LD  4,-15(1)	Pop left into ac1 
103:    MUL  3,4,3	Op * 
* EXPRESSION
* EXPRESSION
104:    LDC  3,3(6)	Load integer constant 
* EXPRESSION
105:    LDC  3,3(6)	Load integer constant 
* OP  *
106:     LD  4,-15(1)	Pop left into ac1 
107:    MUL  3,4,3	Op * 
* OP  +
108:     LD  4,-15(1)	Pop left into ac1 
109:    ADD  3,4,3	Op + 
* Param  5
110:     ST  3,-15(1)	Push parameter 
* TOFF dec:  -16
* Param end  output
111:    LDA  1,-13(1)	Ghost frame becomes new active frame 
112:    LDA  3,1(7)	Return address in ac 
113:    JMP  7,-108(7)	call output
114:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set:  -13
* EXPRESSION
* CALL  output
115:     ST  1,-13(1)	Store fp in ghost frame for  output
* TOFF dec:  -14
* TOFF dec:  -15
* EXPRESSION
* EXPRESSION
* EXPRESSION
116:    LDC  3,755(6)	Load integer constant 
* EXPRESSION
117:    LDC  3,88(6)	Load integer constant 
* OP  %
118:     LD  4,-15(1)	Pop left into ac1 
119:    MOD  3,4,3	Op % 
* EXPRESSION
120:    LDC  3,3(6)	Load integer constant 
* OP  %
121:     LD  4,-15(1)	Pop left into ac1 
122:    MOD  3,4,3	Op % 
* Param  6
123:     ST  3,-15(1)	Push parameter 
* TOFF dec:  -16
* Param end  output
124:    LDA  1,-13(1)	Ghost frame becomes new active frame 
125:    LDA  3,1(7)	Return address in ac 
126:    JMP  7,-121(7)	call output
127:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set:  -13
* EXPRESSION
* CALL  output
128:     ST  1,-13(1)	Store fp in ghost frame for  output
* TOFF dec:  -14
* TOFF dec:  -15
* EXPRESSION
* EXPRESSION
* EXPRESSION
129:    LDC  3,755(6)	Load integer constant 
* OP  chsign
130:    NEG  3,3,3	Op Unary - 
* EXPRESSION
* EXPRESSION
131:    LDC  3,88(6)	Load integer constant 
* EXPRESSION
132:    LDC  3,3(6)	Load integer constant 
* OP  *
133:     LD  4,-15(1)	Pop left into ac1 
134:    MUL  3,4,3	Op * 
* OP  +
135:     LD  4,-15(1)	Pop left into ac1 
136:    ADD  3,4,3	Op + 
* Param  7
137:     ST  3,-15(1)	Push parameter 
* TOFF dec:  -16
* Param end  output
138:    LDA  1,-13(1)	Ghost frame becomes new active frame 
139:    LDA  3,1(7)	Return address in ac 
140:    JMP  7,-135(7)	call output
141:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set:  -13
* EXPRESSION
* CALL  outnl
142:     ST  1,-13(1)	Store fp in ghost frame for  outnl
* TOFF dec:  -14
* TOFF dec:  -15
* Param end  outnl
143:    LDA  1,-13(1)	Ghost frame becomes new active frame 
144:    LDA  3,1(7)	Return address in ac 
145:    JMP  7,-112(7)	call outnl
146:    LDA  3,0(2)	save the result in ac 
* Call end  outnl
* TOFF set:  -13
* END COMPOUND
* Add standard closing in case there is no return statement
147:    LDC  2,0(6)	Set return value to 0 
148:     LD  3,-1(1)	Load return address 
149:     LD  1,0(1)	Adjust frame pointer 
150:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,150(7)	Jump to init [backpatch] 
* =========================================
* INIT
151:    LDA  1,0(0)	Set first frame at end of globals 
152:     ST  1,0(1)	Store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
153:    LDA  3,1(7)	Return address in ac 
154:    JMP  7,-116(7)	Jump to main 
155:   HALT  0,0(0)	DONE! 
* END INIT
