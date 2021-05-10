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
* TOFF set:  -7
* Compound body
* Var
* Var
* Var
* EXPRESSION
* ASSIGN  =
 40:    LDC  3,213(6)	Load integer constant 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* ASSIGN  =
 41:    LDC  3,11(6)	Load integer constant 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* ASSIGN  =
 42:    LDC  3,4133(6)	Load integer constant 
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
* OP  >
 44:     LD  4,-15(1)	Pop left into ac1 
 45:    TGT  3,4,3	Op > 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  <=
 46:     LD  4,-15(1)	Pop left into ac1 
 47:    TLE  3,4,3	Op <= 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  >=
 48:     LD  4,-15(1)	Pop left into ac1 
 49:    TGE  3,4,3	Op >= 
* OP  and
 50:     LD  4,-15(1)	Pop left into ac1 
 51:    AND  3,4,3	Op & 
* OP  or
 52:     LD  4,-15(1)	Pop left into ac1 
 53:     OR  3,4,3	Op | 
* Param  1
 54:     ST  3,-15(1)	Push parameter 
* TOFF dec:  -16
* Param end  outputb
 55:    LDA  1,-13(1)	Ghost frame becomes new active frame 
 56:    LDA  3,1(7)	Return address in ac 
 57:    JMP  7,-41(7)	call outputb
 58:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set:  -13
* EXPRESSION
* CALL  outputb
 59:     ST  1,-13(1)	Store fp in ghost frame for  outputb
* TOFF dec:  -14
* TOFF dec:  -15
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  >
 60:     LD  4,-15(1)	Pop left into ac1 
 61:    TGT  3,4,3	Op > 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  <=
 62:     LD  4,-15(1)	Pop left into ac1 
 63:    TLE  3,4,3	Op <= 
* OP  and
 64:     LD  4,-15(1)	Pop left into ac1 
 65:    AND  3,4,3	Op & 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  >=
 66:     LD  4,-15(1)	Pop left into ac1 
 67:    TGE  3,4,3	Op >= 
* OP  or
 68:     LD  4,-15(1)	Pop left into ac1 
 69:     OR  3,4,3	Op | 
* Param  2
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
* EXPRESSION
* EXPRESSION
* OP  >
 76:     LD  4,-15(1)	Pop left into ac1 
 77:    TGT  3,4,3	Op > 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  <=
 78:     LD  4,-15(1)	Pop left into ac1 
 79:    TLE  3,4,3	Op <= 
* OP  and
 80:     LD  4,-15(1)	Pop left into ac1 
 81:    AND  3,4,3	Op & 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  >=
 82:     LD  4,-15(1)	Pop left into ac1 
 83:    TGE  3,4,3	Op >= 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  >=
 84:     LD  4,-15(1)	Pop left into ac1 
 85:    TGE  3,4,3	Op >= 
* OP  and
 86:     LD  4,-15(1)	Pop left into ac1 
 87:    AND  3,4,3	Op & 
* OP  or
 88:     LD  4,-15(1)	Pop left into ac1 
 89:     OR  3,4,3	Op | 
* Param  3
 90:     ST  3,-15(1)	Push parameter 
* TOFF dec:  -16
* Param end  outputb
 91:    LDA  1,-13(1)	Ghost frame becomes new active frame 
 92:    LDA  3,1(7)	Return address in ac 
 93:    JMP  7,-77(7)	call outputb
 94:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set:  -13
* EXPRESSION
* CALL  outputb
 95:     ST  1,-13(1)	Store fp in ghost frame for  outputb
* TOFF dec:  -14
* TOFF dec:  -15
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  >
 96:     LD  4,-15(1)	Pop left into ac1 
 97:    TGT  3,4,3	Op > 
* OP  not
 98:    LDC  4,1(6)	Load 1 
 99:    XOR  3,3,4	Logical not 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  <=
