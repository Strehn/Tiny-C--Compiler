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
 53:     LD  3,-4(1)	Load variable  c
 54:     ST  3,-13(1)	Push left side 
 55:     LD  4,-13(1)	Pop left into ac1 
 56:    AND  3,4,3	Op & 
* OP  or
 57:     LD  3,0(1)	Load variable  <=
 58:     ST  3,-13(1)	Push left side 
 59:     LD  4,-13(1)	Pop left into ac1 
 60:     OR  3,4,3	Op | 
* Param  1
 61:     ST  3,-13(1)	Push parameter 
* TOFF dec:  -14
* Param end  outputb
 62:    LDA  1,-11(1)	Ghost frame becomes new active frame 
 63:    LDA  3,1(7)	Return address in ac 
 64:    JMP  7,-48(7)	call outputb
 65:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set:  -11
* EXPRESSION
* CALL  outputb
 66:     ST  1,-11(1)	Store fp in ghost frame for  outputb
* TOFF dec:  -12
* TOFF dec:  -13
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  >
 67:     LD  4,-13(1)	Pop left into ac1 
 68:    TGT  3,4,3	Op > 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  <=
 69:     LD  4,-13(1)	Pop left into ac1 
 70:    TLE  3,4,3	Op <= 
* OP  and
 71:     LD  3,-3(1)	Load variable  b
 72:     ST  3,-13(1)	Push left side 
 73:     LD  4,-13(1)	Pop left into ac1 
 74:    AND  3,4,3	Op & 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  >=
 75:     LD  4,-13(1)	Pop left into ac1 
 76:    TGE  3,4,3	Op >= 
* OP  or
 77:     LD  3,-4(1)	Load variable  c
 78:     ST  3,-13(1)	Push left side 
 79:     LD  4,-13(1)	Pop left into ac1 
 80:     OR  3,4,3	Op | 
* Param  2
 81:     ST  3,-13(1)	Push parameter 
* TOFF dec:  -14
* Param end  outputb
 82:    LDA  1,-11(1)	Ghost frame becomes new active frame 
 83:    LDA  3,1(7)	Return address in ac 
 84:    JMP  7,-68(7)	call outputb
 85:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set:  -11
* EXPRESSION
* CALL  outputb
 86:     ST  1,-11(1)	Store fp in ghost frame for  outputb
* TOFF dec:  -12
* TOFF dec:  -13
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  >
 87:     LD  4,-13(1)	Pop left into ac1 
 88:    TGT  3,4,3	Op > 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  <=
 89:     LD  4,-13(1)	Pop left into ac1 
 90:    TLE  3,4,3	Op <= 
* OP  and
 91:     LD  3,-3(1)	Load variable  b
 92:     ST  3,-13(1)	Push left side 
 93:     LD  4,-13(1)	Pop left into ac1 
 94:    AND  3,4,3	Op & 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  >=
 95:     LD  4,-13(1)	Pop left into ac1 
 96:    TGE  3,4,3	Op >= 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  >=
 97:     LD  4,-13(1)	Pop left into ac1 
 98:    TGE  3,4,3	Op >= 
* OP  and
 99:     LD  3,-4(1)	Load variable  c
