* C- version: 1.00
* by Sydney Petrehn
* Input file: d05.c-
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
 40:    LDC  3,213(6)	Load integer constant 
 41:     ST  3,-2(1)	Store variable a
* EXPRESSION
* EXPRESSION
* EXPRESSION
* ASSIGN  =
 42:    LDC  3,11(6)	Load integer constant 
 43:     ST  3,-3(1)	Store variable b
* EXPRESSION
* EXPRESSION
* EXPRESSION
* ASSIGN  =
 44:    LDC  3,4133(6)	Load integer constant 
 45:     ST  3,-4(1)	Store variable c
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
* OP  >
 47:     LD  4,-13(1)	Pop left into ac1 
 48:    TGT  3,4,3	Op > 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  <=
 49:     LD  4,-13(1)	Pop left into ac1 
 50:    TLE  3,4,3	Op <= 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  >=
 51:     LD  4,-13(1)	Pop left into ac1 
 52:    TGE  3,4,3	Op >= 
* OP  and
 53:     LD  4,-13(1)	Pop left into ac1 
 54:    AND  3,4,3	Op & 
* OP  or
 55:     LD  4,-13(1)	Pop left into ac1 
 56:     OR  3,4,3	Op | 
* Param  1
 57:     ST  3,-13(1)	Push parameter 
* TOFF dec:  -14
* Param end  outputb
 58:    LDA  1,-11(1)	Ghost frame becomes new active frame 
 59:    LDA  3,1(7)	Return address in ac 
 60:    JMP  7,-44(7)	call outputb
 61:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set:  -11
* EXPRESSION
* CALL  outputb
 62:     ST  1,-11(1)	Store fp in ghost frame for  outputb
* TOFF dec:  -12
* TOFF dec:  -13
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  >
 63:     LD  4,-13(1)	Pop left into ac1 
 64:    TGT  3,4,3	Op > 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  <=
 65:     LD  4,-13(1)	Pop left into ac1 
 66:    TLE  3,4,3	Op <= 
* OP  and
 67:     LD  4,-13(1)	Pop left into ac1 
 68:    AND  3,4,3	Op & 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  >=
 69:     LD  4,-13(1)	Pop left into ac1 
 70:    TGE  3,4,3	Op >= 
* OP  or
 71:     LD  4,-13(1)	Pop left into ac1 
 72:     OR  3,4,3	Op | 
* Param  2
 73:     ST  3,-13(1)	Push parameter 
* TOFF dec:  -14
* Param end  outputb
 74:    LDA  1,-11(1)	Ghost frame becomes new active frame 
 75:    LDA  3,1(7)	Return address in ac 
 76:    JMP  7,-60(7)	call outputb
 77:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set:  -11
* EXPRESSION
* CALL  outputb
 78:     ST  1,-11(1)	Store fp in ghost frame for  outputb
* TOFF dec:  -12
* TOFF dec:  -13
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  >
 79:     LD  4,-13(1)	Pop left into ac1 
 80:    TGT  3,4,3	Op > 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  <=
 81:     LD  4,-13(1)	Pop left into ac1 
 82:    TLE  3,4,3	Op <= 
* OP  and
 83:     LD  4,-13(1)	Pop left into ac1 
 84:    AND  3,4,3	Op & 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  >=
 85:     LD  4,-13(1)	Pop left into ac1 
 86:    TGE  3,4,3	Op >= 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  >=
 87:     LD  4,-13(1)	Pop left into ac1 
 88:    TGE  3,4,3	Op >= 
* OP  and
 89:     LD  4,-13(1)	Pop left into ac1 
 90:    AND  3,4,3	Op & 
* OP  or
 91:     LD  4,-13(1)	Pop left into ac1 
 92:     OR  3,4,3	Op | 
* Param  3
 93:     ST  3,-13(1)	Push parameter 
* TOFF dec:  -14
* Param end  outputb
 94:    LDA  1,-11(1)	Ghost frame becomes new active frame 
 95:    LDA  3,1(7)	Return address in ac 
 96:    JMP  7,-80(7)	call outputb
 97:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set:  -11
* EXPRESSION
* CALL  outputb
 98:     ST  1,-11(1)	Store fp in ghost frame for  outputb
* TOFF dec:  -12
* TOFF dec:  -13
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  >
 99:     LD  4,-13(1)	Pop left into ac1 
