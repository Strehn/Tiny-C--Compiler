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
 47:     ST  3,-13(1)	Push left side 
* TOFF dec:  -14
 48:     ST  3,-14(1)	Push left side 
* TOFF dec:  -15
* TOFF dec:  -16
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  >
 49:     LD  4,-16(1)	Pop left into ac1 
 50:    TGT  3,4,3	Op > 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  <=
 51:     LD  4,-16(1)	Pop left into ac1 
 52:    TLE  3,4,3	Op <= 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  >=
 53:     LD  4,-16(1)	Pop left into ac1 
 54:    TGE  3,4,3	Op >= 
* OP  and
 55:     LD  4,-16(1)	Pop left into ac1 
 56:    AND  3,4,3	Op & 
* OP  or
 57:     LD  4,-16(1)	Pop left into ac1 
 58:     OR  3,4,3	Op | 
* Param  1
 59:     ST  3,-16(1)	Push parameter 
* TOFF dec:  -17
* Param end  outputb
 60:    LDA  1,-11(1)	Ghost frame becomes new active frame 
 61:    LDA  3,1(7)	Return address in ac 
 62:    JMP  7,-46(7)	call outputb
 63:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set:  -11
* EXPRESSION
* CALL  outputb
 64:     ST  1,-11(1)	Store fp in ghost frame for  outputb
* TOFF dec:  -12
* TOFF dec:  -13
 65:     ST  3,-13(1)	Push left side 
* TOFF dec:  -14
 66:     ST  3,-14(1)	Push left side 
* TOFF dec:  -15
* TOFF dec:  -16
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  >
 67:     LD  4,-16(1)	Pop left into ac1 
 68:    TGT  3,4,3	Op > 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  <=
 69:     LD  4,-16(1)	Pop left into ac1 
 70:    TLE  3,4,3	Op <= 
* OP  and
 71:     LD  4,-16(1)	Pop left into ac1 
 72:    AND  3,4,3	Op & 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  >=
 73:     LD  4,-16(1)	Pop left into ac1 
 74:    TGE  3,4,3	Op >= 
* OP  or
 75:     LD  4,-16(1)	Pop left into ac1 
 76:     OR  3,4,3	Op | 
* Param  2
 77:     ST  3,-16(1)	Push parameter 
* TOFF dec:  -17
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
 83:     ST  3,-13(1)	Push left side 
* TOFF dec:  -14
 84:     ST  3,-14(1)	Push left side 
* TOFF dec:  -15
* TOFF dec:  -16
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  >
 85:     LD  4,-16(1)	Pop left into ac1 
 86:    TGT  3,4,3	Op > 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  <=
 87:     LD  4,-16(1)	Pop left into ac1 
 88:    TLE  3,4,3	Op <= 
* OP  and
 89:     LD  4,-16(1)	Pop left into ac1 
 90:    AND  3,4,3	Op & 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  >=
 91:     LD  4,-16(1)	Pop left into ac1 
 92:    TGE  3,4,3	Op >= 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  >=
 93:     LD  4,-16(1)	Pop left into ac1 
 94:    TGE  3,4,3	Op >= 
* OP  and
 95:     LD  4,-16(1)	Pop left into ac1 
 96:    AND  3,4,3	Op & 
* OP  or
 97:     LD  4,-16(1)	Pop left into ac1 
 98:     OR  3,4,3	Op | 
* Param  3
 99:     ST  3,-16(1)	Push parameter 
