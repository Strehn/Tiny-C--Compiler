* C- version: 1.00
* by Sydney Petrehn
* Input file: e04.c-
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
 40:    LDC  3,0(6)	Load integer constant 
* IF
* EXPRESSION
 41:    LDC  3,1(6)	Load integer constant 
* EXPRESSION
* CALL  output
 42:     ST  1,-2(1)	Store fp in ghost frame for  output
* TOFF dec:  -3
* TOFF dec:  -4
* EXPRESSION
 43:    LDC  3,13(6)	Load integer constant 
* Param  1
 44:     ST  3,-4(1)	Push parameter 
* TOFF dec:  -5
* Param end  output
 45:    LDA  1,-2(1)	Ghost frame becomes new active frame 
 46:    LDA  3,1(7)	Return address in ac 
 47:    JMP  7,-42(7)	call output
 48:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set:  -2
* IF
* EXPRESSION
 49:    LDC  3,0(6)	Load integer constant 
* IF
* EXPRESSION
 50:    LDC  3,0(6)	Load integer constant 
* EXPRESSION
* CALL  output
 51:     ST  1,-2(1)	Store fp in ghost frame for  output
* TOFF dec:  -3
* TOFF dec:  -4
* EXPRESSION
 52:    LDC  3,23(6)	Load integer constant 
* Param  2
 53:     ST  3,-4(1)	Push parameter 
* TOFF dec:  -5
* Param end  output
 54:    LDA  1,-2(1)	Ghost frame becomes new active frame 
 55:    LDA  3,1(7)	Return address in ac 
 56:    JMP  7,-51(7)	call output
 57:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set:  -2
* EXPRESSION
* ASSIGN  =
 58:    LDC  3,0(6)	Load integer constant 
 59:     ST  3,-2(1)	Store variable x
* EXPRESSION
* EXPRESSION
* IF
* EXPRESSION
 60:    LDC  3,0(6)	Load integer constant 
* IF
* EXPRESSION
* EXPRESSION
* CALL  output
 61:     ST  1,-3(1)	Store fp in ghost frame for  output
* TOFF dec:  -4
* TOFF dec:  -5
* EXPRESSION
 62:    LDC  3,44(6)	Load integer constant 
* Param  3
 63:     ST  3,-5(1)	Push parameter 
* TOFF dec:  -6
* Param end  output
 64:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 65:    LDA  3,1(7)	Return address in ac 
 66:    JMP  7,-61(7)	call output
 67:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set:  -3
* IF
* EXPRESSION
 68:    LDC  3,0(6)	Load integer constant 
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
* IF
* EXPRESSION
 78:    LDC  3,0(6)	Load integer constant 
* IF
* EXPRESSION
* EXPRESSION
 79:    LDC  3,3(6)	Load integer constant 
* EXPRESSION
 80:    LDC  3,1(6)	Load integer constant 
* OP  >
 81:     LD  4,-3(1)	Pop left into ac1 
 82:    TGT  3,4,3	Op > 
* EXPRESSION
* CALL  output
 83:     ST  1,-3(1)	Store fp in ghost frame for  output
* TOFF dec:  -4
* TOFF dec:  -5
* EXPRESSION
 84:    LDC  3,987(6)	Load integer constant 
* Param  5
 85:     ST  3,-5(1)	Push parameter 
* TOFF dec:  -6
* Param end  output
 86:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 87:    LDA  3,1(7)	Return address in ac 
 88:    JMP  7,-83(7)	call output
 89:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set:  -3
* IF
* EXPRESSION
 90:    LDC  3,0(6)	Load integer constant 
* IF
* EXPRESSION
* EXPRESSION
 91:    LDC  3,3(6)	Load integer constant 
* EXPRESSION
 92:    LDC  3,1(6)	Load integer constant 
* OP  <
 93:     LD  4,-3(1)	Pop left into ac1 
 94:    TLT  3,4,3	Op < 
* EXPRESSION
* CALL  output
 95:     ST  1,-3(1)	Store fp in ghost frame for  output
* TOFF dec:  -4
* TOFF dec:  -5
* EXPRESSION
 96:    LDC  3,211(6)	Load integer constant 
* Param  6
 97:     ST  3,-5(1)	Push parameter 
* TOFF dec:  -6
* Param end  output
 98:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 99:    LDA  3,1(7)	Return address in ac 
