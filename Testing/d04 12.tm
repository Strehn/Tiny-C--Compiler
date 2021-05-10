* C- version: 1.00
* by Sydney Petrehn
* Input file: d04.c-
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
 40:    LDC  3,1(6)	Load integer constant 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* ASSIGN  =
 41:    LDC  3,0(6)	Load integer constant 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* ASSIGN  =
 42:    LDC  3,1(6)	Load integer constant 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* CALL  outputb
 43:     ST  1,-13(1)	Store fp in ghost frame for  outputb
* TOFF dec:  -14
* TOFF dec:  -15
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  and
 44:     LD  4,-15(1)	Pop left into ac1 
 45:    AND  3,4,3	Op & 
* OP  or
 46:     LD  4,-15(1)	Pop left into ac1 
 47:     OR  3,4,3	Op | 
* Param  1
 48:     ST  3,-15(1)	Push parameter 
* TOFF dec:  -16
* Param end  outputb
 49:    LDA  1,-13(1)	Ghost frame becomes new active frame 
 50:    LDA  3,1(7)	Return address in ac 
 51:    JMP  7,-35(7)	call outputb
 52:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set:  -13
* EXPRESSION
* CALL  outputb
 53:     ST  1,-13(1)	Store fp in ghost frame for  outputb
* TOFF dec:  -14
* TOFF dec:  -15
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  and
 54:     LD  4,-15(1)	Pop left into ac1 
 55:    AND  3,4,3	Op & 
* EXPRESSION
* OP  or
 56:     LD  4,-15(1)	Pop left into ac1 
 57:     OR  3,4,3	Op | 
* Param  2
 58:     ST  3,-15(1)	Push parameter 
* TOFF dec:  -16
* Param end  outputb
 59:    LDA  1,-13(1)	Ghost frame becomes new active frame 
 60:    LDA  3,1(7)	Return address in ac 
 61:    JMP  7,-45(7)	call outputb
 62:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set:  -13
* EXPRESSION
* CALL  outputb
 63:     ST  1,-13(1)	Store fp in ghost frame for  outputb
* TOFF dec:  -14
* TOFF dec:  -15
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  and
 64:     LD  4,-15(1)	Pop left into ac1 
 65:    AND  3,4,3	Op & 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  and
 66:     LD  4,-15(1)	Pop left into ac1 
 67:    AND  3,4,3	Op & 
* OP  or
 68:     LD  4,-15(1)	Pop left into ac1 
 69:     OR  3,4,3	Op | 
* Param  3
 70:     ST  3,-15(1)	Push parameter 
* TOFF dec:  -16
* Param end  outputb
 71:    LDA  1,-13(1)	Ghost frame becomes new active frame 
 72:    LDA  3,1(7)	Return address in ac 
 73:    JMP  7,-57(7)	call outputb
 74:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set:  -13
* EXPRESSION
* CALL  outputb
 75:     ST  1,-13(1)	Store fp in ghost frame for  outputb
* TOFF dec:  -14
* TOFF dec:  -15
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  not
 76:    LDC  4,1(6)	Load 1 
 77:    XOR  3,3,4	Logical not 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  and
 78:     LD  4,-15(1)	Pop left into ac1 
 79:    AND  3,4,3	Op & 
* OP  or
 80:     LD  4,-15(1)	Pop left into ac1 
 81:     OR  3,4,3	Op | 
* Param  4
 82:     ST  3,-15(1)	Push parameter 
* TOFF dec:  -16
* Param end  outputb
 83:    LDA  1,-13(1)	Ghost frame becomes new active frame 
 84:    LDA  3,1(7)	Return address in ac 
 85:    JMP  7,-69(7)	call outputb
 86:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set:  -13
* EXPRESSION
* CALL  outputb
 87:     ST  1,-13(1)	Store fp in ghost frame for  outputb
* TOFF dec:  -14
* TOFF dec:  -15
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  not
 88:    LDC  4,1(6)	Load 1 
 89:    XOR  3,3,4	Logical not 
* EXPRESSION
* OP  and
 90:     LD  4,-15(1)	Pop left into ac1 
 91:    AND  3,4,3	Op & 
* EXPRESSION
* OP  or
 92:     LD  4,-15(1)	Pop left into ac1 
 93:     OR  3,4,3	Op | 
* Param  5
 94:     ST  3,-15(1)	Push parameter 
* TOFF dec:  -16
* Param end  outputb
 95:    LDA  1,-13(1)	Ghost frame becomes new active frame 
 96:    LDA  3,1(7)	Return address in ac 
 97:    JMP  7,-81(7)	call outputb
 98:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set:  -13
* EXPRESSION
* CALL  outnl
 99:     ST  1,-13(1)	Store fp in ghost frame for  outnl