100:     ST  3,-13(1)	Push left side 
101:     LD  4,-13(1)	Pop left into ac1 
102:    AND  3,4,3	Op & 
* OP  or
103:     LD  3,0(1)	Load variable  >=
104:     ST  3,-13(1)	Push left side 
105:     LD  4,-13(1)	Pop left into ac1 
106:     OR  3,4,3	Op | 
* Param  3
107:     ST  3,-13(1)	Push parameter 
* TOFF dec:  -14
* Param end  outputb
108:    LDA  1,-11(1)	Ghost frame becomes new active frame 
109:    LDA  3,1(7)	Return address in ac 
110:    JMP  7,-94(7)	call outputb
111:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set:  -11
* EXPRESSION
* CALL  outputb
112:     ST  1,-11(1)	Store fp in ghost frame for  outputb
* TOFF dec:  -12
* TOFF dec:  -13
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  >
113:     LD  4,-13(1)	Pop left into ac1 
114:    TGT  3,4,3	Op > 
* OP  not
115:    LDC  4,1(6)	Load 1 
116:    XOR  3,3,4	Logical not 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  <=
117:     LD  4,-13(1)	Pop left into ac1 
118:    TLE  3,4,3	Op <= 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  >=
119:     LD  4,-13(1)	Pop left into ac1 
120:    TGE  3,4,3	Op >= 
* OP  and
121:     LD  3,-4(1)	Load variable  c
122:     ST  3,-13(1)	Push left side 
123:     LD  4,-13(1)	Pop left into ac1 
124:    AND  3,4,3	Op & 
* OP  or
125:     LD  3,0(1)	Load variable  <=
126:     ST  3,-13(1)	Push left side 
127:     LD  4,-13(1)	Pop left into ac1 
128:     OR  3,4,3	Op | 
* Param  4
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
* CALL  outputb
134:     ST  1,-11(1)	Store fp in ghost frame for  outputb
* TOFF dec:  -12
* TOFF dec:  -13
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  >
135:     LD  4,-13(1)	Pop left into ac1 
136:    TGT  3,4,3	Op > 
* OP  not
137:    LDC  4,1(6)	Load 1 
138:    XOR  3,3,4	Logical not 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  <=
139:     LD  4,-13(1)	Pop left into ac1 
140:    TLE  3,4,3	Op <= 
* OP  and
141:     LD  3,-3(1)	Load variable  b
142:     ST  3,-13(1)	Push left side 
143:     LD  4,-13(1)	Pop left into ac1 
144:    AND  3,4,3	Op & 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  >=
145:     LD  4,-13(1)	Pop left into ac1 
146:    TGE  3,4,3	Op >= 
* OP  or
147:     LD  3,-4(1)	Load variable  c
148:     ST  3,-13(1)	Push left side 
149:     LD  4,-13(1)	Pop left into ac1 
150:     OR  3,4,3	Op | 
* Param  5
151:     ST  3,-13(1)	Push parameter 
* TOFF dec:  -14
* Param end  outputb
152:    LDA  1,-11(1)	Ghost frame becomes new active frame 
153:    LDA  3,1(7)	Return address in ac 
154:    JMP  7,-138(7)	call outputb
155:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set:  -11
* EXPRESSION
* CALL  outnl
156:     ST  1,-11(1)	Store fp in ghost frame for  outnl
* TOFF dec:  -12
* TOFF dec:  -13
* Param end  outnl
157:    LDA  1,-11(1)	Ghost frame becomes new active frame 
158:    LDA  3,1(7)	Return address in ac 
159:    JMP  7,-126(7)	call outnl
160:    LDA  3,0(2)	save the result in ac 
* Call end  outnl
* TOFF set:  -11
* EXPRESSION
* ASSIGN  =
161:    LDC  3,213(6)	Load integer constant 
162:     ST  3,-3(1)	Store variable b
* EXPRESSION
* EXPRESSION
* EXPRESSION
* ASSIGN  =
163:    LDC  3,11(6)	Load integer constant 
164:     ST  3,-4(1)	Store variable c
* EXPRESSION
* EXPRESSION
* EXPRESSION
* ASSIGN  =
165:    LDC  3,4133(6)	Load integer constant 
166:     ST  3,-2(1)	Store variable a
* EXPRESSION
* EXPRESSION
* EXPRESSION
* CALL  outputb
167:     ST  1,-14(1)	Store fp in ghost frame for  outputb
* TOFF dec:  -15
* TOFF dec:  -16
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  >
168:     LD  4,-16(1)	Pop left into ac1 
169:    TGT  3,4,3	Op > 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  <=
170:     LD  4,-16(1)	Pop left into ac1 
171:    TLE  3,4,3	Op <= 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  >=
172:     LD  4,-16(1)	Pop left into ac1 
173:    TGE  3,4,3	Op >= 
* OP  and
174:     LD  3,-4(1)	Load variable  c
175:     ST  3,-16(1)	Push left side 
176:     LD  4,-16(1)	Pop left into ac1 
177:    AND  3,4,3	Op & 
* OP  or
178:     LD  3,0(1)	Load variable  <=
179:     ST  3,-16(1)	Push left side 
180:     LD  4,-16(1)	Pop left into ac1 
181:     OR  3,4,3	Op | 
* Param  6
182:     ST  3,-16(1)	Push parameter 
* TOFF dec:  -17
* Param end  outputb
183:    LDA  1,-14(1)	Ghost frame becomes new active frame 
184:    LDA  3,1(7)	Return address in ac 
185:    JMP  7,-169(7)	call outputb
186:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set:  -14
* EXPRESSION
* CALL  outputb
187:     ST  1,-14(1)	Store fp in ghost frame for  outputb
* TOFF dec:  -15
* TOFF dec:  -16
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  >
188:     LD  4,-16(1)	Pop left into ac1 
189:    TGT  3,4,3	Op > 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  <=
190:     LD  4,-16(1)	Pop left into ac1 
191:    TLE  3,4,3	Op <= 
* OP  and
192:     LD  3,-3(1)	Load variable  b
193:     ST  3,-16(1)	Push left side 
194:     LD  4,-16(1)	Pop left into ac1 
195:    AND  3,4,3	Op & 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  >=
196:     LD  4,-16(1)	Pop left into ac1 
197:    TGE  3,4,3	Op >= 
* OP  or
198:     LD  3,-4(1)	Load variable  c
199:     ST  3,-16(1)	Push left side 
200:     LD  4,-16(1)	Pop left into ac1 
201:     OR  3,4,3	Op | 
* Param  7
202:     ST  3,-16(1)	Push parameter 
* TOFF dec:  -17
* Param end  outputb
203:    LDA  1,-14(1)	Ghost frame becomes new active frame 
204:    LDA  3,1(7)	Return address in ac 
205:    JMP  7,-189(7)	call outputb
206:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set:  -14
* EXPRESSION
* CALL  outputb
207:     ST  1,-14(1)	Store fp in ghost frame for  outputb
* TOFF dec:  -15
* TOFF dec:  -16
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  >
208:     LD  4,-16(1)	Pop left into ac1 
209:    TGT  3,4,3	Op > 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  <=
210:     LD  4,-16(1)	Pop left into ac1 
211:    TLE  3,4,3	Op <= 
* OP  and
212:     LD  3,-3(1)	Load variable  b
213:     ST  3,-16(1)	Push left side 
214:     LD  4,-16(1)	Pop left into ac1 
215:    AND  3,4,3	Op & 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  >=
216:     LD  4,-16(1)	Pop left into ac1 
217:    TGE  3,4,3	Op >= 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  >=
218:     LD  4,-16(1)	Pop left into ac1 
219:    TGE  3,4,3	Op >= 
* OP  and
220:     LD  3,-4(1)	Load variable  c
221:     ST  3,-16(1)	Push left side 
222:     LD  4,-16(1)	Pop left into ac1 
223:    AND  3,4,3	Op & 
* OP  or
224:     LD  3,0(1)	Load variable  >=
225:     ST  3,-16(1)	Push left side 
226:     LD  4,-16(1)	Pop left into ac1 
227:     OR  3,4,3	Op | 
* Param  8
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
* CALL  outputb
233:     ST  1,-14(1)	Store fp in ghost frame for  outputb
* TOFF dec:  -15
* TOFF dec:  -16
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  >
234:     LD  4,-16(1)	Pop left into ac1 
235:    TGT  3,4,3	Op > 
* OP  not
236:    LDC  4,1(6)	Load 1 
237:    XOR  3,3,4	Logical not 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  <=
238:     LD  4,-16(1)	Pop left into ac1 
239:    TLE  3,4,3	Op <= 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  >=
240:     LD  4,-16(1)	Pop left into ac1 
241:    TGE  3,4,3	Op >= 
* OP  and
242:     LD  3,-4(1)	Load variable  c
243:     ST  3,-16(1)	Push left side 
244:     LD  4,-16(1)	Pop left into ac1 
245:    AND  3,4,3	Op & 
* OP  or
246:     LD  3,0(1)	Load variable  <=
247:     ST  3,-16(1)	Push left side 
248:     LD  4,-16(1)	Pop left into ac1 
249:     OR  3,4,3	Op | 
* Param  9
250:     ST  3,-16(1)	Push parameter 
* TOFF dec:  -17
* Param end  outputb
251:    LDA  1,-14(1)	Ghost frame becomes new active frame 
252:    LDA  3,1(7)	Return address in ac 
253:    JMP  7,-237(7)	call outputb
254:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set:  -14
* EXPRESSION
* CALL  outputb
255:     ST  1,-14(1)	Store fp in ghost frame for  outputb
* TOFF dec:  -15
* TOFF dec:  -16
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  >
256:     LD  4,-16(1)	Pop left into ac1 
257:    TGT  3,4,3	Op > 
* OP  not
258:    LDC  4,1(6)	Load 1 
259:    XOR  3,3,4	Logical not 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  <=
260:     LD  4,-16(1)	Pop left into ac1 
261:    TLE  3,4,3	Op <= 
* OP  and
262:     LD  3,-3(1)	Load variable  b
263:     ST  3,-16(1)	Push left side 
264:     LD  4,-16(1)	Pop left into ac1 
265:    AND  3,4,3	Op & 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  >=
266:     LD  4,-16(1)	Pop left into ac1 
267:    TGE  3,4,3	Op >= 
* OP  or
268:     LD  3,-4(1)	Load variable  c
269:     ST  3,-16(1)	Push left side 
270:     LD  4,-16(1)	Pop left into ac1 
271:     OR  3,4,3	Op | 
* Param  10
272:     ST  3,-16(1)	Push parameter 
* TOFF dec:  -17
* Param end  outputb
273:    LDA  1,-14(1)	Ghost frame becomes new active frame 
274:    LDA  3,1(7)	Return address in ac 
275:    JMP  7,-259(7)	call outputb
276:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set:  -14
* EXPRESSION
* CALL  outnl
277:     ST  1,-14(1)	Store fp in ghost frame for  outnl
* TOFF dec:  -15
* TOFF dec:  -16
* Param end  outnl
278:    LDA  1,-14(1)	Ghost frame becomes new active frame 
279:    LDA  3,1(7)	Return address in ac 
280:    JMP  7,-247(7)	call outnl
281:    LDA  3,0(2)	save the result in ac 
* Call end  outnl
* TOFF set:  -14
* EXPRESSION
* ASSIGN  =
282:    LDC  3,11(6)	Load integer constant 
283:     ST  3,-3(1)	Store variable b
* EXPRESSION
* EXPRESSION
* EXPRESSION
* ASSIGN  =
284:    LDC  3,213(6)	Load integer constant 
285:     ST  3,-4(1)	Store variable c
* EXPRESSION
* EXPRESSION
* EXPRESSION
* ASSIGN  =
286:    LDC  3,4133(6)	Load integer constant 
287:     ST  3,-2(1)	Store variable a
* EXPRESSION
* EXPRESSION
* EXPRESSION
* CALL  outputb
288:     ST  1,-17(1)	Store fp in ghost frame for  outputb
* TOFF dec:  -18
* TOFF dec:  -19
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  >
289:     LD  4,-19(1)	Pop left into ac1 
290:    TGT  3,4,3	Op > 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  <=
291:     LD  4,-19(1)	Pop left into ac1 
292:    TLE  3,4,3	Op <= 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  >=
293:     LD  4,-19(1)	Pop left into ac1 
294:    TGE  3,4,3	Op >= 
* OP  and
295:     LD  3,-4(1)	Load variable  c
296:     ST  3,-19(1)	Push left side 
297:     LD  4,-19(1)	Pop left into ac1 
298:    AND  3,4,3	Op & 
* OP  or
299:     LD  3,0(1)	Load variable  <=
300:     ST  3,-19(1)	Push left side 
301:     LD  4,-19(1)	Pop left into ac1 
302:     OR  3,4,3	Op | 
* Param  11
303:     ST  3,-19(1)	Push parameter 
* TOFF dec:  -20
* Param end  outputb
304:    LDA  1,-17(1)	Ghost frame becomes new active frame 
305:    LDA  3,1(7)	Return address in ac 
306:    JMP  7,-290(7)	call outputb
307:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set:  -17
* EXPRESSION
* CALL  outputb
308:     ST  1,-17(1)	Store fp in ghost frame for  outputb
* TOFF dec:  -18
* TOFF dec:  -19
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  >
309:     LD  4,-19(1)	Pop left into ac1 
310:    TGT  3,4,3	Op > 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  <=
311:     LD  4,-19(1)	Pop left into ac1 
312:    TLE  3,4,3	Op <= 
* OP  and
313:     LD  3,-3(1)	Load variable  b
314:     ST  3,-19(1)	Push left side 
315:     LD  4,-19(1)	Pop left into ac1 
316:    AND  3,4,3	Op & 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  >=
317:     LD  4,-19(1)	Pop left into ac1 
318:    TGE  3,4,3	Op >= 
* OP  or
319:     LD  3,-4(1)	Load variable  c
320:     ST  3,-19(1)	Push left side 
321:     LD  4,-19(1)	Pop left into ac1 
322:     OR  3,4,3	Op | 
* Param  12
323:     ST  3,-19(1)	Push parameter 
* TOFF dec:  -20
* Param end  outputb
324:    LDA  1,-17(1)	Ghost frame becomes new active frame 
325:    LDA  3,1(7)	Return address in ac 
326:    JMP  7,-310(7)	call outputb
327:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set:  -17
* EXPRESSION
* CALL  outputb
328:     ST  1,-17(1)	Store fp in ghost frame for  outputb
* TOFF dec:  -18
* TOFF dec:  -19
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  >
329:     LD  4,-19(1)	Pop left into ac1 
330:    TGT  3,4,3	Op > 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  <=
331:     LD  4,-19(1)	Pop left into ac1 
332:    TLE  3,4,3	Op <= 
* OP  and
333:     LD  3,-3(1)	Load variable  b
334:     ST  3,-19(1)	Push left side 
335:     LD  4,-19(1)	Pop left into ac1 
336:    AND  3,4,3	Op & 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  >=
337:     LD  4,-19(1)	Pop left into ac1 
338:    TGE  3,4,3	Op >= 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  >=
339:     LD  4,-19(1)	Pop left into ac1 
340:    TGE  3,4,3	Op >= 
* OP  and
341:     LD  3,-4(1)	Load variable  c
342:     ST  3,-19(1)	Push left side 
343:     LD  4,-19(1)	Pop left into ac1 
344:    AND  3,4,3	Op & 
* OP  or
345:     LD  3,0(1)	Load variable  >=
346:     ST  3,-19(1)	Push left side 
347:     LD  4,-19(1)	Pop left into ac1 
348:     OR  3,4,3	Op | 
* Param  13
349:     ST  3,-19(1)	Push parameter 
* TOFF dec:  -20
* Param end  outputb
350:    LDA  1,-17(1)	Ghost frame becomes new active frame 
351:    LDA  3,1(7)	Return address in ac 
352:    JMP  7,-336(7)	call outputb
353:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set:  -17
* EXPRESSION
* CALL  outputb
354:     ST  1,-17(1)	Store fp in ghost frame for  outputb
* TOFF dec:  -18
* TOFF dec:  -19
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  >
355:     LD  4,-19(1)	Pop left into ac1 
356:    TGT  3,4,3	Op > 
* OP  not
357:    LDC  4,1(6)	Load 1 
358:    XOR  3,3,4	Logical not 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  <=
359:     LD  4,-19(1)	Pop left into ac1 
360:    TLE  3,4,3	Op <= 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  >=
361:     LD  4,-19(1)	Pop left into ac1 
362:    TGE  3,4,3	Op >= 
* OP  and
363:     LD  3,-4(1)	Load variable  c
364:     ST  3,-19(1)	Push left side 
365:     LD  4,-19(1)	Pop left into ac1 
366:    AND  3,4,3	Op & 
* OP  or
367:     LD  3,0(1)	Load variable  <=
368:     ST  3,-19(1)	Push left side 
369:     LD  4,-19(1)	Pop left into ac1 
370:     OR  3,4,3	Op | 
* Param  14
371:     ST  3,-19(1)	Push parameter 
* TOFF dec:  -20
* Param end  outputb
372:    LDA  1,-17(1)	Ghost frame becomes new active frame 
373:    LDA  3,1(7)	Return address in ac 
374:    JMP  7,-358(7)	call outputb
375:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set:  -17
* EXPRESSION
* CALL  outputb
376:     ST  1,-17(1)	Store fp in ghost frame for  outputb
* TOFF dec:  -18
* TOFF dec:  -19
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  >
377:     LD  4,-19(1)	Pop left into ac1 
378:    TGT  3,4,3	Op > 
* OP  not
379:    LDC  4,1(6)	Load 1 
380:    XOR  3,3,4	Logical not 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  <=
381:     LD  4,-19(1)	Pop left into ac1 
382:    TLE  3,4,3	Op <= 
* OP  and
383:     LD  3,-3(1)	Load variable  b
384:     ST  3,-19(1)	Push left side 
385:     LD  4,-19(1)	Pop left into ac1 
386:    AND  3,4,3	Op & 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  >=
387:     LD  4,-19(1)	Pop left into ac1 
388:    TGE  3,4,3	Op >= 
* OP  or
389:     LD  3,-4(1)	Load variable  c
390:     ST  3,-19(1)	Push left side 
391:     LD  4,-19(1)	Pop left into ac1 
392:     OR  3,4,3	Op | 
* Param  15
393:     ST  3,-19(1)	Push parameter 
* TOFF dec:  -20
* Param end  outputb
394:    LDA  1,-17(1)	Ghost frame becomes new active frame 
395:    LDA  3,1(7)	Return address in ac 
396:    JMP  7,-380(7)	call outputb
397:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set:  -17
* EXPRESSION
* CALL  outnl
398:     ST  1,-17(1)	Store fp in ghost frame for  outnl
* TOFF dec:  -18
* TOFF dec:  -19
* Param end  outnl
399:    LDA  1,-17(1)	Ghost frame becomes new active frame 
400:    LDA  3,1(7)	Return address in ac 
401:    JMP  7,-368(7)	call outnl
402:    LDA  3,0(2)	save the result in ac 
* Call end  outnl
* TOFF set:  -17
* END COMPOUND
* Add standard closing in case there is no return statement
403:    LDC  2,0(6)	Set return value to 0 
404:     LD  3,-1(1)	Load return address 
405:     LD  1,0(1)	Adjust frame pointer 
406:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,406(7)	Jump to init [backpatch] 
* =========================================
* INIT
407:    LDA  1,0(0)	Set first frame at end of globals 
408:     ST  1,0(1)	Store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
409:    LDA  3,1(7)	Return address in ac 
410:    JMP  7,-372(7)	Jump to main 
411:   HALT  0,0(0)	DONE! 
* END INIT
