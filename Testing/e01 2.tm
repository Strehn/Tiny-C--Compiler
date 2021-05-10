* C- version: 1.00
* by Sydney Petrehn
* Input file: e01.c-
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
* TOFF set:  -3
* Compound body
* Var
* IF
* EXPRESSION
 40:    LDC  3,1(6)	Load integer constant 
* EXPRESSION
* CALL  output
 41:     ST  1,-2(1)	Store fp in ghost frame for  output
* TOFF dec:  -3
* TOFF dec:  -4
* EXPRESSION
 42:    LDC  3,13(6)	Load integer constant 
* Param  1
 43:     ST  3,-4(1)	Push parameter 
* TOFF dec:  -5
* Param end  output
 44:    LDA  1,-2(1)	Ghost frame becomes new active frame 
 45:    LDA  3,1(7)	Return address in ac 
 46:    JMP  7,-41(7)	call output
 47:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set:  -2
* EXPRESSION
* CALL  output
 48:     ST  1,-2(1)	Store fp in ghost frame for  output
* TOFF dec:  -3
* TOFF dec:  -4
* EXPRESSION
 49:    LDC  3,23(6)	Load integer constant 
* Param  2
 50:     ST  3,-4(1)	Push parameter 
* TOFF dec:  -5
* Param end  output
 51:    LDA  1,-2(1)	Ghost frame becomes new active frame 
 52:    LDA  3,1(7)	Return address in ac 
 53:    JMP  7,-48(7)	call output
 54:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set:  -2
* EXPRESSION
* CALL  outnl
 55:     ST  1,-2(1)	Store fp in ghost frame for  outnl
* TOFF dec:  -3
* TOFF dec:  -4
* Param end  outnl
 56:    LDA  1,-2(1)	Ghost frame becomes new active frame 
 57:    LDA  3,1(7)	Return address in ac 
 58:    JMP  7,-25(7)	call outnl
 59:    LDA  3,0(2)	save the result in ac 
* Call end  outnl
* TOFF set:  -2
* EXPRESSION
* ASSIGN  =
 60:    LDC  3,0(6)	Load integer constant 
 61:     ST  3,-2(1)	Store variable x
* EXPRESSION
* EXPRESSION
* IF
* EXPRESSION
* EXPRESSION
* CALL  output
 62:     ST  1,-3(1)	Store fp in ghost frame for  output
* TOFF dec:  -4
* TOFF dec:  -5
* EXPRESSION
 63:    LDC  3,44(6)	Load integer constant 
* Param  3
 64:     ST  3,-5(1)	Push parameter 
* TOFF dec:  -6
* Param end  output
 65:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 66:    LDA  3,1(7)	Return address in ac 
 67:    JMP  7,-62(7)	call output
 68:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set:  -3
* IF
* EXPRESSION
* EXPRESSION
* OP  not
 69:    LDC  4,1(6)	Load 1 
 70:    XOR  3,3,4	Logical not 
* EXPRESSION
* CALL  output
 71:     ST  1,-3(1)	Store fp in ghost frame for  output
* TOFF dec:  -4
* TOFF dec:  -5
* EXPRESSION
 72:    LDC  3,55(6)	Load integer constant 
* Param  4
 73:     ST  3,-5(1)	Push parameter 
* TOFF dec:  -6
* Param end  output
 74:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 75:    LDA  3,1(7)	Return address in ac 
 76:    JMP  7,-71(7)	call output
 77:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set:  -3
* EXPRESSION
* CALL  outnl
 78:     ST  1,-3(1)	Store fp in ghost frame for  outnl
* TOFF dec:  -4
* TOFF dec:  -5
* Param end  outnl
 79:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 80:    LDA  3,1(7)	Return address in ac 
 81:    JMP  7,-48(7)	call outnl
 82:    LDA  3,0(2)	save the result in ac 
* Call end  outnl
* TOFF set:  -3
* IF
* EXPRESSION
* EXPRESSION
 83:    LDC  3,3(6)	Load integer constant 
