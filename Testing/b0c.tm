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
* TOFF dec:  -2
* EXPRESSION
* EXPRESSION
* EXPRESSION
 41:    LDC  3,1(6)	Load integer constant 
* OP  ?
 42:    RND  3,3,6	Op ? 
 43:     ST  3,-4(1)	Push left side 
* EXPRESSION
 44:    LDC  3,0(6)	Load integer constant 
* OP  ==
 45:     LD  4,-4(1)	Pop left into ac1 
 46:    TEQ  3,4,3	Op == 
* Param 
 47:     ST  3,-4(1)	Push parameter 
* TOFF dec: 
* Param end  outputb
 48:    LDA  1,-2(1)	Ghost frame becomes new active frame 
 49:    LDA  3,1(7)	Return address in ac 
 50:    JMP  7,-34(7)	call outputb
 51:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set: 
* EXPRESSION
* CALL  outnl
 52:     ST  1,-2(1)	Store fp in ghost frame for  outnl
* TOFF dec:  -2
* Param end  outnl
 53:    LDA  1,-2(1)	Ghost frame becomes new active frame 
 54:    LDA  3,1(7)	Return address in ac 
 55:    JMP  7,-22(7)	call outnl
 56:    LDA  3,0(2)	save the result in ac 
* Call end  outnl
* TOFF set: 
* EXPRESSION
* CALL  outputb
 57:     ST  1,-2(1)	Store fp in ghost frame for  outputb
* TOFF dec:  -2
* EXPRESSION
* EXPRESSION
* EXPRESSION
 58:    LDC  3,100000(6)	Load integer constant 
* OP  ?
 59:    RND  3,3,6	Op ? 
 60:     ST  3,-4(1)	Push left side 
* EXPRESSION
 61:    LDC  3,0(6)	Load integer constant 
* OP  >
 62:     LD  4,-4(1)	Pop left into ac1 
 63:    TGT  3,4,3	Op > 
* Param 
 64:     ST  3,-4(1)	Push parameter 
* TOFF dec: 
* Param end  outputb
 65:    LDA  1,-2(1)	Ghost frame becomes new active frame 
 66:    LDA  3,1(7)	Return address in ac 
 67:    JMP  7,-51(7)	call outputb
 68:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set: 
* EXPRESSION
* CALL  outputb
 69:     ST  1,-2(1)	Store fp in ghost frame for  outputb
* TOFF dec:  -2
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
 70:    LDC  3,3(6)	Load integer constant 
* OP  ?
 71:    RND  3,3,6	Op ? 
 72:     ST  3,-4(1)	Push left side 
* EXPRESSION
 73:    LDC  3,0(6)	Load integer constant 
* OP  >
 74:     LD  4,-4(1)	Pop left into ac1 
 75:    TGT  3,4,3	Op > 
* EXPRESSION
* EXPRESSION
* EXPRESSION
 76:    LDC  3,3(6)	Load integer constant 
* OP  ?
 77:    RND  3,3,6	Op ? 
 78:     ST  3,-4(1)	Push left side 
* EXPRESSION
 79:    LDC  3,0(6)	Load integer constant 
* OP  >
 80:     LD  4,-4(1)	Pop left into ac1 
 81:    TGT  3,4,3	Op > 
* OP  and
 82:     LD  4,-4(1)	Pop left into ac1 
 83:    AND  3,4,3	Op & 
* EXPRESSION
* EXPRESSION
* EXPRESSION
 84:    LDC  3,3(6)	Load integer constant 
* OP  ?
 85:    RND  3,3,6	Op ? 
 86:     ST  3,-4(1)	Push left side 
* EXPRESSION
 87:    LDC  3,0(6)	Load integer constant 
* OP  >
 88:     LD  4,-4(1)	Pop left into ac1 
 89:    TGT  3,4,3	Op > 
* OP  and
 90:     LD  4,-4(1)	Pop left into ac1 
 91:    AND  3,4,3	Op & 
* EXPRESSION
* EXPRESSION
* EXPRESSION
 92:    LDC  3,3(6)	Load integer constant 
* OP  ?
 93:    RND  3,3,6	Op ? 
 94:     ST  3,-4(1)	Push left side 
* EXPRESSION
 95:    LDC  3,0(6)	Load integer constant 
* OP  >
 96:     LD  4,-4(1)	Pop left into ac1 
 97:    TGT  3,4,3	Op > 
* OP  and
 98:     LD  4,-4(1)	Pop left into ac1 
 99:    AND  3,4,3	Op & 
