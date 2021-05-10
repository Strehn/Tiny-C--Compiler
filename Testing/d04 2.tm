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
* TOFF set:  -5
* Compound body
* Var
* Var
* Var
* EXPRESSION
* ASSIGN  =
 40:    LDC  3,1(6)	Load integer constant 
 41:     ST  3,-2(1)	Store variable x
* EXPRESSION
* EXPRESSION
* EXPRESSION
* ASSIGN  =
 42:    LDC  3,0(6)	Load integer constant 
 43:     ST  3,-3(1)	Store variable y
* EXPRESSION
* EXPRESSION
* EXPRESSION
* ASSIGN  =
 44:    LDC  3,1(6)	Load integer constant 
 45:     ST  3,-4(1)	Store variable z
* EXPRESSION
* EXPRESSION
* EXPRESSION
* CALL  outputb
 46:     ST  1,-11(1)	Store fp in ghost frame for  outputb
* TOFF dec:  -12
* TOFF dec:  -13
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  and
 47:     LD  4,-13(1)	Pop left into ac1 
 48:    AND  3,4,3	Op & 
* OP  or
 49:     LD  3,-3(1)	Load variable  y
 50:     ST  3,-13(1)	Push left side 
 51:     LD  4,-13(1)	Pop left into ac1 
 52:     OR  3,4,3	Op | 
* Param  1
 53:     ST  3,-13(1)	Push parameter 
* TOFF dec:  -14
* Param end  outputb
 54:    LDA  1,-11(1)	Ghost frame becomes new active frame 
 55:    LDA  3,1(7)	Return address in ac 
 56:    JMP  7,-40(7)	call outputb
 57:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set:  -11
* EXPRESSION
* CALL  outputb
 58:     ST  1,-11(1)	Store fp in ghost frame for  outputb
* TOFF dec:  -12
* TOFF dec:  -13
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  and
 59:     LD  4,-13(1)	Pop left into ac1 
 60:    AND  3,4,3	Op & 
* EXPRESSION
* OP  or
 61:     LD  4,-13(1)	Pop left into ac1 
 62:     OR  3,4,3	Op | 
* Param  2
 63:     ST  3,-13(1)	Push parameter 
* TOFF dec:  -14
* Param end  outputb
 64:    LDA  1,-11(1)	Ghost frame becomes new active frame 
 65:    LDA  3,1(7)	Return address in ac 
 66:    JMP  7,-50(7)	call outputb
 67:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set:  -11
* EXPRESSION
* CALL  outputb
 68:     ST  1,-11(1)	Store fp in ghost frame for  outputb
* TOFF dec:  -12
* TOFF dec:  -13
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  and
 69:     LD  4,-13(1)	Pop left into ac1 
 70:    AND  3,4,3	Op & 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  and
 71:     LD  4,-13(1)	Pop left into ac1 
 72:    AND  3,4,3	Op & 
* OP  or
 73:     LD  3,-4(1)	Load variable  z
 74:     ST  3,-13(1)	Push left side 
 75:     LD  4,-13(1)	Pop left into ac1 
 76:     OR  3,4,3	Op | 
* Param  3
 77:     ST  3,-13(1)	Push parameter 
* TOFF dec:  -14
* Param end  outputb
 78:    LDA  1,-11(1)	Ghost frame becomes new active frame 
 79:    LDA  3,1(7)	Return address in ac 
 80:    JMP  7,-64(7)	call outputb
 81:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set:  -11
* EXPRESSION
* CALL  outputb
 82:     ST  1,-11(1)	Store fp in ghost frame for  outputb
* TOFF dec:  -12
* TOFF dec:  -13
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  not
 83:    LDC  4,1(6)	Load 1 
 84:    XOR  3,3,4	Logical not 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  and
 85:     LD  4,-13(1)	Pop left into ac1 
 86:    AND  3,4,3	Op & 
