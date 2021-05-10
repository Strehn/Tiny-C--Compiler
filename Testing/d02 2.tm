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
* TOFF set:  -5
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
 46:     ST  1,-11(1)	Store fp in ghost frame for  output
* TOFF dec:  -12
* TOFF dec:  -13
* EXPRESSION
* EXPRESSION
 47:    LDC  3,755(6)	Load integer constant 
 48:     ST  3,-13(1)	Push left side 
* EXPRESSION
* EXPRESSION
 49:    LDC  3,88(6)	Load integer constant 
* EXPRESSION
 50:    LDC  3,3(6)	Load integer constant 
* OP  *
 51:     LD  4,-13(1)	Pop left into ac1 
 52:    MUL  3,4,3	Op * 
* OP  +
 53:     LD  3,0(1)	Load variable  (null)
 54:     ST  3,-13(1)	Push left side 
 55:     LD  4,-13(1)	Pop left into ac1 
 56:    ADD  3,4,3	Op + 
* Param  1
 57:     ST  3,-13(1)	Push parameter 
* TOFF dec:  -14
* Param end  output
 58:    LDA  1,-11(1)	Ghost frame becomes new active frame 
 59:    LDA  3,1(7)	Return address in ac 
 60:    JMP  7,-55(7)	call output
 61:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set:  -11
* EXPRESSION
* CALL  output
 62:     ST  1,-11(1)	Store fp in ghost frame for  output
* TOFF dec:  -12
* TOFF dec:  -13
* EXPRESSION
* EXPRESSION
* EXPRESSION
 63:    LDC  3,755(6)	Load integer constant 
* EXPRESSION
 64:    LDC  3,88(6)	Load integer constant 
* OP  *
 65:     LD  4,-13(1)	Pop left into ac1 
 66:    MUL  3,4,3	Op * 
* EXPRESSION
 67:    LDC  3,3(6)	Load integer constant 
* OP  +
 68:     LD  4,-13(1)	Pop left into ac1 
 69:    ADD  3,4,3	Op + 
* Param  2
 70:     ST  3,-13(1)	Push parameter 
* TOFF dec:  -14
* Param end  output
 71:    LDA  1,-11(1)	Ghost frame becomes new active frame 
 72:    LDA  3,1(7)	Return address in ac 
 73:    JMP  7,-68(7)	call output
 74:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set:  -11
* EXPRESSION
* CALL  output
 75:     ST  1,-11(1)	Store fp in ghost frame for  output
* TOFF dec:  -12
* TOFF dec:  -13
* EXPRESSION
* EXPRESSION
* EXPRESSION
 76:    LDC  3,755(6)	Load integer constant 
* EXPRESSION
 77:    LDC  3,88(6)	Load integer constant 
* OP  -
 78:     LD  4,-13(1)	Pop left into ac1 
 79:    SUB  3,4,3	Op - 
* EXPRESSION
 80:    LDC  3,3(6)	Load integer constant 
* OP  -
 81:     LD  4,-13(1)	Pop left into ac1 
 82:    SUB  3,4,3	Op - 
* Param  3
 83:     ST  3,-13(1)	Push parameter 
* TOFF dec:  -14
* Param end  output
 84:    LDA  1,-11(1)	Ghost frame becomes new active frame 
 85:    LDA  3,1(7)	Return address in ac 
 86:    JMP  7,-81(7)	call output
 87:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set:  -11
* EXPRESSION
* CALL  output
 88:     ST  1,-11(1)	Store fp in ghost frame for  output
* TOFF dec:  -12
* TOFF dec:  -13
* EXPRESSION
* EXPRESSION
* EXPRESSION
 89:    LDC  3,755(6)	Load integer constant 
* EXPRESSION
 90:    LDC  3,88(6)	Load integer constant 
* OP  /
 91:     LD  4,-13(1)	Pop left into ac1 
 92:    DIV  3,4,3	Op / 
* EXPRESSION
 93:    LDC  3,3(6)	Load integer constant 
* OP  /
 94:     LD  4,-13(1)	Pop left into ac1 
 95:    DIV  3,4,3	Op / 
* Param  4
 96:     ST  3,-13(1)	Push parameter 
* TOFF dec:  -14
* Param end  output
 97:    LDA  1,-11(1)	Ghost frame becomes new active frame 
 98:    LDA  3,1(7)	Return address in ac 
 99:    JMP  7,-94(7)	call output
100:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set:  -11
* EXPRESSION
* CALL  output
101:     ST  1,-11(1)	Store fp in ghost frame for  output
* TOFF dec:  -12
* TOFF dec:  -13
* EXPRESSION
* EXPRESSION
* EXPRESSION
102:    LDC  3,755(6)	Load integer constant 
* EXPRESSION
103:    LDC  3,88(6)	Load integer constant 
* OP  *
104:     LD  4,-13(1)	Pop left into ac1 
105:    MUL  3,4,3	Op * 
* EXPRESSION
* EXPRESSION
106:    LDC  3,3(6)	Load integer constant 
* EXPRESSION
107:    LDC  3,3(6)	Load integer constant 
* OP  *
108:     LD  4,-13(1)	Pop left into ac1 
109:    MUL  3,4,3	Op * 
* OP  +
110:     LD  3,0(1)	Load variable  (null)
111:     ST  3,-13(1)	Push left side 
112:     LD  4,-13(1)	Pop left into ac1 
113:    ADD  3,4,3	Op + 
* Param  5
114:     ST  3,-13(1)	Push parameter 
* TOFF dec:  -14
* Param end  output
115:    LDA  1,-11(1)	Ghost frame becomes new active frame 
116:    LDA  3,1(7)	Return address in ac 
117:    JMP  7,-112(7)	call output
118:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set:  -11
* EXPRESSION
* CALL  output
119:     ST  1,-11(1)	Store fp in ghost frame for  output
* TOFF dec:  -12
* TOFF dec:  -13
* EXPRESSION
* EXPRESSION
* EXPRESSION
120:    LDC  3,755(6)	Load integer constant 
* EXPRESSION
121:    LDC  3,88(6)	Load integer constant 
* OP  %
122:     LD  4,-13(1)	Pop left into ac1 
123:    MOD  3,4,3	Op % 
* EXPRESSION
124:    LDC  3,3(6)	Load integer constant 
* OP  %
125:     LD  4,-13(1)	Pop left into ac1 
126:    MOD  3,4,3	Op % 
* Param  6
127:     ST  3,-13(1)	Push parameter 
* TOFF dec:  -14
* Param end  output
128:    LDA  1,-11(1)	Ghost frame becomes new active frame 
129:    LDA  3,1(7)	Return address in ac 
130:    JMP  7,-125(7)	call output
131:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set:  -11
* EXPRESSION
* CALL  output
132:     ST  1,-11(1)	Store fp in ghost frame for  output
* TOFF dec:  -12
* TOFF dec:  -13
* EXPRESSION
* EXPRESSION
* EXPRESSION
133:    LDC  3,755(6)	Load integer constant 
* OP  chsign
134:    NEG  3,3,3	Op Unary - 
* EXPRESSION
* EXPRESSION
135:    LDC  3,88(6)	Load integer constant 
* EXPRESSION
136:    LDC  3,3(6)	Load integer constant 
* OP  *
137:     LD  4,-13(1)	Pop left into ac1 
138:    MUL  3,4,3	Op * 
* OP  +
139:     LD  3,0(1)	Load variable  (null)
140:     ST  3,-13(1)	Push left side 
141:     LD  4,-13(1)	Pop left into ac1 
142:    ADD  3,4,3	Op + 
* Param  7
143:     ST  3,-13(1)	Push parameter 
* TOFF dec:  -14
* Param end  output
144:    LDA  1,-11(1)	Ghost frame becomes new active frame 
145:    LDA  3,1(7)	Return address in ac 
146:    JMP  7,-141(7)	call output
147:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set:  -11
* EXPRESSION
* CALL  outnl
148:     ST  1,-11(1)	Store fp in ghost frame for  outnl
* TOFF dec:  -12
* TOFF dec:  -13
* Param end  outnl
149:    LDA  1,-11(1)	Ghost frame becomes new active frame 
150:    LDA  3,1(7)	Return address in ac 
151:    JMP  7,-118(7)	call outnl
152:    LDA  3,0(2)	save the result in ac 
* Call end  outnl
* TOFF set:  -11
* END COMPOUND
* Add standard closing in case there is no return statement
153:    LDC  2,0(6)	Set return value to 0 
154:     LD  3,-1(1)	Load return address 
155:     LD  1,0(1)	Adjust frame pointer 
156:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,156(7)	Jump to init [backpatch] 
* =========================================
* INIT
157:    LDA  1,0(0)	Set first frame at end of globals 
158:     ST  1,0(1)	Store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
159:    LDA  3,1(7)	Return address in ac 
160:    JMP  7,-122(7)	Jump to main 
161:   HALT  0,0(0)	DONE! 
* END INIT
