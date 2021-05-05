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
* TOFF set: 
 39:     ST  3,-1(1)	store return address 
* COMPOUND
* TOFF set: 
* Compound body
* EXPRESSION
* CALL  outputb
 40:     ST  1,-3(1)	Store fp in ghost frame for  outputb
* TOFF dec: 
* TOFF dec: 
* EXPRESSION
* EXPRESSION
* EXPRESSION
 41:    LDC  3,1(6)	Load integer constant 
 42:     LD  4,-5(1)	Pop left into ac1 
* OP  ?
 43:    RND  3,3,3	Op ? 
* EXPRESSION
 44:    LDC  3,0(6)	Load integer constant 
 45:     LD  4,-5(1)	Pop left into ac1 
* OP  ==
 46:    TEQ  3,4,3	Op == 
* Param 
 47:     ST  3,-5(1)	Push parameter 
* TOFF dec: 
* Param end  outputb
 48:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 49:    LDA  3,1(7)	Return address in ac 
 50:    JMP  7,-34(7)	call outputb
 51:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set: 
* EXPRESSION
* CALL  outnl
 52:     ST  1,-3(1)	Store fp in ghost frame for  outnl
* TOFF dec: 
* TOFF dec: 
* Param end  outnl
 53:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 54:    LDA  3,1(7)	Return address in ac 
 55:    JMP  7,-22(7)	call outnl
 56:    LDA  3,0(2)	save the result in ac 
* Call end  outnl
* TOFF set: 
* EXPRESSION
* CALL  outputb
 57:     ST  1,-3(1)	Store fp in ghost frame for  outputb
* TOFF dec: 
* TOFF dec: 
* EXPRESSION
* EXPRESSION
* EXPRESSION
 58:    LDC  3,100000(6)	Load integer constant 
 59:     LD  4,-5(1)	Pop left into ac1 
* OP  ?
 60:    RND  3,3,3	Op ? 
* EXPRESSION
 61:    LDC  3,0(6)	Load integer constant 
 62:     LD  4,-5(1)	Pop left into ac1 
* OP  >
 63:    TGT  3,4,3	Op > 
* Param 
 64:     ST  3,-5(1)	Push parameter 
* TOFF dec: 
* Param end  outputb
 65:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 66:    LDA  3,1(7)	Return address in ac 
 67:    JMP  7,-51(7)	call outputb
 68:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set: 
* EXPRESSION
* CALL  outputb
 69:     ST  1,-3(1)	Store fp in ghost frame for  outputb
* TOFF dec: 
* TOFF dec: 
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
 71:     LD  4,-5(1)	Pop left into ac1 
* OP  ?
 72:    RND  3,3,3	Op ? 
* EXPRESSION
 73:    LDC  3,0(6)	Load integer constant 
 74:     LD  4,-5(1)	Pop left into ac1 
* OP  >
 75:    TGT  3,4,3	Op > 
* EXPRESSION
* EXPRESSION
* EXPRESSION
 76:    LDC  3,3(6)	Load integer constant 
 77:     LD  4,-5(1)	Pop left into ac1 
* OP  ?
 78:    RND  3,3,3	Op ? 
* EXPRESSION
 79:    LDC  3,0(6)	Load integer constant 
 80:     LD  4,-5(1)	Pop left into ac1 
* OP  >
 81:    TGT  3,4,3	Op > 
 82:     LD  4,-5(1)	Pop left into ac1 
* OP  and
 83:    AND  3,4,3	Op & 
* EXPRESSION
* EXPRESSION
* EXPRESSION
 84:    LDC  3,3(6)	Load integer constant 
 85:     LD  4,-5(1)	Pop left into ac1 
* OP  ?
 86:    RND  3,3,3	Op ? 
* EXPRESSION
 87:    LDC  3,0(6)	Load integer constant 
 88:     LD  4,-5(1)	Pop left into ac1 
* OP  >
 89:    TGT  3,4,3	Op > 
 90:     LD  4,-5(1)	Pop left into ac1 
* OP  and
 91:    AND  3,4,3	Op & 
* EXPRESSION
* EXPRESSION
* EXPRESSION
 92:    LDC  3,3(6)	Load integer constant 
 93:     LD  4,-5(1)	Pop left into ac1 
* OP  ?
 94:    RND  3,3,3	Op ? 
* EXPRESSION
 95:    LDC  3,0(6)	Load integer constant 
 96:     LD  4,-5(1)	Pop left into ac1 