* TOFF dec:  -17
* Param end  outputb
100:    LDA  1,-11(1)	Ghost frame becomes new active frame 
101:    LDA  3,1(7)	Return address in ac 
102:    JMP  7,-86(7)	call outputb
103:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set:  -11
* EXPRESSION
* CALL  outputb
104:     ST  1,-11(1)	Store fp in ghost frame for  outputb
* TOFF dec:  -12
* TOFF dec:  -13
105:     ST  3,-13(1)	Push left side 
* TOFF dec:  -14
106:     ST  3,-14(1)	Push left side 
* TOFF dec:  -15
* TOFF dec:  -16
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  >
107:     LD  4,-16(1)	Pop left into ac1 
108:    TGT  3,4,3	Op > 
* OP  not
109:    LDC  4,1(6)	Load 1 
110:    XOR  3,3,4	Logical not 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  <=
111:     LD  4,-16(1)	Pop left into ac1 
112:    TLE  3,4,3	Op <= 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  >=
113:     LD  4,-16(1)	Pop left into ac1 
114:    TGE  3,4,3	Op >= 
* OP  and
115:     LD  4,-16(1)	Pop left into ac1 
116:    AND  3,4,3	Op & 
* OP  or
117:     LD  4,-16(1)	Pop left into ac1 
118:     OR  3,4,3	Op | 
* Param  4
119:     ST  3,-16(1)	Push parameter 
* TOFF dec:  -17
* Param end  outputb
120:    LDA  1,-11(1)	Ghost frame becomes new active frame 
121:    LDA  3,1(7)	Return address in ac 
122:    JMP  7,-106(7)	call outputb
123:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set:  -11
* EXPRESSION
* CALL  outputb
124:     ST  1,-11(1)	Store fp in ghost frame for  outputb
* TOFF dec:  -12
* TOFF dec:  -13
125:     ST  3,-13(1)	Push left side 
* TOFF dec:  -14
126:     ST  3,-14(1)	Push left side 
* TOFF dec:  -15
* TOFF dec:  -16
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  >
127:     LD  4,-16(1)	Pop left into ac1 
128:    TGT  3,4,3	Op > 
* OP  not
129:    LDC  4,1(6)	Load 1 
130:    XOR  3,3,4	Logical not 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  <=
131:     LD  4,-16(1)	Pop left into ac1 
132:    TLE  3,4,3	Op <= 
* OP  and
133:     LD  4,-16(1)	Pop left into ac1 
134:    AND  3,4,3	Op & 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  >=
135:     LD  4,-16(1)	Pop left into ac1 
136:    TGE  3,4,3	Op >= 
* OP  or
137:     LD  4,-16(1)	Pop left into ac1 
138:     OR  3,4,3	Op | 
* Param  5
139:     ST  3,-16(1)	Push parameter 
* TOFF dec:  -17
* Param end  outputb
140:    LDA  1,-11(1)	Ghost frame becomes new active frame 
141:    LDA  3,1(7)	Return address in ac 
142:    JMP  7,-126(7)	call outputb
143:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set:  -11
* EXPRESSION
* CALL  outnl
144:     ST  1,-11(1)	Store fp in ghost frame for  outnl
* TOFF dec:  -12
* TOFF dec:  -13
* Param end  outnl
145:    LDA  1,-11(1)	Ghost frame becomes new active frame 
146:    LDA  3,1(7)	Return address in ac 
147:    JMP  7,-114(7)	call outnl
148:    LDA  3,0(2)	save the result in ac 
* Call end  outnl
* TOFF set:  -11
* EXPRESSION
* ASSIGN  =
149:    LDC  3,213(6)	Load integer constant 
150:     ST  3,-3(1)	Store variable b
* EXPRESSION
* EXPRESSION
* EXPRESSION
* ASSIGN  =
151:    LDC  3,11(6)	Load integer constant 
152:     ST  3,-4(1)	Store variable c
* EXPRESSION
* EXPRESSION
* EXPRESSION
* ASSIGN  =
153:    LDC  3,4133(6)	Load integer constant 
154:     ST  3,-2(1)	Store variable a
* EXPRESSION
* EXPRESSION
* EXPRESSION
* CALL  outputb
155:     ST  1,-14(1)	Store fp in ghost frame for  outputb
* TOFF dec:  -15
* TOFF dec:  -16
156:     ST  3,-16(1)	Push left side 
* TOFF dec:  -17
157:     ST  3,-17(1)	Push left side 
* TOFF dec:  -18
* TOFF dec:  -19
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  >
158:     LD  4,-19(1)	Pop left into ac1 
159:    TGT  3,4,3	Op > 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  <=
160:     LD  4,-19(1)	Pop left into ac1 
161:    TLE  3,4,3	Op <= 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  >=
162:     LD  4,-19(1)	Pop left into ac1 
163:    TGE  3,4,3	Op >= 
* OP  and
164:     LD  4,-19(1)	Pop left into ac1 
165:    AND  3,4,3	Op & 
* OP  or
166:     LD  4,-19(1)	Pop left into ac1 
167:     OR  3,4,3	Op | 
* Param  6
168:     ST  3,-19(1)	Push parameter 
* TOFF dec:  -20
* Param end  outputb
169:    LDA  1,-14(1)	Ghost frame becomes new active frame 
170:    LDA  3,1(7)	Return address in ac 
171:    JMP  7,-155(7)	call outputb
172:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set:  -14
* EXPRESSION
* CALL  outputb
173:     ST  1,-14(1)	Store fp in ghost frame for  outputb
* TOFF dec:  -15
* TOFF dec:  -16
174:     ST  3,-16(1)	Push left side 
* TOFF dec:  -17
175:     ST  3,-17(1)	Push left side 
* TOFF dec:  -18
* TOFF dec:  -19
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  >
176:     LD  4,-19(1)	Pop left into ac1 
177:    TGT  3,4,3	Op > 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  <=
178:     LD  4,-19(1)	Pop left into ac1 
179:    TLE  3,4,3	Op <= 
* OP  and
180:     LD  4,-19(1)	Pop left into ac1 
181:    AND  3,4,3	Op & 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  >=
182:     LD  4,-19(1)	Pop left into ac1 
183:    TGE  3,4,3	Op >= 
* OP  or
184:     LD  4,-19(1)	Pop left into ac1 
185:     OR  3,4,3	Op | 
* Param  7
186:     ST  3,-19(1)	Push parameter 
* TOFF dec:  -20
* Param end  outputb
187:    LDA  1,-14(1)	Ghost frame becomes new active frame 
188:    LDA  3,1(7)	Return address in ac 
189:    JMP  7,-173(7)	call outputb
190:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set:  -14
* EXPRESSION
* CALL  outputb
191:     ST  1,-14(1)	Store fp in ghost frame for  outputb
* TOFF dec:  -15
* TOFF dec:  -16
192:     ST  3,-16(1)	Push left side 
* TOFF dec:  -17
193:     ST  3,-17(1)	Push left side 
* TOFF dec:  -18
* TOFF dec:  -19
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  >
194:     LD  4,-19(1)	Pop left into ac1 
195:    TGT  3,4,3	Op > 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  <=
196:     LD  4,-19(1)	Pop left into ac1 
197:    TLE  3,4,3	Op <= 
* OP  and
198:     LD  4,-19(1)	Pop left into ac1 
199:    AND  3,4,3	Op & 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  >=
200:     LD  4,-19(1)	Pop left into ac1 
201:    TGE  3,4,3	Op >= 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  >=
202:     LD  4,-19(1)	Pop left into ac1 
203:    TGE  3,4,3	Op >= 
* OP  and
204:     LD  4,-19(1)	Pop left into ac1 
205:    AND  3,4,3	Op & 
* OP  or
206:     LD  4,-19(1)	Pop left into ac1 
207:     OR  3,4,3	Op | 
* Param  8
208:     ST  3,-19(1)	Push parameter 
* TOFF dec:  -20
* Param end  outputb
209:    LDA  1,-14(1)	Ghost frame becomes new active frame 
210:    LDA  3,1(7)	Return address in ac 
211:    JMP  7,-195(7)	call outputb
212:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set:  -14
* EXPRESSION
* CALL  outputb
213:     ST  1,-14(1)	Store fp in ghost frame for  outputb
* TOFF dec:  -15
* TOFF dec:  -16
214:     ST  3,-16(1)	Push left side 
* TOFF dec:  -17
215:     ST  3,-17(1)	Push left side 
* TOFF dec:  -18
* TOFF dec:  -19
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  >
216:     LD  4,-19(1)	Pop left into ac1 
217:    TGT  3,4,3	Op > 
* OP  not
218:    LDC  4,1(6)	Load 1 
219:    XOR  3,3,4	Logical not 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  <=
220:     LD  4,-19(1)	Pop left into ac1 
221:    TLE  3,4,3	Op <= 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  >=
222:     LD  4,-19(1)	Pop left into ac1 
223:    TGE  3,4,3	Op >= 
* OP  and
224:     LD  4,-19(1)	Pop left into ac1 
225:    AND  3,4,3	Op & 
* OP  or
226:     LD  4,-19(1)	Pop left into ac1 
227:     OR  3,4,3	Op | 
* Param  9
228:     ST  3,-19(1)	Push parameter 
* TOFF dec:  -20
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
234:     ST  3,-16(1)	Push left side 
* TOFF dec:  -17
235:     ST  3,-17(1)	Push left side 
* TOFF dec:  -18
* TOFF dec:  -19
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  >
236:     LD  4,-19(1)	Pop left into ac1 
237:    TGT  3,4,3	Op > 
* OP  not
238:    LDC  4,1(6)	Load 1 
239:    XOR  3,3,4	Logical not 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  <=
240:     LD  4,-19(1)	Pop left into ac1 
241:    TLE  3,4,3	Op <= 
* OP  and
242:     LD  4,-19(1)	Pop left into ac1 
243:    AND  3,4,3	Op & 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  >=
244:     LD  4,-19(1)	Pop left into ac1 
245:    TGE  3,4,3	Op >= 
* OP  or
246:     LD  4,-19(1)	Pop left into ac1 
247:     OR  3,4,3	Op | 
* Param  10
248:     ST  3,-19(1)	Push parameter 
* TOFF dec:  -20
* Param end  outputb
249:    LDA  1,-14(1)	Ghost frame becomes new active frame 
250:    LDA  3,1(7)	Return address in ac 
251:    JMP  7,-235(7)	call outputb
252:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set:  -14
* EXPRESSION
* CALL  outnl
253:     ST  1,-14(1)	Store fp in ghost frame for  outnl
* TOFF dec:  -15
* TOFF dec:  -16
* Param end  outnl
254:    LDA  1,-14(1)	Ghost frame becomes new active frame 
255:    LDA  3,1(7)	Return address in ac 
256:    JMP  7,-223(7)	call outnl
257:    LDA  3,0(2)	save the result in ac 
* Call end  outnl
* TOFF set:  -14
* EXPRESSION
* ASSIGN  =
258:    LDC  3,11(6)	Load integer constant 
259:     ST  3,-3(1)	Store variable b
* EXPRESSION
* EXPRESSION
* EXPRESSION
* ASSIGN  =
260:    LDC  3,213(6)	Load integer constant 
261:     ST  3,-4(1)	Store variable c
* EXPRESSION
* EXPRESSION
* EXPRESSION
* ASSIGN  =
262:    LDC  3,4133(6)	Load integer constant 
263:     ST  3,-2(1)	Store variable a
* EXPRESSION
* EXPRESSION
* EXPRESSION
* CALL  outputb
264:     ST  1,-17(1)	Store fp in ghost frame for  outputb
* TOFF dec:  -18
* TOFF dec:  -19
265:     ST  3,-19(1)	Push left side 
* TOFF dec:  -20
266:     ST  3,-20(1)	Push left side 
* TOFF dec:  -21
* TOFF dec:  -22
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  >
267:     LD  4,-22(1)	Pop left into ac1 
268:    TGT  3,4,3	Op > 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  <=
269:     LD  4,-22(1)	Pop left into ac1 
270:    TLE  3,4,3	Op <= 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  >=
271:     LD  4,-22(1)	Pop left into ac1 
272:    TGE  3,4,3	Op >= 
* OP  and
273:     LD  4,-22(1)	Pop left into ac1 
274:    AND  3,4,3	Op & 
* OP  or
275:     LD  4,-22(1)	Pop left into ac1 
276:     OR  3,4,3	Op | 
* Param  11
277:     ST  3,-22(1)	Push parameter 
* TOFF dec:  -23
* Param end  outputb
278:    LDA  1,-17(1)	Ghost frame becomes new active frame 
279:    LDA  3,1(7)	Return address in ac 
280:    JMP  7,-264(7)	call outputb
281:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set:  -17
* EXPRESSION
* CALL  outputb
282:     ST  1,-17(1)	Store fp in ghost frame for  outputb
* TOFF dec:  -18
* TOFF dec:  -19
283:     ST  3,-19(1)	Push left side 
* TOFF dec:  -20
284:     ST  3,-20(1)	Push left side 
* TOFF dec:  -21
* TOFF dec:  -22
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  >
285:     LD  4,-22(1)	Pop left into ac1 
286:    TGT  3,4,3	Op > 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  <=
287:     LD  4,-22(1)	Pop left into ac1 
288:    TLE  3,4,3	Op <= 
* OP  and
289:     LD  4,-22(1)	Pop left into ac1 
290:    AND  3,4,3	Op & 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  >=
291:     LD  4,-22(1)	Pop left into ac1 
292:    TGE  3,4,3	Op >= 
* OP  or
293:     LD  4,-22(1)	Pop left into ac1 
294:     OR  3,4,3	Op | 
* Param  12
295:     ST  3,-22(1)	Push parameter 
* TOFF dec:  -23
* Param end  outputb
296:    LDA  1,-17(1)	Ghost frame becomes new active frame 
297:    LDA  3,1(7)	Return address in ac 
298:    JMP  7,-282(7)	call outputb
299:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set:  -17
* EXPRESSION
* CALL  outputb
300:     ST  1,-17(1)	Store fp in ghost frame for  outputb
* TOFF dec:  -18
* TOFF dec:  -19
301:     ST  3,-19(1)	Push left side 
* TOFF dec:  -20
302:     ST  3,-20(1)	Push left side 
* TOFF dec:  -21
* TOFF dec:  -22
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  >
303:     LD  4,-22(1)	Pop left into ac1 
304:    TGT  3,4,3	Op > 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  <=
305:     LD  4,-22(1)	Pop left into ac1 
306:    TLE  3,4,3	Op <= 
* OP  and
307:     LD  4,-22(1)	Pop left into ac1 
308:    AND  3,4,3	Op & 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  >=
309:     LD  4,-22(1)	Pop left into ac1 
310:    TGE  3,4,3	Op >= 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  >=
311:     LD  4,-22(1)	Pop left into ac1 
312:    TGE  3,4,3	Op >= 
* OP  and
313:     LD  4,-22(1)	Pop left into ac1 
314:    AND  3,4,3	Op & 
* OP  or
315:     LD  4,-22(1)	Pop left into ac1 
316:     OR  3,4,3	Op | 
* Param  13
317:     ST  3,-22(1)	Push parameter 
* TOFF dec:  -23
* Param end  outputb
318:    LDA  1,-17(1)	Ghost frame becomes new active frame 
319:    LDA  3,1(7)	Return address in ac 
320:    JMP  7,-304(7)	call outputb
321:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set:  -17
* EXPRESSION
* CALL  outputb
322:     ST  1,-17(1)	Store fp in ghost frame for  outputb
* TOFF dec:  -18
* TOFF dec:  -19
323:     ST  3,-19(1)	Push left side 
* TOFF dec:  -20
324:     ST  3,-20(1)	Push left side 
* TOFF dec:  -21
* TOFF dec:  -22
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  >
325:     LD  4,-22(1)	Pop left into ac1 
326:    TGT  3,4,3	Op > 
* OP  not
327:    LDC  4,1(6)	Load 1 
328:    XOR  3,3,4	Logical not 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  <=
329:     LD  4,-22(1)	Pop left into ac1 
330:    TLE  3,4,3	Op <= 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  >=
331:     LD  4,-22(1)	Pop left into ac1 
332:    TGE  3,4,3	Op >= 
* OP  and
333:     LD  4,-22(1)	Pop left into ac1 
334:    AND  3,4,3	Op & 
* OP  or
335:     LD  4,-22(1)	Pop left into ac1 
336:     OR  3,4,3	Op | 
* Param  14
337:     ST  3,-22(1)	Push parameter 
* TOFF dec:  -23
* Param end  outputb
338:    LDA  1,-17(1)	Ghost frame becomes new active frame 
339:    LDA  3,1(7)	Return address in ac 
340:    JMP  7,-324(7)	call outputb
341:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set:  -17
* EXPRESSION
* CALL  outputb
342:     ST  1,-17(1)	Store fp in ghost frame for  outputb
* TOFF dec:  -18
* TOFF dec:  -19
343:     ST  3,-19(1)	Push left side 
* TOFF dec:  -20
344:     ST  3,-20(1)	Push left side 
* TOFF dec:  -21
* TOFF dec:  -22
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  >
345:     LD  4,-22(1)	Pop left into ac1 
346:    TGT  3,4,3	Op > 
* OP  not
347:    LDC  4,1(6)	Load 1 
348:    XOR  3,3,4	Logical not 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  <=
349:     LD  4,-22(1)	Pop left into ac1 
350:    TLE  3,4,3	Op <= 
* OP  and
351:     LD  4,-22(1)	Pop left into ac1 
352:    AND  3,4,3	Op & 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  >=
353:     LD  4,-22(1)	Pop left into ac1 
354:    TGE  3,4,3	Op >= 
* OP  or
355:     LD  4,-22(1)	Pop left into ac1 
356:     OR  3,4,3	Op | 
* Param  15
357:     ST  3,-22(1)	Push parameter 
* TOFF dec:  -23
* Param end  outputb
358:    LDA  1,-17(1)	Ghost frame becomes new active frame 
359:    LDA  3,1(7)	Return address in ac 
360:    JMP  7,-344(7)	call outputb
361:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set:  -17
* EXPRESSION
* CALL  outnl
362:     ST  1,-17(1)	Store fp in ghost frame for  outnl
* TOFF dec:  -18
* TOFF dec:  -19
* Param end  outnl
363:    LDA  1,-17(1)	Ghost frame becomes new active frame 
364:    LDA  3,1(7)	Return address in ac 
365:    JMP  7,-332(7)	call outnl
366:    LDA  3,0(2)	save the result in ac 
* Call end  outnl
* TOFF set:  -17
* END COMPOUND
* Add standard closing in case there is no return statement
367:    LDC  2,0(6)	Set return value to 0 
368:     LD  3,-1(1)	Load return address 
369:     LD  1,0(1)	Adjust frame pointer 
370:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,370(7)	Jump to init [backpatch] 
* =========================================
* INIT
371:    LDA  1,0(0)	Set first frame at end of globals 
372:     ST  1,0(1)	Store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
373:    LDA  3,1(7)	Return address in ac 
374:    JMP  7,-336(7)	Jump to main 
375:   HALT  0,0(0)	DONE! 
* END INIT