100:    JMP  7,-95(7)	call output
101:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set:  -3
* IF
* EXPRESSION
102:    LDC  3,0(6)	Load integer constant 
* IF
* EXPRESSION
103:    LDC  3,1(6)	Load integer constant 
* EXPRESSION
* CALL  output
104:     ST  1,-3(1)	Store fp in ghost frame for  output
* TOFF dec:  -4
* TOFF dec:  -5
* EXPRESSION
105:    LDC  3,13(6)	Load integer constant 
* Param  7
106:     ST  3,-5(1)	Push parameter 
* TOFF dec:  -6
* Param end  output
107:    LDA  1,-3(1)	Ghost frame becomes new active frame 
108:    LDA  3,1(7)	Return address in ac 
109:    JMP  7,-104(7)	call output
110:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set:  -3
* EXPRESSION
* CALL  output
111:     ST  1,-3(1)	Store fp in ghost frame for  output
* TOFF dec:  -4
* TOFF dec:  -5
* EXPRESSION
112:    LDC  3,51(6)	Load integer constant 
* Param  8
113:     ST  3,-5(1)	Push parameter 
* TOFF dec:  -6
* Param end  output
114:    LDA  1,-3(1)	Ghost frame becomes new active frame 
115:    LDA  3,1(7)	Return address in ac 
116:    JMP  7,-111(7)	call output
117:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set:  -3
* IF
* EXPRESSION
118:    LDC  3,0(6)	Load integer constant 
* IF
* EXPRESSION
119:    LDC  3,0(6)	Load integer constant 
* EXPRESSION
* CALL  output
120:     ST  1,-3(1)	Store fp in ghost frame for  output
* TOFF dec:  -4
* TOFF dec:  -5
* EXPRESSION
121:    LDC  3,23(6)	Load integer constant 
* Param  9
122:     ST  3,-5(1)	Push parameter 
* TOFF dec:  -6
* Param end  output
123:    LDA  1,-3(1)	Ghost frame becomes new active frame 
124:    LDA  3,1(7)	Return address in ac 
125:    JMP  7,-120(7)	call output
126:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set:  -3
* EXPRESSION
* CALL  output
127:     ST  1,-3(1)	Store fp in ghost frame for  output
* TOFF dec:  -4
* TOFF dec:  -5
* EXPRESSION
128:    LDC  3,451(6)	Load integer constant 
* Param  10
129:     ST  3,-5(1)	Push parameter 
* TOFF dec:  -6
* Param end  output
130:    LDA  1,-3(1)	Ghost frame becomes new active frame 
131:    LDA  3,1(7)	Return address in ac 
132:    JMP  7,-127(7)	call output
133:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set:  -3
* EXPRESSION
* ASSIGN  =
134:    LDC  3,0(6)	Load integer constant 
135:     ST  3,-2(1)	Store variable x
* EXPRESSION
* EXPRESSION
* IF
* EXPRESSION
136:    LDC  3,0(6)	Load integer constant 
* IF
* EXPRESSION
* EXPRESSION
* CALL  output
137:     ST  1,-2(1)	Store fp in ghost frame for  output
* TOFF dec:  -3
* TOFF dec:  -4
* EXPRESSION
138:    LDC  3,44(6)	Load integer constant 
* Param  11
139:     ST  3,-4(1)	Push parameter 
* TOFF dec:  -5
* Param end  output
140:    LDA  1,-2(1)	Ghost frame becomes new active frame 
141:    LDA  3,1(7)	Return address in ac 
142:    JMP  7,-137(7)	call output
143:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set:  -2
* EXPRESSION
* CALL  output
144:     ST  1,-2(1)	Store fp in ghost frame for  output
* TOFF dec:  -3
* TOFF dec:  -4
* EXPRESSION
145:    LDC  3,514(6)	Load integer constant 
* Param  12
146:     ST  3,-4(1)	Push parameter 
* TOFF dec:  -5
* Param end  output
147:    LDA  1,-2(1)	Ghost frame becomes new active frame 
148:    LDA  3,1(7)	Return address in ac 
149:    JMP  7,-144(7)	call output
150:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set:  -2
* IF
* EXPRESSION
151:    LDC  3,0(6)	Load integer constant 
* IF
* EXPRESSION
* EXPRESSION
* OP  not
152:    LDC  4,1(6)	Load 1 
153:    XOR  3,3,4	Logical not 
* EXPRESSION
* CALL  output
154:     ST  1,-2(1)	Store fp in ghost frame for  output
* TOFF dec:  -3
* TOFF dec:  -4
* EXPRESSION
155:    LDC  3,55(6)	Load integer constant 
* Param  13
156:     ST  3,-4(1)	Push parameter 
* TOFF dec:  -5
* Param end  output
157:    LDA  1,-2(1)	Ghost frame becomes new active frame 
158:    LDA  3,1(7)	Return address in ac 
159:    JMP  7,-154(7)	call output
160:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set:  -2
* EXPRESSION
* CALL  output
161:     ST  1,-2(1)	Store fp in ghost frame for  output
* TOFF dec:  -3
* TOFF dec:  -4
* EXPRESSION
162:    LDC  3,1514(6)	Load integer constant 
* Param  14
163:     ST  3,-4(1)	Push parameter 
* TOFF dec:  -5
* Param end  output
164:    LDA  1,-2(1)	Ghost frame becomes new active frame 
165:    LDA  3,1(7)	Return address in ac 
166:    JMP  7,-161(7)	call output
167:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set:  -2
* IF
* EXPRESSION
168:    LDC  3,0(6)	Load integer constant 
* IF
* EXPRESSION
* EXPRESSION
169:    LDC  3,3(6)	Load integer constant 
* EXPRESSION
170:    LDC  3,1(6)	Load integer constant 
* OP  >
171:     LD  4,-2(1)	Pop left into ac1 
172:    TGT  3,4,3	Op > 
* EXPRESSION
* CALL  output
173:     ST  1,-2(1)	Store fp in ghost frame for  output
* TOFF dec:  -3
* TOFF dec:  -4
* EXPRESSION
174:    LDC  3,987(6)	Load integer constant 
* Param  15
175:     ST  3,-4(1)	Push parameter 
* TOFF dec:  -5
* Param end  output
176:    LDA  1,-2(1)	Ghost frame becomes new active frame 
177:    LDA  3,1(7)	Return address in ac 
178:    JMP  7,-173(7)	call output
179:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set:  -2
* EXPRESSION
* CALL  output
180:     ST  1,-2(1)	Store fp in ghost frame for  output
* TOFF dec:  -3
* TOFF dec:  -4
* EXPRESSION
181:    LDC  3,114(6)	Load integer constant 
* Param  16
182:     ST  3,-4(1)	Push parameter 
* TOFF dec:  -5
* Param end  output
183:    LDA  1,-2(1)	Ghost frame becomes new active frame 
184:    LDA  3,1(7)	Return address in ac 
185:    JMP  7,-180(7)	call output
186:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set:  -2
* IF
* EXPRESSION
187:    LDC  3,0(6)	Load integer constant 
* IF
* EXPRESSION
* EXPRESSION
188:    LDC  3,3(6)	Load integer constant 
* EXPRESSION
189:    LDC  3,1(6)	Load integer constant 
* OP  <
190:     LD  4,-2(1)	Pop left into ac1 
191:    TLT  3,4,3	Op < 
* EXPRESSION
* CALL  output
192:     ST  1,-2(1)	Store fp in ghost frame for  output
* TOFF dec:  -3
* TOFF dec:  -4
* EXPRESSION
193:    LDC  3,211(6)	Load integer constant 
* Param  17
194:     ST  3,-4(1)	Push parameter 
* TOFF dec:  -5
* Param end  output
195:    LDA  1,-2(1)	Ghost frame becomes new active frame 
196:    LDA  3,1(7)	Return address in ac 
197:    JMP  7,-192(7)	call output
198:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set:  -2
* EXPRESSION
* CALL  output
199:     ST  1,-2(1)	Store fp in ghost frame for  output
* TOFF dec:  -3
* TOFF dec:  -4
* EXPRESSION
200:    LDC  3,1614(6)	Load integer constant 
* Param  18
201:     ST  3,-4(1)	Push parameter 
* TOFF dec:  -5
* Param end  output
202:    LDA  1,-2(1)	Ghost frame becomes new active frame 
203:    LDA  3,1(7)	Return address in ac 
204:    JMP  7,-199(7)	call output
205:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set:  -2
* END COMPOUND
* Add standard closing in case there is no return statement
206:    LDC  2,0(6)	Set return value to 0 
207:     LD  3,-1(1)	Load return address 
208:     LD  1,0(1)	Adjust frame pointer 
209:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,209(7)	Jump to init [backpatch] 
* =========================================
* INIT
210:    LDA  1,0(0)	Set first frame at end of globals 
211:     ST  1,0(1)	Store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
212:    LDA  3,1(7)	Return address in ac 
213:    JMP  7,-175(7)	Jump to main 
214:   HALT  0,0(0)	DONE! 
* END INIT