* EXPRESSION
* EXPRESSION
* EXPRESSION
100:    LDC  3,3(6)	Load integer constant 
* OP  ?
101:    RND  3,3,6	Op ? 
102:     ST  3,-4(1)	Push left side 
* EXPRESSION
103:    LDC  3,0(6)	Load integer constant 
* OP  >
104:     LD  4,-4(1)	Pop left into ac1 
105:    TGT  3,4,3	Op > 
* OP  and
106:     LD  4,-4(1)	Pop left into ac1 
107:    AND  3,4,3	Op & 
* EXPRESSION
* EXPRESSION
* EXPRESSION
108:    LDC  3,3(6)	Load integer constant 
* OP  ?
109:    RND  3,3,6	Op ? 
110:     ST  3,-4(1)	Push left side 
* EXPRESSION
111:    LDC  3,0(6)	Load integer constant 
* OP  >
112:     LD  4,-4(1)	Pop left into ac1 
113:    TGT  3,4,3	Op > 
* OP  and
114:     LD  4,-4(1)	Pop left into ac1 
115:    AND  3,4,3	Op & 
* EXPRESSION
* EXPRESSION
* EXPRESSION
116:    LDC  3,3(6)	Load integer constant 
* OP  ?
117:    RND  3,3,6	Op ? 
118:     ST  3,-4(1)	Push left side 
* EXPRESSION
119:    LDC  3,0(6)	Load integer constant 
* OP  >
120:     LD  4,-4(1)	Pop left into ac1 
121:    TGT  3,4,3	Op > 
* OP  and
122:     LD  4,-4(1)	Pop left into ac1 
123:    AND  3,4,3	Op & 
* EXPRESSION
* EXPRESSION
* EXPRESSION
124:    LDC  3,3(6)	Load integer constant 
* OP  ?
125:    RND  3,3,6	Op ? 
126:     ST  3,-4(1)	Push left side 
* EXPRESSION
127:    LDC  3,0(6)	Load integer constant 
* OP  >
128:     LD  4,-4(1)	Pop left into ac1 
129:    TGT  3,4,3	Op > 
* OP  and
130:     LD  4,-4(1)	Pop left into ac1 
131:    AND  3,4,3	Op & 
* EXPRESSION
* EXPRESSION
* EXPRESSION
132:    LDC  3,3(6)	Load integer constant 
* OP  ?
133:    RND  3,3,6	Op ? 
134:     ST  3,-4(1)	Push left side 
* EXPRESSION
135:    LDC  3,0(6)	Load integer constant 
* OP  >
136:     LD  4,-4(1)	Pop left into ac1 
137:    TGT  3,4,3	Op > 
* OP  and
138:     LD  4,-4(1)	Pop left into ac1 
139:    AND  3,4,3	Op & 
* EXPRESSION
* EXPRESSION
* EXPRESSION
140:    LDC  3,3(6)	Load integer constant 
* OP  ?
141:    RND  3,3,6	Op ? 
142:     ST  3,-4(1)	Push left side 
* EXPRESSION
143:    LDC  3,0(6)	Load integer constant 
* OP  >
144:     LD  4,-4(1)	Pop left into ac1 
145:    TGT  3,4,3	Op > 
* OP  and
146:     LD  4,-4(1)	Pop left into ac1 
147:    AND  3,4,3	Op & 
* EXPRESSION
* EXPRESSION
* EXPRESSION
148:    LDC  3,3(6)	Load integer constant 
* OP  ?
149:    RND  3,3,6	Op ? 
150:     ST  3,-4(1)	Push left side 
* EXPRESSION
151:    LDC  3,0(6)	Load integer constant 
* OP  >
152:     LD  4,-4(1)	Pop left into ac1 
153:    TGT  3,4,3	Op > 
* OP  and
154:     LD  4,-4(1)	Pop left into ac1 
155:    AND  3,4,3	Op & 
* EXPRESSION
* EXPRESSION
* EXPRESSION
156:    LDC  3,3(6)	Load integer constant 
* OP  ?
157:    RND  3,3,6	Op ? 
158:     ST  3,-4(1)	Push left side 
* EXPRESSION
159:    LDC  3,0(6)	Load integer constant 
* OP  >
160:     LD  4,-4(1)	Pop left into ac1 
161:    TGT  3,4,3	Op > 
* OP  and
162:     LD  4,-4(1)	Pop left into ac1 
163:    AND  3,4,3	Op & 
* EXPRESSION
* EXPRESSION
* EXPRESSION
164:    LDC  3,3(6)	Load integer constant 
* OP  ?
165:    RND  3,3,6	Op ? 
166:     ST  3,-4(1)	Push left side 
* EXPRESSION
167:    LDC  3,0(6)	Load integer constant 
* OP  >
168:     LD  4,-4(1)	Pop left into ac1 
169:    TGT  3,4,3	Op > 
* OP  and
170:     LD  4,-4(1)	Pop left into ac1 
171:    AND  3,4,3	Op & 
* Param 
172:     ST  3,-4(1)	Push parameter 
* TOFF dec: 
* Param end  outputb
173:    LDA  1,-2(1)	Ghost frame becomes new active frame 
174:    LDA  3,1(7)	Return address in ac 
175:    JMP  7,-159(7)	call outputb
176:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set: 
* EXPRESSION
* CALL  outputb
177:     ST  1,-2(1)	Store fp in ghost frame for  outputb
* TOFF dec:  -2
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
178:    LDC  3,3(6)	Load integer constant 
* OP  ?
179:    RND  3,3,6	Op ? 
180:     ST  3,-4(1)	Push left side 
* EXPRESSION
181:    LDC  3,0(6)	Load integer constant 
* OP  >
182:     LD  4,-4(1)	Pop left into ac1 
183:    TGT  3,4,3	Op > 
* EXPRESSION
* EXPRESSION
* EXPRESSION
184:    LDC  3,3(6)	Load integer constant 
* OP  ?
185:    RND  3,3,6	Op ? 
186:     ST  3,-4(1)	Push left side 
* EXPRESSION
187:    LDC  3,0(6)	Load integer constant 
* OP  >
188:     LD  4,-4(1)	Pop left into ac1 
189:    TGT  3,4,3	Op > 
* OP  or
190:     LD  4,-4(1)	Pop left into ac1 
191:     OR  3,4,3	Op | 
* EXPRESSION
* EXPRESSION
* EXPRESSION
192:    LDC  3,3(6)	Load integer constant 
* OP  ?
193:    RND  3,3,6	Op ? 
194:     ST  3,-4(1)	Push left side 
* EXPRESSION
195:    LDC  3,0(6)	Load integer constant 
* OP  >
196:     LD  4,-4(1)	Pop left into ac1 
197:    TGT  3,4,3	Op > 
* OP  or
198:     LD  4,-4(1)	Pop left into ac1 
199:     OR  3,4,3	Op | 
* EXPRESSION
* EXPRESSION
* EXPRESSION
200:    LDC  3,3(6)	Load integer constant 
* OP  ?
201:    RND  3,3,6	Op ? 
202:     ST  3,-4(1)	Push left side 
* EXPRESSION
203:    LDC  3,0(6)	Load integer constant 
* OP  >
204:     LD  4,-4(1)	Pop left into ac1 
205:    TGT  3,4,3	Op > 
* OP  or
206:     LD  4,-4(1)	Pop left into ac1 
207:     OR  3,4,3	Op | 
* EXPRESSION
* EXPRESSION
* EXPRESSION
208:    LDC  3,3(6)	Load integer constant 
* OP  ?
209:    RND  3,3,6	Op ? 
210:     ST  3,-4(1)	Push left side 
* EXPRESSION
211:    LDC  3,0(6)	Load integer constant 
* OP  >
212:     LD  4,-4(1)	Pop left into ac1 
213:    TGT  3,4,3	Op > 
* OP  or
214:     LD  4,-4(1)	Pop left into ac1 
215:     OR  3,4,3	Op | 
* EXPRESSION
* EXPRESSION
* EXPRESSION
216:    LDC  3,3(6)	Load integer constant 
* OP  ?
217:    RND  3,3,6	Op ? 
218:     ST  3,-4(1)	Push left side 
* EXPRESSION
219:    LDC  3,0(6)	Load integer constant 
* OP  >
220:     LD  4,-4(1)	Pop left into ac1 
221:    TGT  3,4,3	Op > 
* OP  or
222:     LD  4,-4(1)	Pop left into ac1 
223:     OR  3,4,3	Op | 
* EXPRESSION
* EXPRESSION
* EXPRESSION
224:    LDC  3,3(6)	Load integer constant 
* OP  ?
225:    RND  3,3,6	Op ? 
226:     ST  3,-4(1)	Push left side 
* EXPRESSION
227:    LDC  3,0(6)	Load integer constant 
* OP  >
228:     LD  4,-4(1)	Pop left into ac1 
229:    TGT  3,4,3	Op > 
* OP  or
230:     LD  4,-4(1)	Pop left into ac1 
231:     OR  3,4,3	Op | 
* EXPRESSION
* EXPRESSION
* EXPRESSION
232:    LDC  3,3(6)	Load integer constant 
* OP  ?
233:    RND  3,3,6	Op ? 
234:     ST  3,-4(1)	Push left side 
* EXPRESSION
235:    LDC  3,0(6)	Load integer constant 
* OP  >
236:     LD  4,-4(1)	Pop left into ac1 
237:    TGT  3,4,3	Op > 
* OP  or
238:     LD  4,-4(1)	Pop left into ac1 
239:     OR  3,4,3	Op | 
* EXPRESSION
* EXPRESSION
* EXPRESSION
240:    LDC  3,3(6)	Load integer constant 
* OP  ?
241:    RND  3,3,6	Op ? 
242:     ST  3,-4(1)	Push left side 
* EXPRESSION
243:    LDC  3,0(6)	Load integer constant 
* OP  >
244:     LD  4,-4(1)	Pop left into ac1 
245:    TGT  3,4,3	Op > 
* OP  or
246:     LD  4,-4(1)	Pop left into ac1 
247:     OR  3,4,3	Op | 
* EXPRESSION
* EXPRESSION
* EXPRESSION
248:    LDC  3,3(6)	Load integer constant 
* OP  ?
249:    RND  3,3,6	Op ? 
250:     ST  3,-4(1)	Push left side 
* EXPRESSION
251:    LDC  3,0(6)	Load integer constant 
* OP  >
252:     LD  4,-4(1)	Pop left into ac1 
253:    TGT  3,4,3	Op > 
* OP  or
254:     LD  4,-4(1)	Pop left into ac1 
255:     OR  3,4,3	Op | 
* EXPRESSION
* EXPRESSION
* EXPRESSION
256:    LDC  3,3(6)	Load integer constant 
* OP  ?
257:    RND  3,3,6	Op ? 
258:     ST  3,-4(1)	Push left side 
* EXPRESSION
259:    LDC  3,0(6)	Load integer constant 
* OP  >
260:     LD  4,-4(1)	Pop left into ac1 
261:    TGT  3,4,3	Op > 
* OP  or
262:     LD  4,-4(1)	Pop left into ac1 
263:     OR  3,4,3	Op | 
* EXPRESSION
* EXPRESSION
* EXPRESSION
264:    LDC  3,3(6)	Load integer constant 
* OP  ?
265:    RND  3,3,6	Op ? 
266:     ST  3,-4(1)	Push left side 
* EXPRESSION
267:    LDC  3,0(6)	Load integer constant 
* OP  >
268:     LD  4,-4(1)	Pop left into ac1 
269:    TGT  3,4,3	Op > 
* OP  or
270:     LD  4,-4(1)	Pop left into ac1 
271:     OR  3,4,3	Op | 
* EXPRESSION
* EXPRESSION
* EXPRESSION
272:    LDC  3,3(6)	Load integer constant 
* OP  ?
273:    RND  3,3,6	Op ? 
274:     ST  3,-4(1)	Push left side 
* EXPRESSION
275:    LDC  3,0(6)	Load integer constant 
* OP  >
276:     LD  4,-4(1)	Pop left into ac1 
277:    TGT  3,4,3	Op > 
* OP  or
278:     LD  4,-4(1)	Pop left into ac1 
279:     OR  3,4,3	Op | 
* Param 
280:     ST  3,-4(1)	Push parameter 
* TOFF dec: 
* Param end  outputb
281:    LDA  1,-2(1)	Ghost frame becomes new active frame 
282:    LDA  3,1(7)	Return address in ac 
283:    JMP  7,-267(7)	call outputb
284:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set: 
* EXPRESSION
* CALL  outnl
285:     ST  1,-2(1)	Store fp in ghost frame for  outnl
* TOFF dec:  -2
* Param end  outnl
286:    LDA  1,-2(1)	Ghost frame becomes new active frame 
287:    LDA  3,1(7)	Return address in ac 
288:    JMP  7,-255(7)	call outnl
289:    LDA  3,0(2)	save the result in ac 
* Call end  outnl
* TOFF set: 
* END COMPOUND
* Add standard closing in case there is no return statement
290:    LDC  2,0(6)	Set return value to 0 
291:     LD  3,-1(1)	Load return address 
292:     LD  1,0(1)	Adjust frame pointer 
293:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,293(7)	Jump to init [backpatch] 
* =========================================
* INIT
294:    LDA  1,-54(0)	Set first frame at end of globals 
295:     ST  1,0(1)	Store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
296:    LDA  3,1(7)	Return address in ac 
297:    JMP  7,-259(7)	Jump to main 
298:   HALT  0,0(0)	DONE! 
* END INIT
