* C- version: 1.00
* by Sydney Petrehn
* Input file: b0c.c-
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
* TOFF set:  -2
* Compound body
* EXPRESSION
* CALL  outputb
 40:     ST  1,-2(1)	Store fp in ghost frame for  outputb
* TOFF dec:  -3
* TOFF dec:  -4
 41:     LD  3,0(0)	Load variable ?
 42:     ST  3,-4(1)	Push left side 
 43:     LD  3,0(0)	Load variable (null)
* EXPRESSION
* EXPRESSION
* EXPRESSION
 44:    LDC  3,1(6)	Load integer constant 
* OP  ?
 45:    RND  3,3,6	Op ? 
 46:     ST  3,-4(1)	Push left side 
* EXPRESSION
 47:    LDC  3,0(6)	Load integer constant 
* OP  ==
 48:     LD  4,-4(1)	Pop left into ac1 
 49:    TEQ  3,4,3	Op == 
* Param 
 50:     ST  3,-4(1)	Push parameter 
* TOFF dec: 
* Param end  outputb
 51:    LDA  1,-2(1)	Ghost frame becomes new active frame 
 52:    LDA  3,1(7)	Return address in ac 
 53:    JMP  7,-37(7)	call outputb
 54:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set: 
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
* TOFF set: 
* EXPRESSION
* CALL  outputb
 60:     ST  1,-2(1)	Store fp in ghost frame for  outputb
* TOFF dec:  -3
* TOFF dec:  -4
 61:     LD  3,0(0)	Load variable ?
 62:     ST  3,-4(1)	Push left side 
 63:     LD  3,0(0)	Load variable (null)
* EXPRESSION
* EXPRESSION
* EXPRESSION
 64:    LDC  3,100000(6)	Load integer constant 
* OP  ?
 65:    RND  3,3,6	Op ? 
 66:     ST  3,-4(1)	Push left side 
* EXPRESSION
 67:    LDC  3,0(6)	Load integer constant 
* OP  >
 68:     LD  4,-4(1)	Pop left into ac1 
 69:    TGT  3,4,3	Op > 
* Param 
 70:     ST  3,-4(1)	Push parameter 
* TOFF dec: 
* Param end  outputb
 71:    LDA  1,-2(1)	Ghost frame becomes new active frame 
 72:    LDA  3,1(7)	Return address in ac 
 73:    JMP  7,-57(7)	call outputb
 74:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set: 
* EXPRESSION
* CALL  outputb
 75:     ST  1,-2(1)	Store fp in ghost frame for  outputb
* TOFF dec:  -3
* TOFF dec:  -4
 76:     LD  3,0(0)	Load variable and
 77:     ST  3,-4(1)	Push left side 
 78:     LD  3,0(0)	Load variable >
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
 79:    LDC  3,3(6)	Load integer constant 
* OP  ?
 80:    RND  3,3,6	Op ? 
 81:     ST  3,-4(1)	Push left side 
* EXPRESSION
 82:    LDC  3,0(6)	Load integer constant 
* OP  >
 83:     LD  4,-4(1)	Pop left into ac1 
 84:    TGT  3,4,3	Op > 
* EXPRESSION
* EXPRESSION
* EXPRESSION
 85:    LDC  3,3(6)	Load integer constant 
* OP  ?
 86:    RND  3,3,6	Op ? 
 87:     ST  3,-4(1)	Push left side 
* EXPRESSION
 88:    LDC  3,0(6)	Load integer constant 
* OP  >
 89:     LD  4,-4(1)	Pop left into ac1 
 90:    TGT  3,4,3	Op > 
* OP  and
 91:     LD  4,-4(1)	Pop left into ac1 
 92:    AND  3,4,3	Op & 
* EXPRESSION
* EXPRESSION
* EXPRESSION
 93:    LDC  3,3(6)	Load integer constant 
* OP  ?
 94:    RND  3,3,6	Op ? 
 95:     ST  3,-4(1)	Push left side 
* EXPRESSION
 96:    LDC  3,0(6)	Load integer constant 
* OP  >
 97:     LD  4,-4(1)	Pop left into ac1 
 98:    TGT  3,4,3	Op > 
* OP  and
 99:     LD  4,-4(1)	Pop left into ac1 