* OP  >
 97:    TGT  3,4,3	Op > 
 98:     LD  4,-5(1)	Pop left into ac1 
* OP  and
 99:    AND  3,4,3	Op & 
* EXPRESSION
* EXPRESSION
* EXPRESSION
100:    LDC  3,3(6)	Load integer constant 
101:     LD  4,-5(1)	Pop left into ac1 
* OP  ?
102:    RND  3,3,3	Op ? 
* EXPRESSION
103:    LDC  3,0(6)	Load integer constant 
104:     LD  4,-5(1)	Pop left into ac1 
* OP  >
105:    TGT  3,4,3	Op > 
106:     LD  4,-5(1)	Pop left into ac1 
* OP  and
107:    AND  3,4,3	Op & 
* EXPRESSION
* EXPRESSION
* EXPRESSION
108:    LDC  3,3(6)	Load integer constant 
109:     LD  4,-5(1)	Pop left into ac1 
* OP  ?
110:    RND  3,3,3	Op ? 
* EXPRESSION
111:    LDC  3,0(6)	Load integer constant 
112:     LD  4,-5(1)	Pop left into ac1 
* OP  >
113:    TGT  3,4,3	Op > 
114:     LD  4,-5(1)	Pop left into ac1 
* OP  and
115:    AND  3,4,3	Op & 
* EXPRESSION
* EXPRESSION
* EXPRESSION
116:    LDC  3,3(6)	Load integer constant 
117:     LD  4,-5(1)	Pop left into ac1 
* OP  ?
118:    RND  3,3,3	Op ? 
* EXPRESSION
119:    LDC  3,0(6)	Load integer constant 
120:     LD  4,-5(1)	Pop left into ac1 
* OP  >
121:    TGT  3,4,3	Op > 
122:     LD  4,-5(1)	Pop left into ac1 
* OP  and
123:    AND  3,4,3	Op & 
* EXPRESSION
* EXPRESSION
* EXPRESSION
124:    LDC  3,3(6)	Load integer constant 
125:     LD  4,-5(1)	Pop left into ac1 
* OP  ?
126:    RND  3,3,3	Op ? 
* EXPRESSION
127:    LDC  3,0(6)	Load integer constant 
128:     LD  4,-5(1)	Pop left into ac1 
* OP  >
129:    TGT  3,4,3	Op > 
130:     LD  4,-5(1)	Pop left into ac1 
* OP  and
131:    AND  3,4,3	Op & 
* EXPRESSION
* EXPRESSION
* EXPRESSION
132:    LDC  3,3(6)	Load integer constant 
133:     LD  4,-5(1)	Pop left into ac1 
* OP  ?
134:    RND  3,3,3	Op ? 
* EXPRESSION
135:    LDC  3,0(6)	Load integer constant 
136:     LD  4,-5(1)	Pop left into ac1 
* OP  >
137:    TGT  3,4,3	Op > 
138:     LD  4,-5(1)	Pop left into ac1 
* OP  and
139:    AND  3,4,3	Op & 
* EXPRESSION
* EXPRESSION
* EXPRESSION
140:    LDC  3,3(6)	Load integer constant 
141:     LD  4,-5(1)	Pop left into ac1 
* OP  ?
142:    RND  3,3,3	Op ? 
* EXPRESSION
143:    LDC  3,0(6)	Load integer constant 
144:     LD  4,-5(1)	Pop left into ac1 
* OP  >
145:    TGT  3,4,3	Op > 
146:     LD  4,-5(1)	Pop left into ac1 
* OP  and
147:    AND  3,4,3	Op & 
* EXPRESSION
* EXPRESSION
* EXPRESSION
148:    LDC  3,3(6)	Load integer constant 
149:     LD  4,-5(1)	Pop left into ac1 
* OP  ?
150:    RND  3,3,3	Op ? 
* EXPRESSION
151:    LDC  3,0(6)	Load integer constant 
152:     LD  4,-5(1)	Pop left into ac1 
* OP  >
153:    TGT  3,4,3	Op > 
154:     LD  4,-5(1)	Pop left into ac1 
* OP  and
155:    AND  3,4,3	Op & 
* EXPRESSION
* EXPRESSION
* EXPRESSION
156:    LDC  3,3(6)	Load integer constant 
157:     LD  4,-5(1)	Pop left into ac1 
* OP  ?
158:    RND  3,3,3	Op ? 
* EXPRESSION
159:    LDC  3,0(6)	Load integer constant 
160:     LD  4,-5(1)	Pop left into ac1 
* OP  >
161:    TGT  3,4,3	Op > 
162:     LD  4,-5(1)	Pop left into ac1 
* OP  and
163:    AND  3,4,3	Op & 
* EXPRESSION
* EXPRESSION
* EXPRESSION
164:    LDC  3,3(6)	Load integer constant 
165:     LD  4,-5(1)	Pop left into ac1 
* OP  ?
166:    RND  3,3,3	Op ? 
* EXPRESSION
167:    LDC  3,0(6)	Load integer constant 
168:     LD  4,-5(1)	Pop left into ac1 
* OP  >
169:    TGT  3,4,3	Op > 
170:     LD  4,-5(1)	Pop left into ac1 
* OP  and
171:    AND  3,4,3	Op & 
* Param 
172:     ST  3,-5(1)	Push parameter 
* TOFF dec: 
* Param end  outputb
173:    LDA  1,-3(1)	Ghost frame becomes new active frame 
174:    LDA  3,1(7)	Return address in ac 
175:    JMP  7,-159(7)	call outputb
176:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set: 
* EXPRESSION
* CALL  outputb
177:     ST  1,-3(1)	Store fp in ghost frame for  outputb
* TOFF dec: 
* TOFF dec: 
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
179:     LD  4,-5(1)	Pop left into ac1 
* OP  ?
180:    RND  3,3,3	Op ? 
* EXPRESSION
181:    LDC  3,0(6)	Load integer constant 
182:     LD  4,-5(1)	Pop left into ac1 
* OP  >
183:    TGT  3,4,3	Op > 
* EXPRESSION
* EXPRESSION
* EXPRESSION
184:    LDC  3,3(6)	Load integer constant 
185:     LD  4,-5(1)	Pop left into ac1 
* OP  ?
186:    RND  3,3,3	Op ? 
* EXPRESSION
187:    LDC  3,0(6)	Load integer constant 
188:     LD  4,-5(1)	Pop left into ac1 
* OP  >
189:    TGT  3,4,3	Op > 
190:     LD  4,-5(1)	Pop left into ac1 
* OP  or
191:     OR  3,4,3	Op | 
* EXPRESSION
* EXPRESSION
* EXPRESSION
192:    LDC  3,3(6)	Load integer constant 
193:     LD  4,-5(1)	Pop left into ac1 
* OP  ?
194:    RND  3,3,3	Op ? 
* EXPRESSION
195:    LDC  3,0(6)	Load integer constant 
196:     LD  4,-5(1)	Pop left into ac1 
* OP  >
197:    TGT  3,4,3	Op > 
198:     LD  4,-5(1)	Pop left into ac1 
* OP  or
199:     OR  3,4,3	Op | 
* EXPRESSION
* EXPRESSION
* EXPRESSION
200:    LDC  3,3(6)	Load integer constant 
201:     LD  4,-5(1)	Pop left into ac1 
* OP  ?
202:    RND  3,3,3	Op ? 
* EXPRESSION
203:    LDC  3,0(6)	Load integer constant 
204:     LD  4,-5(1)	Pop left into ac1 
* OP  >
205:    TGT  3,4,3	Op > 
206:     LD  4,-5(1)	Pop left into ac1 
* OP  or
207:     OR  3,4,3	Op | 
* EXPRESSION
* EXPRESSION
* EXPRESSION
208:    LDC  3,3(6)	Load integer constant 
209:     LD  4,-5(1)	Pop left into ac1 
* OP  ?
210:    RND  3,3,3	Op ? 
* EXPRESSION
211:    LDC  3,0(6)	Load integer constant 
212:     LD  4,-5(1)	Pop left into ac1 
* OP  >
213:    TGT  3,4,3	Op > 
214:     LD  4,-5(1)	Pop left into ac1 
* OP  or
215:     OR  3,4,3	Op | 
* EXPRESSION
* EXPRESSION
* EXPRESSION
216:    LDC  3,3(6)	Load integer constant 
217:     LD  4,-5(1)	Pop left into ac1 
* OP  ?
218:    RND  3,3,3	Op ? 
* EXPRESSION
219:    LDC  3,0(6)	Load integer constant 
220:     LD  4,-5(1)	Pop left into ac1 
* OP  >
221:    TGT  3,4,3	Op > 
222:     LD  4,-5(1)	Pop left into ac1 
* OP  or
223:     OR  3,4,3	Op | 
* EXPRESSION
* EXPRESSION
* EXPRESSION
224:    LDC  3,3(6)	Load integer constant 
225:     LD  4,-5(1)	Pop left into ac1 
* OP  ?
226:    RND  3,3,3	Op ? 
* EXPRESSION
227:    LDC  3,0(6)	Load integer constant 
228:     LD  4,-5(1)	Pop left into ac1 
* OP  >
229:    TGT  3,4,3	Op > 
230:     LD  4,-5(1)	Pop left into ac1 
* OP  or
231:     OR  3,4,3	Op | 
* EXPRESSION
* EXPRESSION
* EXPRESSION
232:    LDC  3,3(6)	Load integer constant 
233:     LD  4,-5(1)	Pop left into ac1 
* OP  ?
234:    RND  3,3,3	Op ? 
* EXPRESSION
235:    LDC  3,0(6)	Load integer constant 
236:     LD  4,-5(1)	Pop left into ac1 
* OP  >
237:    TGT  3,4,3	Op > 
238:     LD  4,-5(1)	Pop left into ac1 
* OP  or
239:     OR  3,4,3	Op | 
* EXPRESSION
* EXPRESSION
* EXPRESSION
240:    LDC  3,3(6)	Load integer constant 
241:     LD  4,-5(1)	Pop left into ac1 
* OP  ?
242:    RND  3,3,3	Op ? 
* EXPRESSION
243:    LDC  3,0(6)	Load integer constant 
244:     LD  4,-5(1)	Pop left into ac1 
* OP  >
245:    TGT  3,4,3	Op > 
246:     LD  4,-5(1)	Pop left into ac1 
* OP  or
247:     OR  3,4,3	Op | 
* EXPRESSION
* EXPRESSION
* EXPRESSION
248:    LDC  3,3(6)	Load integer constant 
249:     LD  4,-5(1)	Pop left into ac1 
* OP  ?
250:    RND  3,3,3	Op ? 
* EXPRESSION
251:    LDC  3,0(6)	Load integer constant 
252:     LD  4,-5(1)	Pop left into ac1 
* OP  >
253:    TGT  3,4,3	Op > 
254:     LD  4,-5(1)	Pop left into ac1 
* OP  or
255:     OR  3,4,3	Op | 
* EXPRESSION
* EXPRESSION
* EXPRESSION
256:    LDC  3,3(6)	Load integer constant 
257:     LD  4,-5(1)	Pop left into ac1 
* OP  ?
258:    RND  3,3,3	Op ? 
* EXPRESSION
259:    LDC  3,0(6)	Load integer constant 
260:     LD  4,-5(1)	Pop left into ac1 
* OP  >
261:    TGT  3,4,3	Op > 
262:     LD  4,-5(1)	Pop left into ac1 
* OP  or
263:     OR  3,4,3	Op | 
* EXPRESSION
* EXPRESSION
* EXPRESSION
264:    LDC  3,3(6)	Load integer constant 
265:     LD  4,-5(1)	Pop left into ac1 
* OP  ?
266:    RND  3,3,3	Op ? 
* EXPRESSION
267:    LDC  3,0(6)	Load integer constant 
268:     LD  4,-5(1)	Pop left into ac1 
* OP  >
269:    TGT  3,4,3	Op > 
270:     LD  4,-5(1)	Pop left into ac1 
* OP  or
271:     OR  3,4,3	Op | 
* EXPRESSION
* EXPRESSION
* EXPRESSION
272:    LDC  3,3(6)	Load integer constant 
273:     LD  4,-5(1)	Pop left into ac1 
* OP  ?
274:    RND  3,3,3	Op ? 
* EXPRESSION
275:    LDC  3,0(6)	Load integer constant 
276:     LD  4,-5(1)	Pop left into ac1 
* OP  >
277:    TGT  3,4,3	Op > 
278:     LD  4,-5(1)	Pop left into ac1 
* OP  or
279:     OR  3,4,3	Op | 
* Param 
280:     ST  3,-5(1)	Push parameter 
* TOFF dec: 
* Param end  outputb
281:    LDA  1,-3(1)	Ghost frame becomes new active frame 
282:    LDA  3,1(7)	Return address in ac 
283:    JMP  7,-267(7)	call outputb
284:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set: 
* EXPRESSION
* CALL  outnl
285:     ST  1,-3(1)	Store fp in ghost frame for  outnl
* TOFF dec: 
* TOFF dec: 
* Param end  outnl
286:    LDA  1,-3(1)	Ghost frame becomes new active frame 
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