* EXPRESSION
 84:    LDC  3,1(6)	Load integer constant 
* OP  >
 85:     LD  4,-3(1)	Pop left into ac1 
 86:    TGT  3,4,3	Op > 
* EXPRESSION
* CALL  output
 87:     ST  1,-3(1)	Store fp in ghost frame for  output
* TOFF dec:  -4
* TOFF dec:  -5
* EXPRESSION
 88:    LDC  3,987(6)	Load integer constant 
* Param  5
 89:     ST  3,-5(1)	Push parameter 
* TOFF dec:  -6
* Param end  output
 90:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 91:    LDA  3,1(7)	Return address in ac 
 92:    JMP  7,-87(7)	call output
 93:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set:  -3
* IF
* EXPRESSION
* EXPRESSION
 94:    LDC  3,3(6)	Load integer constant 
* EXPRESSION
 95:    LDC  3,1(6)	Load integer constant 
* OP  <
 96:     LD  4,-3(1)	Pop left into ac1 
 97:    TLT  3,4,3	Op < 
* EXPRESSION
* CALL  output
 98:     ST  1,-3(1)	Store fp in ghost frame for  output
* TOFF dec:  -4
* TOFF dec:  -5
* EXPRESSION
 99:    LDC  3,211(6)	Load integer constant 
