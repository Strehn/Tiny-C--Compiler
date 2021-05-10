* C- version: 1.00
* by Sydney Petrehn
* Input file: d01.c-
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
* TOFF set:  -4
* Compound body
* EXPRESSION
* CALL  outputb
 40:     ST  1,-2(1)	Store fp in ghost frame for  outputb
* TOFF dec:  -3
* TOFF dec:  -4
* EXPRESSION
* EXPRESSION
 41:    LDC  3,1(6)	Load integer constant 
 42:     ST  3,-4(1)	Push left side 
* EXPRESSION
 43:    LDC  3,2(6)	Load integer constant 
* OP  <
 44:     LD  4,-4(1)	Pop left into ac1 
 45:    TLT  3,4,3	Op < 
* Param  1
 46:     ST  3,-4(1)	Push parameter 
* TOFF dec:  -5
* Param end  outputb
 47:    LDA  1,-2(1)	Ghost frame becomes new active frame 
 48:    LDA  3,1(7)	Return address in ac 
 49:    JMP  7,-33(7)	call outputb
 50:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set:  -2
* EXPRESSION
* CALL  outputb
 51:     ST  1,-2(1)	Store fp in ghost frame for  outputb
* TOFF dec:  -3
* TOFF dec:  -4
* EXPRESSION
* EXPRESSION
 52:    LDC  3,1(6)	Load integer constant 
 53:     ST  3,-4(1)	Push left side 
* EXPRESSION
 54:    LDC  3,2(6)	Load integer constant 
* OP  >
 55:     LD  4,-4(1)	Pop left into ac1 
 56:    TGT  3,4,3	Op > 
* Param  2
 57:     ST  3,-4(1)	Push parameter 
* TOFF dec:  -5
* Param end  outputb
 58:    LDA  1,-2(1)	Ghost frame becomes new active frame 
 59:    LDA  3,1(7)	Return address in ac 
 60:    JMP  7,-44(7)	call outputb
 61:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set:  -2
* EXPRESSION
* CALL  outputb
 62:     ST  1,-2(1)	Store fp in ghost frame for  outputb
* TOFF dec:  -3
* TOFF dec:  -4
* EXPRESSION
* EXPRESSION
 63:    LDC  3,1(6)	Load integer constant 
 64:     ST  3,-4(1)	Push left side 
* EXPRESSION
 65:    LDC  3,2(6)	Load integer constant 
* OP  ==
 66:     LD  4,-4(1)	Pop left into ac1 
 67:    TEQ  3,4,3	Op == 
* Param  3
 68:     ST  3,-4(1)	Push parameter 
* TOFF dec:  -5
* Param end  outputb
 69:    LDA  1,-2(1)	Ghost frame becomes new active frame 
 70:    LDA  3,1(7)	Return address in ac 
 71:    JMP  7,-55(7)	call outputb
 72:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set:  -2
* EXPRESSION
* CALL  outputb
 73:     ST  1,-2(1)	Store fp in ghost frame for  outputb
* TOFF dec:  -3
* TOFF dec:  -4
* EXPRESSION
* EXPRESSION
 74:    LDC  3,1(6)	Load integer constant 
 75:     ST  3,-4(1)	Push left side 
* EXPRESSION
 76:    LDC  3,2(6)	Load integer constant 
* OP  !=
 77:     LD  4,-4(1)	Pop left into ac1 
 78:    TNE  3,4,3	Op != 
* Param  4
 79:     ST  3,-4(1)	Push parameter 
* TOFF dec:  -5
* Param end  outputb
 80:    LDA  1,-2(1)	Ghost frame becomes new active frame 
 81:    LDA  3,1(7)	Return address in ac 
 82:    JMP  7,-66(7)	call outputb
 83:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set:  -2
* EXPRESSION
* CALL  outputb
 84:     ST  1,-2(1)	Store fp in ghost frame for  outputb
* TOFF dec:  -3
* TOFF dec:  -4
* EXPRESSION
* EXPRESSION
 85:    LDC  3,1(6)	Load integer constant 
 86:     ST  3,-4(1)	Push left side 
* EXPRESSION
 87:    LDC  3,2(6)	Load integer constant 
* OP  >=
 88:     LD  4,-4(1)	Pop left into ac1 
 89:    TGE  3,4,3	Op >= 
* Param  5
 90:     ST  3,-4(1)	Push parameter 
* TOFF dec:  -5
* Param end  outputb
 91:    LDA  1,-2(1)	Ghost frame becomes new active frame 
 92:    LDA  3,1(7)	Return address in ac 
 93:    JMP  7,-77(7)	call outputb
 94:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set:  -2
* EXPRESSION
* CALL  outputb
 95:     ST  1,-2(1)	Store fp in ghost frame for  outputb
* TOFF dec:  -3
* TOFF dec:  -4
* EXPRESSION
* EXPRESSION
 96:    LDC  3,1(6)	Load integer constant 
 97:     ST  3,-4(1)	Push left side 