* TOFF dec:  -14
* TOFF dec:  -15
* Param end  outnl
100:    LDA  1,-13(1)	Ghost frame becomes new active frame 
101:    LDA  3,1(7)	Return address in ac 
102:    JMP  7,-69(7)	call outnl
103:    LDA  3,0(2)	save the result in ac 
* Call end  outnl
* TOFF set:  -13
* EXPRESSION
* ASSIGN  =
104:    LDC  3,1(6)	Load integer constant 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* ASSIGN  =
105:    LDC  3,1(6)	Load integer constant 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* ASSIGN  =
106:    LDC  3,0(6)	Load integer constant 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* CALL  outputb
107:     ST  1,-16(1)	Store fp in ghost frame for  outputb
* TOFF dec:  -17
* TOFF dec:  -18
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  and
108:     LD  4,-18(1)	Pop left into ac1 
109:    AND  3,4,3	Op & 
* OP  or
110:     LD  4,-18(1)	Pop left into ac1 
111:     OR  3,4,3	Op | 
* Param  6
112:     ST  3,-18(1)	Push parameter 
* TOFF dec:  -19
* Param end  outputb
113:    LDA  1,-16(1)	Ghost frame becomes new active frame 
114:    LDA  3,1(7)	Return address in ac 
115:    JMP  7,-99(7)	call outputb
116:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set:  -16
* EXPRESSION
* CALL  outputb
117:     ST  1,-16(1)	Store fp in ghost frame for  outputb
* TOFF dec:  -17
* TOFF dec:  -18
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  and
118:     LD  4,-18(1)	Pop left into ac1 
119:    AND  3,4,3	Op & 
* EXPRESSION
* OP  or
120:     LD  4,-18(1)	Pop left into ac1 
121:     OR  3,4,3	Op | 
* Param  7
122:     ST  3,-18(1)	Push parameter 
* TOFF dec:  -19
* Param end  outputb
123:    LDA  1,-16(1)	Ghost frame becomes new active frame 
124:    LDA  3,1(7)	Return address in ac 
125:    JMP  7,-109(7)	call outputb
126:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set:  -16
* EXPRESSION
* CALL  outputb
127:     ST  1,-16(1)	Store fp in ghost frame for  outputb
* TOFF dec:  -17
* TOFF dec:  -18
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  and
128:     LD  4,-18(1)	Pop left into ac1 
129:    AND  3,4,3	Op & 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  and
130:     LD  4,-18(1)	Pop left into ac1 
131:    AND  3,4,3	Op & 
* OP  or
132:     LD  4,-18(1)	Pop left into ac1 
133:     OR  3,4,3	Op | 
* Param  8
134:     ST  3,-18(1)	Push parameter 
* TOFF dec:  -19
* Param end  outputb
135:    LDA  1,-16(1)	Ghost frame becomes new active frame 
136:    LDA  3,1(7)	Return address in ac 
137:    JMP  7,-121(7)	call outputb
138:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set:  -16
* EXPRESSION
* CALL  outputb
139:     ST  1,-16(1)	Store fp in ghost frame for  outputb
* TOFF dec:  -17
* TOFF dec:  -18
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  not
140:    LDC  4,1(6)	Load 1 
141:    XOR  3,3,4	Logical not 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  and
142:     LD  4,-18(1)	Pop left into ac1 
143:    AND  3,4,3	Op & 
* OP  or
144:     LD  4,-18(1)	Pop left into ac1 
145:     OR  3,4,3	Op | 
* Param  9
146:     ST  3,-18(1)	Push parameter 
* TOFF dec:  -19
* Param end  outputb
147:    LDA  1,-16(1)	Ghost frame becomes new active frame 
148:    LDA  3,1(7)	Return address in ac 
149:    JMP  7,-133(7)	call outputb
150:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set:  -16
* EXPRESSION
* CALL  outputb
151:     ST  1,-16(1)	Store fp in ghost frame for  outputb
* TOFF dec:  -17
* TOFF dec:  -18
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  not
152:    LDC  4,1(6)	Load 1 
153:    XOR  3,3,4	Logical not 
* EXPRESSION
* OP  and
154:     LD  4,-18(1)	Pop left into ac1 
155:    AND  3,4,3	Op & 
* EXPRESSION
* OP  or
156:     LD  4,-18(1)	Pop left into ac1 
157:     OR  3,4,3	Op | 
* Param  10
158:     ST  3,-18(1)	Push parameter 
* TOFF dec:  -19
* Param end  outputb
159:    LDA  1,-16(1)	Ghost frame becomes new active frame 
160:    LDA  3,1(7)	Return address in ac 
161:    JMP  7,-145(7)	call outputb
162:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set:  -16
* EXPRESSION
* CALL  outnl
163:     ST  1,-16(1)	Store fp in ghost frame for  outnl
* TOFF dec:  -17
* TOFF dec:  -18
* Param end  outnl
164:    LDA  1,-16(1)	Ghost frame becomes new active frame 
165:    LDA  3,1(7)	Return address in ac 
166:    JMP  7,-133(7)	call outnl
167:    LDA  3,0(2)	save the result in ac 
* Call end  outnl
* TOFF set:  -16
* END COMPOUND
* Add standard closing in case there is no return statement
168:    LDC  2,0(6)	Set return value to 0 
169:     LD  3,-1(1)	Load return address 
170:     LD  1,0(1)	Adjust frame pointer 
171:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,171(7)	Jump to init [backpatch] 
* =========================================
* INIT
172:    LDA  1,0(0)	Set first frame at end of globals 
173:     ST  1,0(1)	Store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
174:    LDA  3,1(7)	Return address in ac 
175:    JMP  7,-137(7)	Jump to main 
176:   HALT  0,0(0)	DONE! 
* END INIT