* Param  6
100:     ST  3,-5(1)	Push parameter 
* TOFF dec:  -6
* Param end  output
101:    LDA  1,-3(1)	Ghost frame becomes new active frame 
102:    LDA  3,1(7)	Return address in ac 
103:    JMP  7,-98(7)	call output
104:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set:  -3
* EXPRESSION
* CALL  outnl
105:     ST  1,-3(1)	Store fp in ghost frame for  outnl
* TOFF dec:  -4
* TOFF dec:  -5
* Param end  outnl
106:    LDA  1,-3(1)	Ghost frame becomes new active frame 
107:    LDA  3,1(7)	Return address in ac 
108:    JMP  7,-75(7)	call outnl
109:    LDA  3,0(2)	save the result in ac 
* Call end  outnl
* TOFF set:  -3
* IF
* EXPRESSION
110:    LDC  3,1(6)	Load integer constant 
* EXPRESSION
* CALL  output
111:     ST  1,-3(1)	Store fp in ghost frame for  output
* TOFF dec:  -4
* TOFF dec:  -5
* EXPRESSION
112:    LDC  3,13(6)	Load integer constant 
* Param  7
113:     ST  3,-5(1)	Push parameter 
* TOFF dec:  -6
* Param end  output
114:    LDA  1,-3(1)	Ghost frame becomes new active frame 
115:    LDA  3,1(7)	Return address in ac 
116:    JMP  7,-111(7)	call output
117:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set:  -3
* EXPRESSION
* CALL  output
118:     ST  1,-3(1)	Store fp in ghost frame for  output
* TOFF dec:  -4
* TOFF dec:  -5
* EXPRESSION
119:    LDC  3,51(6)	Load integer constant 
* Param  8
120:     ST  3,-5(1)	Push parameter 
* TOFF dec:  -6
* Param end  output
121:    LDA  1,-3(1)	Ghost frame becomes new active frame 
122:    LDA  3,1(7)	Return address in ac 
123:    JMP  7,-118(7)	call output
124:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set:  -3
* IF
* EXPRESSION
125:    LDC  3,0(6)	Load integer constant 
* EXPRESSION
* CALL  output
126:     ST  1,-3(1)	Store fp in ghost frame for  output
* TOFF dec:  -4
* TOFF dec:  -5
* EXPRESSION
127:    LDC  3,23(6)	Load integer constant 
* Param  9
128:     ST  3,-5(1)	Push parameter 
* TOFF dec:  -6
* Param end  output
129:    LDA  1,-3(1)	Ghost frame becomes new active frame 
130:    LDA  3,1(7)	Return address in ac 
131:    JMP  7,-126(7)	call output
132:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set:  -3
* EXPRESSION
* CALL  output
133:     ST  1,-3(1)	Store fp in ghost frame for  output
* TOFF dec:  -4
* TOFF dec:  -5
* EXPRESSION
134:    LDC  3,451(6)	Load integer constant 
* Param  10
135:     ST  3,-5(1)	Push parameter 
* TOFF dec:  -6
* Param end  output
136:    LDA  1,-3(1)	Ghost frame becomes new active frame 
137:    LDA  3,1(7)	Return address in ac 
138:    JMP  7,-133(7)	call output
139:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set:  -3
* EXPRESSION
* CALL  outnl
140:     ST  1,-3(1)	Store fp in ghost frame for  outnl
* TOFF dec:  -4
* TOFF dec:  -5
* Param end  outnl
141:    LDA  1,-3(1)	Ghost frame becomes new active frame 
142:    LDA  3,1(7)	Return address in ac 
143:    JMP  7,-110(7)	call outnl
144:    LDA  3,0(2)	save the result in ac 
* Call end  outnl
* TOFF set:  -3
* EXPRESSION
* ASSIGN  =
145:    LDC  3,0(6)	Load integer constant 
146:     ST  3,-2(1)	Store variable x
* EXPRESSION
* EXPRESSION
* IF
* EXPRESSION
* EXPRESSION
* CALL  output
147:     ST  1,-2(1)	Store fp in ghost frame for  output
* TOFF dec:  -3
* TOFF dec:  -4
* EXPRESSION
148:    LDC  3,44(6)	Load integer constant 
* Param  11
149:     ST  3,-4(1)	Push parameter 
* TOFF dec:  -5
* Param end  output
150:    LDA  1,-2(1)	Ghost frame becomes new active frame 
151:    LDA  3,1(7)	Return address in ac 
152:    JMP  7,-147(7)	call output
153:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set:  -2
* EXPRESSION
* CALL  output
154:     ST  1,-2(1)	Store fp in ghost frame for  output
* TOFF dec:  -3
* TOFF dec:  -4
* EXPRESSION
155:    LDC  3,514(6)	Load integer constant 
* Param  12
156:     ST  3,-4(1)	Push parameter 
* TOFF dec:  -5
* Param end  output
157:    LDA  1,-2(1)	Ghost frame becomes new active frame 
158:    LDA  3,1(7)	Return address in ac 
159:    JMP  7,-154(7)	call output
160:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set:  -2
* IF
* EXPRESSION
* EXPRESSION
* OP  not
161:    LDC  4,1(6)	Load 1 
162:    XOR  3,3,4	Logical not 
* EXPRESSION
* CALL  output
163:     ST  1,-2(1)	Store fp in ghost frame for  output
* TOFF dec:  -3
* TOFF dec:  -4
* EXPRESSION
164:    LDC  3,55(6)	Load integer constant 
* Param  13
165:     ST  3,-4(1)	Push parameter 
* TOFF dec:  -5
* Param end  output
166:    LDA  1,-2(1)	Ghost frame becomes new active frame 
167:    LDA  3,1(7)	Return address in ac 
168:    JMP  7,-163(7)	call output
169:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set:  -2
* EXPRESSION
* CALL  output
170:     ST  1,-2(1)	Store fp in ghost frame for  output
* TOFF dec:  -3
* TOFF dec:  -4
* EXPRESSION
171:    LDC  3,1514(6)	Load integer constant 
* Param  14
172:     ST  3,-4(1)	Push parameter 
* TOFF dec:  -5
* Param end  output
173:    LDA  1,-2(1)	Ghost frame becomes new active frame 
174:    LDA  3,1(7)	Return address in ac 
175:    JMP  7,-170(7)	call output
176:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set:  -2
* EXPRESSION
* CALL  outnl
177:     ST  1,-2(1)	Store fp in ghost frame for  outnl
* TOFF dec:  -3
* TOFF dec:  -4
* Param end  outnl
178:    LDA  1,-2(1)	Ghost frame becomes new active frame 
179:    LDA  3,1(7)	Return address in ac 
180:    JMP  7,-147(7)	call outnl
181:    LDA  3,0(2)	save the result in ac 
* Call end  outnl
* TOFF set:  -2
* IF
* EXPRESSION
* EXPRESSION
182:    LDC  3,3(6)	Load integer constant 
* EXPRESSION
183:    LDC  3,1(6)	Load integer constant 
* OP  >
184:     LD  4,-2(1)	Pop left into ac1 
185:    TGT  3,4,3	Op > 
* EXPRESSION
* CALL  output
186:     ST  1,-2(1)	Store fp in ghost frame for  output
* TOFF dec:  -3
* TOFF dec:  -4
* EXPRESSION
187:    LDC  3,987(6)	Load integer constant 
* Param  15
188:     ST  3,-4(1)	Push parameter 
* TOFF dec:  -5
* Param end  output
189:    LDA  1,-2(1)	Ghost frame becomes new active frame 
190:    LDA  3,1(7)	Return address in ac 
191:    JMP  7,-186(7)	call output
192:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set:  -2
* EXPRESSION
* CALL  output
193:     ST  1,-2(1)	Store fp in ghost frame for  output
* TOFF dec:  -3
* TOFF dec:  -4
* EXPRESSION
194:    LDC  3,114(6)	Load integer constant 
* Param  16
195:     ST  3,-4(1)	Push parameter 
* TOFF dec:  -5
* Param end  output
196:    LDA  1,-2(1)	Ghost frame becomes new active frame 
197:    LDA  3,1(7)	Return address in ac 
198:    JMP  7,-193(7)	call output
199:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set:  -2
* IF
* EXPRESSION
* EXPRESSION
200:    LDC  3,3(6)	Load integer constant 
* EXPRESSION
201:    LDC  3,1(6)	Load integer constant 
* OP  <
202:     LD  4,-2(1)	Pop left into ac1 
203:    TLT  3,4,3	Op < 
* EXPRESSION
* CALL  output
204:     ST  1,-2(1)	Store fp in ghost frame for  output
* TOFF dec:  -3
* TOFF dec:  -4
* EXPRESSION
205:    LDC  3,211(6)	Load integer constant 
* Param  17
206:     ST  3,-4(1)	Push parameter 
* TOFF dec:  -5
* Param end  output
207:    LDA  1,-2(1)	Ghost frame becomes new active frame 
208:    LDA  3,1(7)	Return address in ac 
209:    JMP  7,-204(7)	call output
210:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set:  -2
* EXPRESSION
* CALL  output
211:     ST  1,-2(1)	Store fp in ghost frame for  output
* TOFF dec:  -3
* TOFF dec:  -4
* EXPRESSION
212:    LDC  3,1614(6)	Load integer constant 
* Param  18
213:     ST  3,-4(1)	Push parameter 
* TOFF dec:  -5
* Param end  output
214:    LDA  1,-2(1)	Ghost frame becomes new active frame 
215:    LDA  3,1(7)	Return address in ac 
216:    JMP  7,-211(7)	call output
217:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set:  -2
* EXPRESSION
* CALL  outnl
218:     ST  1,-2(1)	Store fp in ghost frame for  outnl
* TOFF dec:  -3
* TOFF dec:  -4
* Param end  outnl
219:    LDA  1,-2(1)	Ghost frame becomes new active frame 
220:    LDA  3,1(7)	Return address in ac 
221:    JMP  7,-188(7)	call outnl
222:    LDA  3,0(2)	save the result in ac 
* Call end  outnl
* TOFF set:  -2
* END COMPOUND
* Add standard closing in case there is no return statement
223:    LDC  2,0(6)	Set return value to 0 
224:     LD  3,-1(1)	Load return address 
225:     LD  1,0(1)	Adjust frame pointer 
226:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,226(7)	Jump to init [backpatch] 
* =========================================
* INIT
227:    LDA  1,0(0)	Set first frame at end of globals 
228:     ST  1,0(1)	Store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
229:    LDA  3,1(7)	Return address in ac 
230:    JMP  7,-192(7)	Jump to main 
231:   HALT  0,0(0)	DONE! 
* END INIT