100:    AND  3,4,3	Op & 
* EXPRESSION
* EXPRESSION
* EXPRESSION
101:    LDC  3,3(6)	Load integer constant 
* OP  ?
102:    RND  3,3,6	Op ? 
103:     ST  3,-4(1)	Push left side 
* EXPRESSION
104:    LDC  3,0(6)	Load integer constant 
* OP  >
105:     LD  4,-4(1)	Pop left into ac1 
106:    TGT  3,4,3	Op > 
* OP  and
107:     LD  4,-4(1)	Pop left into ac1 
108:    AND  3,4,3	Op & 
* EXPRESSION
* EXPRESSION
* EXPRESSION
109:    LDC  3,3(6)	Load integer constant 
* OP  ?
110:    RND  3,3,6	Op ? 
111:     ST  3,-4(1)	Push left side 
* EXPRESSION
112:    LDC  3,0(6)	Load integer constant 
* OP  >
113:     LD  4,-4(1)	Pop left into ac1 
114:    TGT  3,4,3	Op > 
* OP  and
115:     LD  4,-4(1)	Pop left into ac1 
116:    AND  3,4,3	Op & 
* EXPRESSION
* EXPRESSION
* EXPRESSION
117:    LDC  3,3(6)	Load integer constant 
* OP  ?
118:    RND  3,3,6	Op ? 
119:     ST  3,-4(1)	Push left side 
* EXPRESSION
120:    LDC  3,0(6)	Load integer constant 
* OP  >
121:     LD  4,-4(1)	Pop left into ac1 
122:    TGT  3,4,3	Op > 
* OP  and
123:     LD  4,-4(1)	Pop left into ac1 
124:    AND  3,4,3	Op & 
* EXPRESSION
* EXPRESSION
* EXPRESSION
125:    LDC  3,3(6)	Load integer constant 
* OP  ?
126:    RND  3,3,6	Op ? 
127:     ST  3,-4(1)	Push left side 
* EXPRESSION
128:    LDC  3,0(6)	Load integer constant 
* OP  >
129:     LD  4,-4(1)	Pop left into ac1 
130:    TGT  3,4,3	Op > 
* OP  and
131:     LD  4,-4(1)	Pop left into ac1 
132:    AND  3,4,3	Op & 
* EXPRESSION
* EXPRESSION
* EXPRESSION
133:    LDC  3,3(6)	Load integer constant 
* OP  ?
134:    RND  3,3,6	Op ? 
135:     ST  3,-4(1)	Push left side 
* EXPRESSION
136:    LDC  3,0(6)	Load integer constant 
* OP  >
137:     LD  4,-4(1)	Pop left into ac1 
138:    TGT  3,4,3	Op > 
* OP  and
139:     LD  4,-4(1)	Pop left into ac1 
140:    AND  3,4,3	Op & 
* EXPRESSION
* EXPRESSION
* EXPRESSION
141:    LDC  3,3(6)	Load integer constant 
* OP  ?
142:    RND  3,3,6	Op ? 
143:     ST  3,-4(1)	Push left side 
* EXPRESSION
144:    LDC  3,0(6)	Load integer constant 
* OP  >
145:     LD  4,-4(1)	Pop left into ac1 
146:    TGT  3,4,3	Op > 
* OP  and
147:     LD  4,-4(1)	Pop left into ac1 
148:    AND  3,4,3	Op & 
* EXPRESSION
* EXPRESSION
* EXPRESSION
149:    LDC  3,3(6)	Load integer constant 
* OP  ?
150:    RND  3,3,6	Op ? 
151:     ST  3,-4(1)	Push left side 
* EXPRESSION
152:    LDC  3,0(6)	Load integer constant 
* OP  >
153:     LD  4,-4(1)	Pop left into ac1 
154:    TGT  3,4,3	Op > 
* OP  and
155:     LD  4,-4(1)	Pop left into ac1 
156:    AND  3,4,3	Op & 
* EXPRESSION
* EXPRESSION
* EXPRESSION
157:    LDC  3,3(6)	Load integer constant 
* OP  ?
158:    RND  3,3,6	Op ? 
159:     ST  3,-4(1)	Push left side 
* EXPRESSION
160:    LDC  3,0(6)	Load integer constant 
* OP  >
161:     LD  4,-4(1)	Pop left into ac1 
162:    TGT  3,4,3	Op > 
* OP  and
163:     LD  4,-4(1)	Pop left into ac1 
164:    AND  3,4,3	Op & 
* EXPRESSION
* EXPRESSION
* EXPRESSION
165:    LDC  3,3(6)	Load integer constant 
* OP  ?
166:    RND  3,3,6	Op ? 
167:     ST  3,-4(1)	Push left side 
* EXPRESSION
168:    LDC  3,0(6)	Load integer constant 
* OP  >
169:     LD  4,-4(1)	Pop left into ac1 
170:    TGT  3,4,3	Op > 
* OP  and
171:     LD  4,-4(1)	Pop left into ac1 
172:    AND  3,4,3	Op & 
* EXPRESSION
* EXPRESSION
* EXPRESSION
173:    LDC  3,3(6)	Load integer constant 
* OP  ?
174:    RND  3,3,6	Op ? 
175:     ST  3,-4(1)	Push left side 
* EXPRESSION
176:    LDC  3,0(6)	Load integer constant 
* OP  >
177:     LD  4,-4(1)	Pop left into ac1 
178:    TGT  3,4,3	Op > 
* OP  and
179:     LD  4,-4(1)	Pop left into ac1 
180:    AND  3,4,3	Op & 
* Param 
181:     ST  3,-4(1)	Push parameter 
* TOFF dec: 
* Param end  outputb
182:    LDA  1,-2(1)	Ghost frame becomes new active frame 
183:    LDA  3,1(7)	Return address in ac 
184:    JMP  7,-168(7)	call outputb
185:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set: 
* EXPRESSION
* CALL  outputb
186:     ST  1,-2(1)	Store fp in ghost frame for  outputb
* TOFF dec:  -3
* TOFF dec:  -4
187:     LD  3,0(0)	Load variable or
188:     ST  3,-4(1)	Push left side 
189:     LD  3,0(0)	Load variable >
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
190:    LDC  3,3(6)	Load integer constant 
* OP  ?
191:    RND  3,3,6	Op ? 
192:     ST  3,-4(1)	Push left side 
* EXPRESSION
193:    LDC  3,0(6)	Load integer constant 
* OP  >
194:     LD  4,-4(1)	Pop left into ac1 
195:    TGT  3,4,3	Op > 
* EXPRESSION
* EXPRESSION
* EXPRESSION
196:    LDC  3,3(6)	Load integer constant 
* OP  ?
197:    RND  3,3,6	Op ? 
198:     ST  3,-4(1)	Push left side 
* EXPRESSION
199:    LDC  3,0(6)	Load integer constant 
* OP  >
200:     LD  4,-4(1)	Pop left into ac1 
201:    TGT  3,4,3	Op > 
* OP  or
202:     LD  4,-4(1)	Pop left into ac1 
203:     OR  3,4,3	Op | 
* EXPRESSION
* EXPRESSION
* EXPRESSION
204:    LDC  3,3(6)	Load integer constant 
* OP  ?
205:    RND  3,3,6	Op ? 
206:     ST  3,-4(1)	Push left side 
* EXPRESSION
207:    LDC  3,0(6)	Load integer constant 
* OP  >
208:     LD  4,-4(1)	Pop left into ac1 
209:    TGT  3,4,3	Op > 
* OP  or
210:     LD  4,-4(1)	Pop left into ac1 
211:     OR  3,4,3	Op | 
* EXPRESSION
* EXPRESSION
* EXPRESSION
212:    LDC  3,3(6)	Load integer constant 
* OP  ?
213:    RND  3,3,6	Op ? 
214:     ST  3,-4(1)	Push left side 
* EXPRESSION
215:    LDC  3,0(6)	Load integer constant 
* OP  >
216:     LD  4,-4(1)	Pop left into ac1 
217:    TGT  3,4,3	Op > 
* OP  or
218:     LD  4,-4(1)	Pop left into ac1 
219:     OR  3,4,3	Op | 
* EXPRESSION
* EXPRESSION
* EXPRESSION
220:    LDC  3,3(6)	Load integer constant 
* OP  ?
221:    RND  3,3,6	Op ? 
222:     ST  3,-4(1)	Push left side 
* EXPRESSION
223:    LDC  3,0(6)	Load integer constant 
* OP  >
224:     LD  4,-4(1)	Pop left into ac1 
225:    TGT  3,4,3	Op > 
* OP  or
226:     LD  4,-4(1)	Pop left into ac1 
227:     OR  3,4,3	Op | 
* EXPRESSION
* EXPRESSION
* EXPRESSION
228:    LDC  3,3(6)	Load integer constant 
* OP  ?
229:    RND  3,3,6	Op ? 
230:     ST  3,-4(1)	Push left side 
* EXPRESSION
231:    LDC  3,0(6)	Load integer constant 
* OP  >
232:     LD  4,-4(1)	Pop left into ac1 
233:    TGT  3,4,3	Op > 
* OP  or
234:     LD  4,-4(1)	Pop left into ac1 
235:     OR  3,4,3	Op | 
* EXPRESSION
* EXPRESSION
* EXPRESSION
236:    LDC  3,3(6)	Load integer constant 
* OP  ?
237:    RND  3,3,6	Op ? 
238:     ST  3,-4(1)	Push left side 
* EXPRESSION
239:    LDC  3,0(6)	Load integer constant 
* OP  >
240:     LD  4,-4(1)	Pop left into ac1 
241:    TGT  3,4,3	Op > 
* OP  or
242:     LD  4,-4(1)	Pop left into ac1 
243:     OR  3,4,3	Op | 
* EXPRESSION
* EXPRESSION
* EXPRESSION
244:    LDC  3,3(6)	Load integer constant 
* OP  ?
245:    RND  3,3,6	Op ? 
246:     ST  3,-4(1)	Push left side 
* EXPRESSION
247:    LDC  3,0(6)	Load integer constant 
* OP  >
248:     LD  4,-4(1)	Pop left into ac1 
249:    TGT  3,4,3	Op > 
* OP  or
250:     LD  4,-4(1)	Pop left into ac1 
251:     OR  3,4,3	Op | 
* EXPRESSION
* EXPRESSION
* EXPRESSION
252:    LDC  3,3(6)	Load integer constant 
* OP  ?
253:    RND  3,3,6	Op ? 
254:     ST  3,-4(1)	Push left side 
* EXPRESSION
255:    LDC  3,0(6)	Load integer constant 
* OP  >
256:     LD  4,-4(1)	Pop left into ac1 
257:    TGT  3,4,3	Op > 
* OP  or
258:     LD  4,-4(1)	Pop left into ac1 
259:     OR  3,4,3	Op | 
* EXPRESSION
* EXPRESSION
* EXPRESSION
260:    LDC  3,3(6)	Load integer constant 
* OP  ?
261:    RND  3,3,6	Op ? 
262:     ST  3,-4(1)	Push left side 
* EXPRESSION
263:    LDC  3,0(6)	Load integer constant 
* OP  >
264:     LD  4,-4(1)	Pop left into ac1 
265:    TGT  3,4,3	Op > 
* OP  or
266:     LD  4,-4(1)	Pop left into ac1 
267:     OR  3,4,3	Op | 
* EXPRESSION
* EXPRESSION
* EXPRESSION
268:    LDC  3,3(6)	Load integer constant 
* OP  ?
269:    RND  3,3,6	Op ? 
270:     ST  3,-4(1)	Push left side 
* EXPRESSION
271:    LDC  3,0(6)	Load integer constant 
* OP  >
272:     LD  4,-4(1)	Pop left into ac1 
273:    TGT  3,4,3	Op > 
* OP  or
274:     LD  4,-4(1)	Pop left into ac1 
275:     OR  3,4,3	Op | 
* EXPRESSION
* EXPRESSION
* EXPRESSION
276:    LDC  3,3(6)	Load integer constant 
* OP  ?
277:    RND  3,3,6	Op ? 
278:     ST  3,-4(1)	Push left side 
* EXPRESSION
279:    LDC  3,0(6)	Load integer constant 
* OP  >
280:     LD  4,-4(1)	Pop left into ac1 
281:    TGT  3,4,3	Op > 
* OP  or
282:     LD  4,-4(1)	Pop left into ac1 
283:     OR  3,4,3	Op | 
* EXPRESSION
* EXPRESSION
* EXPRESSION
284:    LDC  3,3(6)	Load integer constant 
* OP  ?
285:    RND  3,3,6	Op ? 
286:     ST  3,-4(1)	Push left side 
* EXPRESSION
287:    LDC  3,0(6)	Load integer constant 
* OP  >
288:     LD  4,-4(1)	Pop left into ac1 
289:    TGT  3,4,3	Op > 
* OP  or
290:     LD  4,-4(1)	Pop left into ac1 
291:     OR  3,4,3	Op | 
* Param 
292:     ST  3,-4(1)	Push parameter 
* TOFF dec: 
* Param end  outputb
293:    LDA  1,-2(1)	Ghost frame becomes new active frame 
294:    LDA  3,1(7)	Return address in ac 
295:    JMP  7,-279(7)	call outputb
296:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set: 
* EXPRESSION
* CALL  outnl
297:     ST  1,-2(1)	Store fp in ghost frame for  outnl
* TOFF dec:  -3
* TOFF dec:  -4
* Param end  outnl
298:    LDA  1,-2(1)	Ghost frame becomes new active frame 
299:    LDA  3,1(7)	Return address in ac 
300:    JMP  7,-267(7)	call outnl
301:    LDA  3,0(2)	save the result in ac 
* Call end  outnl
* TOFF set: 
* END COMPOUND
* Add standard closing in case there is no return statement
302:    LDC  2,0(6)	Set return value to 0 
303:     LD  3,-1(1)	Load return address 
304:     LD  1,0(1)	Adjust frame pointer 
305:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,305(7)	Jump to init [backpatch] 
* =========================================
* INIT
306:    LDA  1,0(0)	Set first frame at end of globals 
307:     ST  1,0(1)	Store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
308:    LDA  3,1(7)	Return address in ac 
309:    JMP  7,-271(7)	Jump to main 
310:   HALT  0,0(0)	DONE! 
* END INIT