100:    TGT  3,4,3	Op > 
* OP  not
101:    LDC  4,1(6)	Load 1 
102:    XOR  3,3,4	Logical not 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  <=
103:     LD  4,-13(1)	Pop left into ac1 
104:    TLE  3,4,3	Op <= 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  >=
105:     LD  4,-13(1)	Pop left into ac1 
106:    TGE  3,4,3	Op >= 
* OP  and
107:     LD  4,-13(1)	Pop left into ac1 
108:    AND  3,4,3	Op & 
* OP  or
109:     LD  4,-13(1)	Pop left into ac1 
110:     OR  3,4,3	Op | 
* Param  4
111:     ST  3,-13(1)	Push parameter 
* TOFF dec:  -14
* Param end  outputb
112:    LDA  1,-11(1)	Ghost frame becomes new active frame 
113:    LDA  3,1(7)	Return address in ac 
114:    JMP  7,-98(7)	call outputb
115:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set:  -11
* EXPRESSION
* CALL  outputb
116:     ST  1,-11(1)	Store fp in ghost frame for  outputb
* TOFF dec:  -12
* TOFF dec:  -13
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  >
117:     LD  4,-13(1)	Pop left into ac1 
118:    TGT  3,4,3	Op > 
* OP  not
119:    LDC  4,1(6)	Load 1 
120:    XOR  3,3,4	Logical not 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  <=
121:     LD  4,-13(1)	Pop left into ac1 
122:    TLE  3,4,3	Op <= 
* OP  and
123:     LD  4,-13(1)	Pop left into ac1 
124:    AND  3,4,3	Op & 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  >=
125:     LD  4,-13(1)	Pop left into ac1 
126:    TGE  3,4,3	Op >= 
* OP  or
127:     LD  4,-13(1)	Pop left into ac1 
128:     OR  3,4,3	Op | 
* Param  5
129:     ST  3,-13(1)	Push parameter 
* TOFF dec:  -14
* Param end  outputb
130:    LDA  1,-11(1)	Ghost frame becomes new active frame 
131:    LDA  3,1(7)	Return address in ac 
132:    JMP  7,-116(7)	call outputb
133:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set:  -11
* EXPRESSION
* CALL  outnl
134:     ST  1,-11(1)	Store fp in ghost frame for  outnl
* TOFF dec:  -12
* TOFF dec:  -13
* Param end  outnl
135:    LDA  1,-11(1)	Ghost frame becomes new active frame 
136:    LDA  3,1(7)	Return address in ac 
137:    JMP  7,-104(7)	call outnl
138:    LDA  3,0(2)	save the result in ac 
* Call end  outnl
* TOFF set:  -11
* EXPRESSION
* ASSIGN  =
139:    LDC  3,213(6)	Load integer constant 
140:     ST  3,-3(1)	Store variable b
* EXPRESSION
* EXPRESSION
* EXPRESSION
* ASSIGN  =
141:    LDC  3,11(6)	Load integer constant 
142:     ST  3,-4(1)	Store variable c
* EXPRESSION
* EXPRESSION
* EXPRESSION
* ASSIGN  =
143:    LDC  3,4133(6)	Load integer constant 
144:     ST  3,-2(1)	Store variable a
* EXPRESSION
* EXPRESSION
* EXPRESSION
* CALL  outputb
145:     ST  1,-14(1)	Store fp in ghost frame for  outputb
* TOFF dec:  -15
* TOFF dec:  -16
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  >
146:     LD  4,-16(1)	Pop left into ac1 
147:    TGT  3,4,3	Op > 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  <=
148:     LD  4,-16(1)	Pop left into ac1 
149:    TLE  3,4,3	Op <= 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  >=
150:     LD  4,-16(1)	Pop left into ac1 
151:    TGE  3,4,3	Op >= 
* OP  and
152:     LD  4,-16(1)	Pop left into ac1 
153:    AND  3,4,3	Op & 
* OP  or
154:     LD  4,-16(1)	Pop left into ac1 
155:     OR  3,4,3	Op | 
* Param  6
156:     ST  3,-16(1)	Push parameter 
* TOFF dec:  -17
* Param end  outputb
157:    LDA  1,-14(1)	Ghost frame becomes new active frame 
158:    LDA  3,1(7)	Return address in ac 
159:    JMP  7,-143(7)	call outputb
160:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set:  -14
* EXPRESSION
* CALL  outputb
161:     ST  1,-14(1)	Store fp in ghost frame for  outputb
* TOFF dec:  -15
* TOFF dec:  -16
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  >
162:     LD  4,-16(1)	Pop left into ac1 
163:    TGT  3,4,3	Op > 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  <=
164:     LD  4,-16(1)	Pop left into ac1 
165:    TLE  3,4,3	Op <= 
* OP  and
166:     LD  4,-16(1)	Pop left into ac1 
167:    AND  3,4,3	Op & 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  >=
168:     LD  4,-16(1)	Pop left into ac1 
169:    TGE  3,4,3	Op >= 
* OP  or
170:     LD  4,-16(1)	Pop left into ac1 
171:     OR  3,4,3	Op | 
* Param  7
172:     ST  3,-16(1)	Push parameter 
* TOFF dec:  -17
* Param end  outputb
173:    LDA  1,-14(1)	Ghost frame becomes new active frame 
174:    LDA  3,1(7)	Return address in ac 
175:    JMP  7,-159(7)	call outputb
176:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set:  -14
* EXPRESSION
* CALL  outputb
177:     ST  1,-14(1)	Store fp in ghost frame for  outputb
* TOFF dec:  -15
* TOFF dec:  -16
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  >
178:     LD  4,-16(1)	Pop left into ac1 
179:    TGT  3,4,3	Op > 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  <=
180:     LD  4,-16(1)	Pop left into ac1 
181:    TLE  3,4,3	Op <= 
* OP  and
182:     LD  4,-16(1)	Pop left into ac1 
183:    AND  3,4,3	Op & 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  >=
184:     LD  4,-16(1)	Pop left into ac1 
185:    TGE  3,4,3	Op >= 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  >=
186:     LD  4,-16(1)	Pop left into ac1 
187:    TGE  3,4,3	Op >= 
* OP  and
188:     LD  4,-16(1)	Pop left into ac1 
189:    AND  3,4,3	Op & 
* OP  or
190:     LD  4,-16(1)	Pop left into ac1 
191:     OR  3,4,3	Op | 
* Param  8
192:     ST  3,-16(1)	Push parameter 
* TOFF dec:  -17
* Param end  outputb
193:    LDA  1,-14(1)	Ghost frame becomes new active frame 
194:    LDA  3,1(7)	Return address in ac 
195:    JMP  7,-179(7)	call outputb
196:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set:  -14
* EXPRESSION
* CALL  outputb
197:     ST  1,-14(1)	Store fp in ghost frame for  outputb
* TOFF dec:  -15
* TOFF dec:  -16
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  >
198:     LD  4,-16(1)	Pop left into ac1 
199:    TGT  3,4,3	Op > 
* OP  not
200:    LDC  4,1(6)	Load 1 
201:    XOR  3,3,4	Logical not 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  <=
202:     LD  4,-16(1)	Pop left into ac1 
203:    TLE  3,4,3	Op <= 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  >=
204:     LD  4,-16(1)	Pop left into ac1 
205:    TGE  3,4,3	Op >= 
* OP  and
206:     LD  4,-16(1)	Pop left into ac1 
207:    AND  3,4,3	Op & 
* OP  or
208:     LD  4,-16(1)	Pop left into ac1 
209:     OR  3,4,3	Op | 
* Param  9
210:     ST  3,-16(1)	Push parameter 
* TOFF dec:  -17
* Param end  outputb
211:    LDA  1,-14(1)	Ghost frame becomes new active frame 
212:    LDA  3,1(7)	Return address in ac 
213:    JMP  7,-197(7)	call outputb
214:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set:  -14
* EXPRESSION
* CALL  outputb
215:     ST  1,-14(1)	Store fp in ghost frame for  outputb
* TOFF dec:  -15
* TOFF dec:  -16
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  >
216:     LD  4,-16(1)	Pop left into ac1 
217:    TGT  3,4,3	Op > 
* OP  not
218:    LDC  4,1(6)	Load 1 
219:    XOR  3,3,4	Logical not 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  <=
220:     LD  4,-16(1)	Pop left into ac1 
221:    TLE  3,4,3	Op <= 
* OP  and
222:     LD  4,-16(1)	Pop left into ac1 
223:    AND  3,4,3	Op & 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  >=
224:     LD  4,-16(1)	Pop left into ac1 
225:    TGE  3,4,3	Op >= 
* OP  or
226:     LD  4,-16(1)	Pop left into ac1 
227:     OR  3,4,3	Op | 
* Param  10
228:     ST  3,-16(1)	Push parameter 
* TOFF dec:  -17
* Param end  outputb
229:    LDA  1,-14(1)	Ghost frame becomes new active frame 
230:    LDA  3,1(7)	Return address in ac 
231:    JMP  7,-215(7)	call outputb
232:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set:  -14
* EXPRESSION
* CALL  outnl
233:     ST  1,-14(1)	Store fp in ghost frame for  outnl
* TOFF dec:  -15
* TOFF dec:  -16
* Param end  outnl
234:    LDA  1,-14(1)	Ghost frame becomes new active frame 
235:    LDA  3,1(7)	Return address in ac 
236:    JMP  7,-203(7)	call outnl
237:    LDA  3,0(2)	save the result in ac 
* Call end  outnl
* TOFF set:  -14
* EXPRESSION
* ASSIGN  =
238:    LDC  3,11(6)	Load integer constant 
239:     ST  3,-3(1)	Store variable b
* EXPRESSION
* EXPRESSION
* EXPRESSION
* ASSIGN  =
240:    LDC  3,213(6)	Load integer constant 
241:     ST  3,-4(1)	Store variable c
* EXPRESSION
* EXPRESSION
* EXPRESSION
* ASSIGN  =
242:    LDC  3,4133(6)	Load integer constant 
243:     ST  3,-2(1)	Store variable a
* EXPRESSION
* EXPRESSION
* EXPRESSION
* CALL  outputb
244:     ST  1,-17(1)	Store fp in ghost frame for  outputb
* TOFF dec:  -18
* TOFF dec:  -19
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  >
245:     LD  4,-19(1)	Pop left into ac1 
246:    TGT  3,4,3	Op > 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  <=
247:     LD  4,-19(1)	Pop left into ac1 
248:    TLE  3,4,3	Op <= 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  >=
249:     LD  4,-19(1)	Pop left into ac1 
250:    TGE  3,4,3	Op >= 
* OP  and
251:     LD  4,-19(1)	Pop left into ac1 
252:    AND  3,4,3	Op & 
* OP  or
253:     LD  4,-19(1)	Pop left into ac1 
254:     OR  3,4,3	Op | 
* Param  11
255:     ST  3,-19(1)	Push parameter 
* TOFF dec:  -20
* Param end  outputb
256:    LDA  1,-17(1)	Ghost frame becomes new active frame 
257:    LDA  3,1(7)	Return address in ac 
258:    JMP  7,-242(7)	call outputb
259:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set:  -17
* EXPRESSION
* CALL  outputb
260:     ST  1,-17(1)	Store fp in ghost frame for  outputb
* TOFF dec:  -18
* TOFF dec:  -19
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  >
261:     LD  4,-19(1)	Pop left into ac1 
262:    TGT  3,4,3	Op > 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  <=
263:     LD  4,-19(1)	Pop left into ac1 
264:    TLE  3,4,3	Op <= 
* OP  and
265:     LD  4,-19(1)	Pop left into ac1 
266:    AND  3,4,3	Op & 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  >=
267:     LD  4,-19(1)	Pop left into ac1 
268:    TGE  3,4,3	Op >= 
* OP  or
269:     LD  4,-19(1)	Pop left into ac1 
270:     OR  3,4,3	Op | 
* Param  12
271:     ST  3,-19(1)	Push parameter 
* TOFF dec:  -20
* Param end  outputb
272:    LDA  1,-17(1)	Ghost frame becomes new active frame 
273:    LDA  3,1(7)	Return address in ac 
274:    JMP  7,-258(7)	call outputb
275:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set:  -17
* EXPRESSION
* CALL  outputb
276:     ST  1,-17(1)	Store fp in ghost frame for  outputb
* TOFF dec:  -18
* TOFF dec:  -19
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  >
277:     LD  4,-19(1)	Pop left into ac1 
278:    TGT  3,4,3	Op > 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  <=
279:     LD  4,-19(1)	Pop left into ac1 
280:    TLE  3,4,3	Op <= 
* OP  and
281:     LD  4,-19(1)	Pop left into ac1 
282:    AND  3,4,3	Op & 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  >=
283:     LD  4,-19(1)	Pop left into ac1 
284:    TGE  3,4,3	Op >= 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  >=
285:     LD  4,-19(1)	Pop left into ac1 
286:    TGE  3,4,3	Op >= 
* OP  and
287:     LD  4,-19(1)	Pop left into ac1 
288:    AND  3,4,3	Op & 
* OP  or
289:     LD  4,-19(1)	Pop left into ac1 
290:     OR  3,4,3	Op | 
* Param  13
291:     ST  3,-19(1)	Push parameter 
* TOFF dec:  -20
* Param end  outputb
292:    LDA  1,-17(1)	Ghost frame becomes new active frame 
293:    LDA  3,1(7)	Return address in ac 
294:    JMP  7,-278(7)	call outputb
295:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set:  -17
* EXPRESSION
* CALL  outputb
296:     ST  1,-17(1)	Store fp in ghost frame for  outputb
* TOFF dec:  -18
* TOFF dec:  -19
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  >
297:     LD  4,-19(1)	Pop left into ac1 
298:    TGT  3,4,3	Op > 
* OP  not
299:    LDC  4,1(6)	Load 1 
300:    XOR  3,3,4	Logical not 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  <=
301:     LD  4,-19(1)	Pop left into ac1 
302:    TLE  3,4,3	Op <= 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  >=
303:     LD  4,-19(1)	Pop left into ac1 
304:    TGE  3,4,3	Op >= 
* OP  and
305:     LD  4,-19(1)	Pop left into ac1 
306:    AND  3,4,3	Op & 
* OP  or
307:     LD  4,-19(1)	Pop left into ac1 
308:     OR  3,4,3	Op | 
* Param  14
309:     ST  3,-19(1)	Push parameter 
* TOFF dec:  -20
* Param end  outputb
310:    LDA  1,-17(1)	Ghost frame becomes new active frame 
311:    LDA  3,1(7)	Return address in ac 
312:    JMP  7,-296(7)	call outputb
313:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set:  -17
* EXPRESSION
* CALL  outputb
314:     ST  1,-17(1)	Store fp in ghost frame for  outputb
* TOFF dec:  -18
* TOFF dec:  -19
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  >
315:     LD  4,-19(1)	Pop left into ac1 
316:    TGT  3,4,3	Op > 
* OP  not
317:    LDC  4,1(6)	Load 1 
318:    XOR  3,3,4	Logical not 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  <=
319:     LD  4,-19(1)	Pop left into ac1 
320:    TLE  3,4,3	Op <= 
* OP  and
321:     LD  4,-19(1)	Pop left into ac1 
322:    AND  3,4,3	Op & 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  >=
323:     LD  4,-19(1)	Pop left into ac1 
324:    TGE  3,4,3	Op >= 
* OP  or
325:     LD  4,-19(1)	Pop left into ac1 
326:     OR  3,4,3	Op | 
* Param  15
327:     ST  3,-19(1)	Push parameter 
* TOFF dec:  -20
* Param end  outputb
328:    LDA  1,-17(1)	Ghost frame becomes new active frame 
329:    LDA  3,1(7)	Return address in ac 
330:    JMP  7,-314(7)	call outputb
331:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set:  -17
* EXPRESSION
* CALL  outnl
332:     ST  1,-17(1)	Store fp in ghost frame for  outnl
* TOFF dec:  -18
* TOFF dec:  -19
* Param end  outnl
333:    LDA  1,-17(1)	Ghost frame becomes new active frame 
334:    LDA  3,1(7)	Return address in ac 
335:    JMP  7,-302(7)	call outnl
336:    LDA  3,0(2)	save the result in ac 
* Call end  outnl
* TOFF set:  -17
* END COMPOUND
* Add standard closing in case there is no return statement
337:    LDC  2,0(6)	Set return value to 0 
338:     LD  3,-1(1)	Load return address 
339:     LD  1,0(1)	Adjust frame pointer 
340:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,340(7)	Jump to init [backpatch] 
* =========================================
* INIT
341:    LDA  1,0(0)	Set first frame at end of globals 
342:     ST  1,0(1)	Store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
343:    LDA  3,1(7)	Return address in ac 
344:    JMP  7,-306(7)	Jump to main 
345:   HALT  0,0(0)	DONE! 
* END INIT