* EXPRESSION
 98:    LDC  3,2(6)	Load integer constant 
* OP  <=
 99:     LD  4,-4(1)	Pop left into ac1 
100:    TLE  3,4,3	Op <= 
* Param  6
101:     ST  3,-4(1)	Push parameter 
* TOFF dec:  -5
* Param end  outputb
102:    LDA  1,-2(1)	Ghost frame becomes new active frame 
103:    LDA  3,1(7)	Return address in ac 
104:    JMP  7,-88(7)	call outputb
105:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set:  -2
* EXPRESSION
* CALL  outputb
106:     ST  1,-2(1)	Store fp in ghost frame for  outputb
* TOFF dec:  -3
* TOFF dec:  -4
* EXPRESSION
* EXPRESSION
107:    LDC  3,2(6)	Load integer constant 
108:     ST  3,-4(1)	Push left side 
* EXPRESSION
109:    LDC  3,2(6)	Load integer constant 
* OP  ==
110:     LD  4,-4(1)	Pop left into ac1 
111:    TEQ  3,4,3	Op == 
* Param  7
112:     ST  3,-4(1)	Push parameter 
* TOFF dec:  -5
* Param end  outputb
113:    LDA  1,-2(1)	Ghost frame becomes new active frame 
114:    LDA  3,1(7)	Return address in ac 
115:    JMP  7,-99(7)	call outputb
116:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set:  -2
* EXPRESSION
* CALL  outputb
117:     ST  1,-2(1)	Store fp in ghost frame for  outputb
* TOFF dec:  -3
* TOFF dec:  -4
* EXPRESSION
* EXPRESSION
118:    LDC  3,2(6)	Load integer constant 
119:     ST  3,-4(1)	Push left side 
* EXPRESSION
120:    LDC  3,2(6)	Load integer constant 
* OP  !=
121:     LD  4,-4(1)	Pop left into ac1 
122:    TNE  3,4,3	Op != 
* Param  8
123:     ST  3,-4(1)	Push parameter 
* TOFF dec:  -5
* Param end  outputb
124:    LDA  1,-2(1)	Ghost frame becomes new active frame 
125:    LDA  3,1(7)	Return address in ac 
126:    JMP  7,-110(7)	call outputb
127:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set:  -2
* EXPRESSION
* CALL  outputb
128:     ST  1,-2(1)	Store fp in ghost frame for  outputb
* TOFF dec:  -3
* TOFF dec:  -4
* EXPRESSION
* EXPRESSION
129:    LDC  3,2(6)	Load integer constant 
130:     ST  3,-4(1)	Push left side 
* EXPRESSION
131:    LDC  3,2(6)	Load integer constant 
* OP  >=
132:     LD  4,-4(1)	Pop left into ac1 
133:    TGE  3,4,3	Op >= 
* Param  9
134:     ST  3,-4(1)	Push parameter 
* TOFF dec:  -5
* Param end  outputb
135:    LDA  1,-2(1)	Ghost frame becomes new active frame 
136:    LDA  3,1(7)	Return address in ac 
137:    JMP  7,-121(7)	call outputb
138:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set:  -2
* EXPRESSION
* CALL  outputb
139:     ST  1,-2(1)	Store fp in ghost frame for  outputb
* TOFF dec:  -3
* TOFF dec:  -4
* EXPRESSION
* EXPRESSION
140:    LDC  3,2(6)	Load integer constant 
141:     ST  3,-4(1)	Push left side 
* EXPRESSION
142:    LDC  3,2(6)	Load integer constant 
* OP  <=
143:     LD  4,-4(1)	Pop left into ac1 
144:    TLE  3,4,3	Op <= 
* Param  10
145:     ST  3,-4(1)	Push parameter 
* TOFF dec:  -5
* Param end  outputb
146:    LDA  1,-2(1)	Ghost frame becomes new active frame 
147:    LDA  3,1(7)	Return address in ac 
148:    JMP  7,-132(7)	call outputb
149:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set:  -2
* EXPRESSION
* CALL  outputb
150:     ST  1,-2(1)	Store fp in ghost frame for  outputb
* TOFF dec:  -3
* TOFF dec:  -4
* EXPRESSION
* EXPRESSION
151:    LDC  3,1(6)	Load integer constant 
152:     ST  3,-4(1)	Push left side 
* EXPRESSION
153:    LDC  3,1(6)	Load integer constant 
* OP  ==
154:     LD  4,-4(1)	Pop left into ac1 
155:    TEQ  3,4,3	Op == 
* Param  11
156:     ST  3,-4(1)	Push parameter 
* TOFF dec:  -5
* Param end  outputb
157:    LDA  1,-2(1)	Ghost frame becomes new active frame 
158:    LDA  3,1(7)	Return address in ac 
159:    JMP  7,-143(7)	call outputb
160:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set:  -2
* EXPRESSION
* CALL  outputb
161:     ST  1,-2(1)	Store fp in ghost frame for  outputb
* TOFF dec:  -3
* TOFF dec:  -4
* EXPRESSION
* EXPRESSION
162:    LDC  3,1(6)	Load integer constant 
163:     ST  3,-4(1)	Push left side 
* EXPRESSION
164:    LDC  3,1(6)	Load integer constant 
* OP  !=
165:     LD  4,-4(1)	Pop left into ac1 
166:    TNE  3,4,3	Op != 
* Param  12
167:     ST  3,-4(1)	Push parameter 
* TOFF dec:  -5
* Param end  outputb
168:    LDA  1,-2(1)	Ghost frame becomes new active frame 
169:    LDA  3,1(7)	Return address in ac 
170:    JMP  7,-154(7)	call outputb
171:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set:  -2
* EXPRESSION
* CALL  outputb
172:     ST  1,-2(1)	Store fp in ghost frame for  outputb
* TOFF dec:  -3
* TOFF dec:  -4
* EXPRESSION
* EXPRESSION
173:    LDC  3,0(6)	Load integer constant 
174:     ST  3,-4(1)	Push left side 
* EXPRESSION
175:    LDC  3,1(6)	Load integer constant 
* OP  ==
176:     LD  4,-4(1)	Pop left into ac1 
177:    TEQ  3,4,3	Op == 
* Param  13
178:     ST  3,-4(1)	Push parameter 
* TOFF dec:  -5
* Param end  outputb
179:    LDA  1,-2(1)	Ghost frame becomes new active frame 
180:    LDA  3,1(7)	Return address in ac 
181:    JMP  7,-165(7)	call outputb
182:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set:  -2
* EXPRESSION
* CALL  outputb
183:     ST  1,-2(1)	Store fp in ghost frame for  outputb
* TOFF dec:  -3
* TOFF dec:  -4
* EXPRESSION
* EXPRESSION
184:    LDC  3,0(6)	Load integer constant 
185:     ST  3,-4(1)	Push left side 
* EXPRESSION
186:    LDC  3,1(6)	Load integer constant 
* OP  !=
187:     LD  4,-4(1)	Pop left into ac1 
188:    TNE  3,4,3	Op != 
* Param  14
189:     ST  3,-4(1)	Push parameter 
* TOFF dec:  -5
* Param end  outputb
190:    LDA  1,-2(1)	Ghost frame becomes new active frame 
191:    LDA  3,1(7)	Return address in ac 
192:    JMP  7,-176(7)	call outputb
193:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set:  -2
* EXPRESSION
* CALL  outputb
194:     ST  1,-2(1)	Store fp in ghost frame for  outputb
* TOFF dec:  -3
* TOFF dec:  -4
* EXPRESSION
* EXPRESSION
195:    LDC  3,0(6)	Load integer constant 
196:     ST  3,-4(1)	Push left side 
* EXPRESSION
197:    LDC  3,0(6)	Load integer constant 
* OP  ==
198:     LD  4,-4(1)	Pop left into ac1 
199:    TEQ  3,4,3	Op == 
* Param  15
200:     ST  3,-4(1)	Push parameter 
* TOFF dec:  -5
* Param end  outputb
201:    LDA  1,-2(1)	Ghost frame becomes new active frame 
202:    LDA  3,1(7)	Return address in ac 
203:    JMP  7,-187(7)	call outputb
204:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set:  -2
* EXPRESSION
* CALL  outputb
205:     ST  1,-2(1)	Store fp in ghost frame for  outputb
* TOFF dec:  -3
* TOFF dec:  -4
* EXPRESSION
* EXPRESSION
206:    LDC  3,0(6)	Load integer constant 
207:     ST  3,-4(1)	Push left side 
* EXPRESSION
208:    LDC  3,0(6)	Load integer constant 
* OP  !=
209:     LD  4,-4(1)	Pop left into ac1 
210:    TNE  3,4,3	Op != 
* Param  16
211:     ST  3,-4(1)	Push parameter 
* TOFF dec:  -5
* Param end  outputb
212:    LDA  1,-2(1)	Ghost frame becomes new active frame 
213:    LDA  3,1(7)	Return address in ac 
214:    JMP  7,-198(7)	call outputb
215:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set:  -2
* END COMPOUND
* Add standard closing in case there is no return statement
216:    LDC  2,0(6)	Set return value to 0 
217:     LD  3,-1(1)	Load return address 
218:     LD  1,0(1)	Adjust frame pointer 
219:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,219(7)	Jump to init [backpatch] 
* =========================================
* INIT
220:    LDA  1,0(0)	Set first frame at end of globals 
221:     ST  1,0(1)	Store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
222:    LDA  3,1(7)	Return address in ac 
223:    JMP  7,-185(7)	Jump to main 
224:   HALT  0,0(0)	DONE! 
* END INIT