100:     LD  4,-15(1)	Pop left into ac1 
101:    TLE  3,4,3	Op <= 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  >=
102:     LD  4,-15(1)	Pop left into ac1 
103:    TGE  3,4,3	Op >= 
* OP  and
104:     LD  4,-15(1)	Pop left into ac1 
105:    AND  3,4,3	Op & 
* OP  or
106:     LD  4,-15(1)	Pop left into ac1 
107:     OR  3,4,3	Op | 
* Param  4
108:     ST  3,-15(1)	Push parameter 
* TOFF dec:  -16
* Param end  outputb
109:    LDA  1,-13(1)	Ghost frame becomes new active frame 
110:    LDA  3,1(7)	Return address in ac 
111:    JMP  7,-95(7)	call outputb
112:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set:  -13
* EXPRESSION
* CALL  outputb
113:     ST  1,-13(1)	Store fp in ghost frame for  outputb
* TOFF dec:  -14
* TOFF dec:  -15
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  >
114:     LD  4,-15(1)	Pop left into ac1 
115:    TGT  3,4,3	Op > 
* OP  not
116:    LDC  4,1(6)	Load 1 
117:    XOR  3,3,4	Logical not 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  <=
118:     LD  4,-15(1)	Pop left into ac1 
119:    TLE  3,4,3	Op <= 
* OP  and
120:     LD  4,-15(1)	Pop left into ac1 
121:    AND  3,4,3	Op & 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  >=
122:     LD  4,-15(1)	Pop left into ac1 
123:    TGE  3,4,3	Op >= 
* OP  or
124:     LD  4,-15(1)	Pop left into ac1 
125:     OR  3,4,3	Op | 
* Param  5
126:     ST  3,-15(1)	Push parameter 
* TOFF dec:  -16
* Param end  outputb
127:    LDA  1,-13(1)	Ghost frame becomes new active frame 
128:    LDA  3,1(7)	Return address in ac 
129:    JMP  7,-113(7)	call outputb
130:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set:  -13
* EXPRESSION
* CALL  outnl
131:     ST  1,-13(1)	Store fp in ghost frame for  outnl
* TOFF dec:  -14
* TOFF dec:  -15
* Param end  outnl
132:    LDA  1,-13(1)	Ghost frame becomes new active frame 
133:    LDA  3,1(7)	Return address in ac 
134:    JMP  7,-101(7)	call outnl
135:    LDA  3,0(2)	save the result in ac 
* Call end  outnl
* TOFF set:  -13
* EXPRESSION
* ASSIGN  =
136:    LDC  3,213(6)	Load integer constant 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* ASSIGN  =
137:    LDC  3,11(6)	Load integer constant 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* ASSIGN  =
138:    LDC  3,4133(6)	Load integer constant 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* CALL  outputb
139:     ST  1,-16(1)	Store fp in ghost frame for  outputb
* TOFF dec:  -17
* TOFF dec:  -18
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  >
140:     LD  4,-18(1)	Pop left into ac1 
141:    TGT  3,4,3	Op > 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  <=
142:     LD  4,-18(1)	Pop left into ac1 
143:    TLE  3,4,3	Op <= 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  >=
144:     LD  4,-18(1)	Pop left into ac1 
145:    TGE  3,4,3	Op >= 
* OP  and
146:     LD  4,-18(1)	Pop left into ac1 
147:    AND  3,4,3	Op & 
* OP  or
148:     LD  4,-18(1)	Pop left into ac1 
149:     OR  3,4,3	Op | 
* Param  6
150:     ST  3,-18(1)	Push parameter 
* TOFF dec:  -19
* Param end  outputb
151:    LDA  1,-16(1)	Ghost frame becomes new active frame 
152:    LDA  3,1(7)	Return address in ac 
153:    JMP  7,-137(7)	call outputb
154:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set:  -16
* EXPRESSION
* CALL  outputb
155:     ST  1,-16(1)	Store fp in ghost frame for  outputb
* TOFF dec:  -17
* TOFF dec:  -18
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  >
156:     LD  4,-18(1)	Pop left into ac1 
157:    TGT  3,4,3	Op > 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  <=
158:     LD  4,-18(1)	Pop left into ac1 
159:    TLE  3,4,3	Op <= 
* OP  and
160:     LD  4,-18(1)	Pop left into ac1 
161:    AND  3,4,3	Op & 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  >=
162:     LD  4,-18(1)	Pop left into ac1 
163:    TGE  3,4,3	Op >= 
* OP  or
164:     LD  4,-18(1)	Pop left into ac1 
165:     OR  3,4,3	Op | 
* Param  7
166:     ST  3,-18(1)	Push parameter 
* TOFF dec:  -19
* Param end  outputb
167:    LDA  1,-16(1)	Ghost frame becomes new active frame 
168:    LDA  3,1(7)	Return address in ac 
169:    JMP  7,-153(7)	call outputb
170:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set:  -16
* EXPRESSION
* CALL  outputb
171:     ST  1,-16(1)	Store fp in ghost frame for  outputb
* TOFF dec:  -17
* TOFF dec:  -18
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  >
172:     LD  4,-18(1)	Pop left into ac1 
173:    TGT  3,4,3	Op > 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  <=
174:     LD  4,-18(1)	Pop left into ac1 
175:    TLE  3,4,3	Op <= 
* OP  and
176:     LD  4,-18(1)	Pop left into ac1 
177:    AND  3,4,3	Op & 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  >=
178:     LD  4,-18(1)	Pop left into ac1 
179:    TGE  3,4,3	Op >= 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  >=
180:     LD  4,-18(1)	Pop left into ac1 
181:    TGE  3,4,3	Op >= 
* OP  and
182:     LD  4,-18(1)	Pop left into ac1 
183:    AND  3,4,3	Op & 
* OP  or
184:     LD  4,-18(1)	Pop left into ac1 
185:     OR  3,4,3	Op | 
* Param  8
186:     ST  3,-18(1)	Push parameter 
* TOFF dec:  -19
* Param end  outputb
187:    LDA  1,-16(1)	Ghost frame becomes new active frame 
188:    LDA  3,1(7)	Return address in ac 
189:    JMP  7,-173(7)	call outputb
190:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set:  -16
* EXPRESSION
* CALL  outputb
191:     ST  1,-16(1)	Store fp in ghost frame for  outputb
* TOFF dec:  -17
* TOFF dec:  -18
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  >
192:     LD  4,-18(1)	Pop left into ac1 
193:    TGT  3,4,3	Op > 
* OP  not
194:    LDC  4,1(6)	Load 1 
195:    XOR  3,3,4	Logical not 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  <=
196:     LD  4,-18(1)	Pop left into ac1 
197:    TLE  3,4,3	Op <= 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  >=
198:     LD  4,-18(1)	Pop left into ac1 
199:    TGE  3,4,3	Op >= 
* OP  and
200:     LD  4,-18(1)	Pop left into ac1 
201:    AND  3,4,3	Op & 
* OP  or
202:     LD  4,-18(1)	Pop left into ac1 
203:     OR  3,4,3	Op | 
* Param  9
204:     ST  3,-18(1)	Push parameter 
* TOFF dec:  -19
* Param end  outputb
205:    LDA  1,-16(1)	Ghost frame becomes new active frame 
206:    LDA  3,1(7)	Return address in ac 
207:    JMP  7,-191(7)	call outputb
208:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set:  -16
* EXPRESSION
* CALL  outputb
209:     ST  1,-16(1)	Store fp in ghost frame for  outputb
* TOFF dec:  -17
* TOFF dec:  -18
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  >
210:     LD  4,-18(1)	Pop left into ac1 
211:    TGT  3,4,3	Op > 
* OP  not
212:    LDC  4,1(6)	Load 1 
213:    XOR  3,3,4	Logical not 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  <=
214:     LD  4,-18(1)	Pop left into ac1 
215:    TLE  3,4,3	Op <= 
* OP  and
216:     LD  4,-18(1)	Pop left into ac1 
217:    AND  3,4,3	Op & 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  >=
218:     LD  4,-18(1)	Pop left into ac1 
219:    TGE  3,4,3	Op >= 
* OP  or
220:     LD  4,-18(1)	Pop left into ac1 
221:     OR  3,4,3	Op | 
* Param  10
222:     ST  3,-18(1)	Push parameter 
* TOFF dec:  -19
* Param end  outputb
223:    LDA  1,-16(1)	Ghost frame becomes new active frame 
224:    LDA  3,1(7)	Return address in ac 
225:    JMP  7,-209(7)	call outputb
226:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set:  -16
* EXPRESSION
* CALL  outnl
227:     ST  1,-16(1)	Store fp in ghost frame for  outnl
* TOFF dec:  -17
* TOFF dec:  -18
* Param end  outnl
228:    LDA  1,-16(1)	Ghost frame becomes new active frame 
229:    LDA  3,1(7)	Return address in ac 
230:    JMP  7,-197(7)	call outnl
231:    LDA  3,0(2)	save the result in ac 
* Call end  outnl
* TOFF set:  -16
* EXPRESSION
* ASSIGN  =
232:    LDC  3,11(6)	Load integer constant 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* ASSIGN  =
233:    LDC  3,213(6)	Load integer constant 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* ASSIGN  =
234:    LDC  3,4133(6)	Load integer constant 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* CALL  outputb
235:     ST  1,-19(1)	Store fp in ghost frame for  outputb
* TOFF dec:  -20
* TOFF dec:  -21
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  >
236:     LD  4,-21(1)	Pop left into ac1 
237:    TGT  3,4,3	Op > 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  <=
238:     LD  4,-21(1)	Pop left into ac1 
239:    TLE  3,4,3	Op <= 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  >=
240:     LD  4,-21(1)	Pop left into ac1 
241:    TGE  3,4,3	Op >= 
* OP  and
242:     LD  4,-21(1)	Pop left into ac1 
243:    AND  3,4,3	Op & 
* OP  or
244:     LD  4,-21(1)	Pop left into ac1 
245:     OR  3,4,3	Op | 
* Param  11
246:     ST  3,-21(1)	Push parameter 
* TOFF dec:  -22
* Param end  outputb
247:    LDA  1,-19(1)	Ghost frame becomes new active frame 
248:    LDA  3,1(7)	Return address in ac 
249:    JMP  7,-233(7)	call outputb
250:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set:  -19
* EXPRESSION
* CALL  outputb
251:     ST  1,-19(1)	Store fp in ghost frame for  outputb
* TOFF dec:  -20
* TOFF dec:  -21
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  >
252:     LD  4,-21(1)	Pop left into ac1 
253:    TGT  3,4,3	Op > 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  <=
254:     LD  4,-21(1)	Pop left into ac1 
255:    TLE  3,4,3	Op <= 
* OP  and
256:     LD  4,-21(1)	Pop left into ac1 
257:    AND  3,4,3	Op & 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  >=
258:     LD  4,-21(1)	Pop left into ac1 
259:    TGE  3,4,3	Op >= 
* OP  or
260:     LD  4,-21(1)	Pop left into ac1 
261:     OR  3,4,3	Op | 
* Param  12
262:     ST  3,-21(1)	Push parameter 
* TOFF dec:  -22
* Param end  outputb
263:    LDA  1,-19(1)	Ghost frame becomes new active frame 
264:    LDA  3,1(7)	Return address in ac 
265:    JMP  7,-249(7)	call outputb
266:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set:  -19
* EXPRESSION
* CALL  outputb
267:     ST  1,-19(1)	Store fp in ghost frame for  outputb
* TOFF dec:  -20
* TOFF dec:  -21
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  >
268:     LD  4,-21(1)	Pop left into ac1 
269:    TGT  3,4,3	Op > 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  <=
270:     LD  4,-21(1)	Pop left into ac1 
271:    TLE  3,4,3	Op <= 
* OP  and
272:     LD  4,-21(1)	Pop left into ac1 
273:    AND  3,4,3	Op & 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  >=
274:     LD  4,-21(1)	Pop left into ac1 
275:    TGE  3,4,3	Op >= 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  >=
276:     LD  4,-21(1)	Pop left into ac1 
277:    TGE  3,4,3	Op >= 
* OP  and
278:     LD  4,-21(1)	Pop left into ac1 
279:    AND  3,4,3	Op & 
* OP  or
280:     LD  4,-21(1)	Pop left into ac1 
281:     OR  3,4,3	Op | 
* Param  13
282:     ST  3,-21(1)	Push parameter 
* TOFF dec:  -22
* Param end  outputb
283:    LDA  1,-19(1)	Ghost frame becomes new active frame 
284:    LDA  3,1(7)	Return address in ac 
285:    JMP  7,-269(7)	call outputb
286:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set:  -19
* EXPRESSION
* CALL  outputb
287:     ST  1,-19(1)	Store fp in ghost frame for  outputb
* TOFF dec:  -20
* TOFF dec:  -21
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  >
288:     LD  4,-21(1)	Pop left into ac1 
289:    TGT  3,4,3	Op > 
* OP  not
290:    LDC  4,1(6)	Load 1 
291:    XOR  3,3,4	Logical not 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  <=
292:     LD  4,-21(1)	Pop left into ac1 
293:    TLE  3,4,3	Op <= 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  >=
294:     LD  4,-21(1)	Pop left into ac1 
295:    TGE  3,4,3	Op >= 
* OP  and
296:     LD  4,-21(1)	Pop left into ac1 
297:    AND  3,4,3	Op & 
* OP  or
298:     LD  4,-21(1)	Pop left into ac1 
299:     OR  3,4,3	Op | 
* Param  14
300:     ST  3,-21(1)	Push parameter 
* TOFF dec:  -22
* Param end  outputb
301:    LDA  1,-19(1)	Ghost frame becomes new active frame 
302:    LDA  3,1(7)	Return address in ac 
303:    JMP  7,-287(7)	call outputb
304:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set:  -19
* EXPRESSION
* CALL  outputb
305:     ST  1,-19(1)	Store fp in ghost frame for  outputb
* TOFF dec:  -20
* TOFF dec:  -21
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  >
306:     LD  4,-21(1)	Pop left into ac1 
307:    TGT  3,4,3	Op > 
* OP  not
308:    LDC  4,1(6)	Load 1 
309:    XOR  3,3,4	Logical not 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  <=
310:     LD  4,-21(1)	Pop left into ac1 
311:    TLE  3,4,3	Op <= 
* OP  and
312:     LD  4,-21(1)	Pop left into ac1 
313:    AND  3,4,3	Op & 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  >=
314:     LD  4,-21(1)	Pop left into ac1 
315:    TGE  3,4,3	Op >= 
* OP  or
316:     LD  4,-21(1)	Pop left into ac1 
317:     OR  3,4,3	Op | 
* Param  15
318:     ST  3,-21(1)	Push parameter 
* TOFF dec:  -22
* Param end  outputb
319:    LDA  1,-19(1)	Ghost frame becomes new active frame 
320:    LDA  3,1(7)	Return address in ac 
321:    JMP  7,-305(7)	call outputb
322:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set:  -19
* EXPRESSION
* CALL  outnl
323:     ST  1,-19(1)	Store fp in ghost frame for  outnl
* TOFF dec:  -20
* TOFF dec:  -21
* Param end  outnl
324:    LDA  1,-19(1)	Ghost frame becomes new active frame 
325:    LDA  3,1(7)	Return address in ac 
326:    JMP  7,-293(7)	call outnl
327:    LDA  3,0(2)	save the result in ac 
* Call end  outnl
* TOFF set:  -19
* END COMPOUND
* Add standard closing in case there is no return statement
328:    LDC  2,0(6)	Set return value to 0 
329:     LD  3,-1(1)	Load return address 
330:     LD  1,0(1)	Adjust frame pointer 
331:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,331(7)	Jump to init [backpatch] 
* =========================================
* INIT
332:    LDA  1,0(0)	Set first frame at end of globals 
333:     ST  1,0(1)	Store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
334:    LDA  3,1(7)	Return address in ac 
335:    JMP  7,-297(7)	Jump to main 
336:   HALT  0,0(0)	DONE! 
* END INIT