* OP  or
 87:     LD  3,-3(1)	Load variable  y
 88:     ST  3,-13(1)	Push left side 
 89:     LD  4,-13(1)	Pop left into ac1 
 90:     OR  3,4,3	Op | 
* Param  4
 91:     ST  3,-13(1)	Push parameter 
* TOFF dec:  -14
* Param end  outputb
 92:    LDA  1,-11(1)	Ghost frame becomes new active frame 
 93:    LDA  3,1(7)	Return address in ac 
 94:    JMP  7,-78(7)	call outputb
 95:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set:  -11
* EXPRESSION
* CALL  outputb
 96:     ST  1,-11(1)	Store fp in ghost frame for  outputb
* TOFF dec:  -12
* TOFF dec:  -13
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  not
 97:    LDC  4,1(6)	Load 1 
 98:    XOR  3,3,4	Logical not 
* EXPRESSION
* OP  and
 99:     LD  4,-13(1)	Pop left into ac1 
100:    AND  3,4,3	Op & 
* EXPRESSION
* OP  or
101:     LD  4,-13(1)	Pop left into ac1 
102:     OR  3,4,3	Op | 
* Param  5
103:     ST  3,-13(1)	Push parameter 
* TOFF dec:  -14
* Param end  outputb
104:    LDA  1,-11(1)	Ghost frame becomes new active frame 
105:    LDA  3,1(7)	Return address in ac 
106:    JMP  7,-90(7)	call outputb
107:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set:  -11
* EXPRESSION
* CALL  outnl
108:     ST  1,-11(1)	Store fp in ghost frame for  outnl
* TOFF dec:  -12
* TOFF dec:  -13
* Param end  outnl
109:    LDA  1,-11(1)	Ghost frame becomes new active frame 
110:    LDA  3,1(7)	Return address in ac 
111:    JMP  7,-78(7)	call outnl
112:    LDA  3,0(2)	save the result in ac 
* Call end  outnl
* TOFF set:  -11
* EXPRESSION
* ASSIGN  =
113:    LDC  3,1(6)	Load integer constant 
114:     ST  3,-2(1)	Store variable x
* EXPRESSION
* EXPRESSION
* EXPRESSION
* ASSIGN  =
115:    LDC  3,1(6)	Load integer constant 
116:     ST  3,-3(1)	Store variable y
* EXPRESSION
* EXPRESSION
* EXPRESSION
* ASSIGN  =
117:    LDC  3,0(6)	Load integer constant 
118:     ST  3,-4(1)	Store variable z
* EXPRESSION
* EXPRESSION
* EXPRESSION
* CALL  outputb
119:     ST  1,-14(1)	Store fp in ghost frame for  outputb
* TOFF dec:  -15
* TOFF dec:  -16
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  and
120:     LD  4,-16(1)	Pop left into ac1 
121:    AND  3,4,3	Op & 
* OP  or
122:     LD  3,-3(1)	Load variable  y
123:     ST  3,-16(1)	Push left side 
124:     LD  4,-16(1)	Pop left into ac1 
125:     OR  3,4,3	Op | 
* Param  6
126:     ST  3,-16(1)	Push parameter 
* TOFF dec:  -17
* Param end  outputb
127:    LDA  1,-14(1)	Ghost frame becomes new active frame 
128:    LDA  3,1(7)	Return address in ac 
129:    JMP  7,-113(7)	call outputb
130:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set:  -14
* EXPRESSION
* CALL  outputb
131:     ST  1,-14(1)	Store fp in ghost frame for  outputb
* TOFF dec:  -15
* TOFF dec:  -16
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  and
132:     LD  4,-16(1)	Pop left into ac1 
133:    AND  3,4,3	Op & 
* EXPRESSION
* OP  or
134:     LD  4,-16(1)	Pop left into ac1 
135:     OR  3,4,3	Op | 
* Param  7
136:     ST  3,-16(1)	Push parameter 
* TOFF dec:  -17
* Param end  outputb
137:    LDA  1,-14(1)	Ghost frame becomes new active frame 
138:    LDA  3,1(7)	Return address in ac 
139:    JMP  7,-123(7)	call outputb
140:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set:  -14
* EXPRESSION
* CALL  outputb
141:     ST  1,-14(1)	Store fp in ghost frame for  outputb
* TOFF dec:  -15
* TOFF dec:  -16
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  and
142:     LD  4,-16(1)	Pop left into ac1 
143:    AND  3,4,3	Op & 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  and
144:     LD  4,-16(1)	Pop left into ac1 
145:    AND  3,4,3	Op & 
* OP  or
146:     LD  3,-4(1)	Load variable  z
147:     ST  3,-16(1)	Push left side 
148:     LD  4,-16(1)	Pop left into ac1 
149:     OR  3,4,3	Op | 
* Param  8
150:     ST  3,-16(1)	Push parameter 
* TOFF dec:  -17
* Param end  outputb
151:    LDA  1,-14(1)	Ghost frame becomes new active frame 
152:    LDA  3,1(7)	Return address in ac 
153:    JMP  7,-137(7)	call outputb
154:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set:  -14
* EXPRESSION
* CALL  outputb
155:     ST  1,-14(1)	Store fp in ghost frame for  outputb
* TOFF dec:  -15
* TOFF dec:  -16
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  not
156:    LDC  4,1(6)	Load 1 
157:    XOR  3,3,4	Logical not 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  and
158:     LD  4,-16(1)	Pop left into ac1 
159:    AND  3,4,3	Op & 
* OP  or
160:     LD  3,-3(1)	Load variable  y
161:     ST  3,-16(1)	Push left side 
162:     LD  4,-16(1)	Pop left into ac1 
163:     OR  3,4,3	Op | 
* Param  9
164:     ST  3,-16(1)	Push parameter 
* TOFF dec:  -17
* Param end  outputb
165:    LDA  1,-14(1)	Ghost frame becomes new active frame 
166:    LDA  3,1(7)	Return address in ac 
167:    JMP  7,-151(7)	call outputb
168:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set:  -14
* EXPRESSION
* CALL  outputb
169:     ST  1,-14(1)	Store fp in ghost frame for  outputb
* TOFF dec:  -15
* TOFF dec:  -16
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  not
170:    LDC  4,1(6)	Load 1 
171:    XOR  3,3,4	Logical not 
* EXPRESSION
* OP  and
172:     LD  4,-16(1)	Pop left into ac1 
173:    AND  3,4,3	Op & 
* EXPRESSION
* OP  or
174:     LD  4,-16(1)	Pop left into ac1 
175:     OR  3,4,3	Op | 
* Param  10
176:     ST  3,-16(1)	Push parameter 
* TOFF dec:  -17
* Param end  outputb
177:    LDA  1,-14(1)	Ghost frame becomes new active frame 
178:    LDA  3,1(7)	Return address in ac 
179:    JMP  7,-163(7)	call outputb
180:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set:  -14
* EXPRESSION
* CALL  outnl
181:     ST  1,-14(1)	Store fp in ghost frame for  outnl
* TOFF dec:  -15
* TOFF dec:  -16
* Param end  outnl
182:    LDA  1,-14(1)	Ghost frame becomes new active frame 
183:    LDA  3,1(7)	Return address in ac 
184:    JMP  7,-151(7)	call outnl
185:    LDA  3,0(2)	save the result in ac 
* Call end  outnl
* TOFF set:  -14
* END COMPOUND
* Add standard closing in case there is no return statement
186:    LDC  2,0(6)	Set return value to 0 
187:     LD  3,-1(1)	Load return address 
188:     LD  1,0(1)	Adjust frame pointer 
189:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,189(7)	Jump to init [backpatch] 
* =========================================
* INIT
190:    LDA  1,0(0)	Set first frame at end of globals 
191:     ST  1,0(1)	Store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
192:    LDA  3,1(7)	Return address in ac 
193:    JMP  7,-155(7)	Jump to main 
194:   HALT  0,0(0)	DONE! 
* END INIT
