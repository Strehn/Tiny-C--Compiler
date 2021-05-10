* C- version: 1.00
* by Sydney Petrehn
* Input file: c13.c-
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
* TOFF set:  -304
* Compound body
* Var
 40:    LDC  3,300(6)	Load size of array x
 41:     ST  3,-2(1)	store return address 
* Var
* EXPRESSION
* ASSIGN  =
 42:    LDC  3,5(6)	Load integer constant 
 43:     ST  3,-303(1)	Store variable z
* EXPRESSION
* EXPRESSION
* EXPRESSION
* ASSIGN  =
 44:     ST  3,-306(1)	Push index 
 45:    LDC  3,73(6)	Load integer constant 
 46:     LD  4,-306(1)	Pop index 
 47:    LDA  5,-3(1)	Load address of base of array x
 48:    SUB  5,5,4	Compute offset of value 
 49:     ST  3,0(5)	Store variable x
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  (null)
* EXPRESSION
* EXPRESSION
* CALL  output
 50:     ST  1,-306(1)	Store fp in ghost frame for  output
* TOFF dec:  -307
* TOFF dec:  -308
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  (null)
* Param  1
 51:     ST  3,-308(1)	Push parameter 
* TOFF dec:  -309
* Param end  output
 52:    LDA  1,-306(1)	Ghost frame becomes new active frame 
 53:    LDA  3,1(7)	Return address in ac 
 54:    JMP  7,-49(7)	call output
 55:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set:  -306
* EXPRESSION
* CALL  outnl
 56:     ST  1,-306(1)	Store fp in ghost frame for  outnl
* TOFF dec:  -307
* TOFF dec:  -308
* Param end  outnl
 57:    LDA  1,-306(1)	Ghost frame becomes new active frame 
 58:    LDA  3,1(7)	Return address in ac 
 59:    JMP  7,-26(7)	call outnl
 60:    LDA  3,0(2)	save the result in ac 
* Call end  outnl
* TOFF set:  -306
* EXPRESSION
* ASSIGN  =
 61:    LDC  3,5(6)	Load integer constant 
 62:     ST  3,-303(1)	Store variable z
* EXPRESSION
* EXPRESSION
* EXPRESSION
* ASSIGN  =
 63:     ST  3,-307(1)	Push index 
 64:    LDC  3,17(6)	Load integer constant 
 65:     LD  4,-307(1)	Pop index 
 66:    LDA  5,-3(1)	Load address of base of array x
 67:    SUB  5,5,4	Compute offset of value 
 68:     ST  3,0(5)	Store variable x
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  (null)
* EXPRESSION
* EXPRESSION
* ASSIGN  =
 69:    LDC  3,17(6)	Load integer constant 
 70:     ST  3,-303(1)	Store variable z
* EXPRESSION
* EXPRESSION
* EXPRESSION
* ASSIGN  =
 71:     ST  3,-308(1)	Push index 
 72:    LDC  3,5(6)	Load integer constant 
 73:     LD  4,-308(1)	Pop index 
 74:    LDA  5,-3(1)	Load address of base of array x
 75:    SUB  5,5,4	Compute offset of value 
 76:     ST  3,0(5)	Store variable x
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  (null)
* EXPRESSION
* EXPRESSION
* CALL  output
 77:     ST  1,-308(1)	Store fp in ghost frame for  output
* TOFF dec:  -309
* TOFF dec:  -310
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  (null)
* Param  2
 78:     ST  3,-310(1)	Push parameter 
* TOFF dec:  -311
* Param end  output
 79:    LDA  1,-308(1)	Ghost frame becomes new active frame 
 80:    LDA  3,1(7)	Return address in ac 
 81:    JMP  7,-76(7)	call output
 82:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set:  -308
* EXPRESSION
* CALL  outnl
 83:     ST  1,-308(1)	Store fp in ghost frame for  outnl
* TOFF dec:  -309
* TOFF dec:  -310
* Param end  outnl
 84:    LDA  1,-308(1)	Ghost frame becomes new active frame 
 85:    LDA  3,1(7)	Return address in ac 
 86:    JMP  7,-53(7)	call outnl
 87:    LDA  3,0(2)	save the result in ac 
* Call end  outnl
* TOFF set:  -308
* EXPRESSION
* CALL  output
 88:     ST  1,-308(1)	Store fp in ghost frame for  output
* TOFF dec:  -309
* TOFF dec:  -310
 89:     ST  3,-310(1)	Push left side 
* TOFF dec:  -311
 90:     ST  3,-311(1)	Push left side 
* TOFF dec:  -312
* TOFF dec:  -313
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  (null)
* OP  (null)
* Param  3
 91:     ST  3,-313(1)	Push parameter 
* TOFF dec:  -314
* Param end  output
 92:    LDA  1,-308(1)	Ghost frame becomes new active frame 
 93:    LDA  3,1(7)	Return address in ac 
 94:    JMP  7,-89(7)	call output
 95:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set:  -308
* EXPRESSION
* CALL  outnl
 96:     ST  1,-308(1)	Store fp in ghost frame for  outnl
* TOFF dec:  -309
* TOFF dec:  -310
* Param end  outnl
 97:    LDA  1,-308(1)	Ghost frame becomes new active frame 
 98:    LDA  3,1(7)	Return address in ac 
 99:    JMP  7,-66(7)	call outnl
100:    LDA  3,0(2)	save the result in ac 
* Call end  outnl
* TOFF set:  -308
* EXPRESSION
* CALL  output
101:     ST  1,-308(1)	Store fp in ghost frame for  output
* TOFF dec:  -309
* TOFF dec:  -310
102:     ST  3,-310(1)	Push left side 
* TOFF dec:  -311
103:     ST  3,-311(1)	Push left side 
* TOFF dec:  -312
* TOFF dec:  -313
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  (null)
* OP  (null)
* OP  (null)
* Param  4
104:     ST  3,-313(1)	Push parameter 
* TOFF dec:  -314
* Param end  output
105:    LDA  1,-308(1)	Ghost frame becomes new active frame 
106:    LDA  3,1(7)	Return address in ac 
107:    JMP  7,-102(7)	call output
108:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set:  -308
* EXPRESSION
* CALL  outnl
109:     ST  1,-308(1)	Store fp in ghost frame for  outnl
* TOFF dec:  -309
* TOFF dec:  -310
* Param end  outnl
110:    LDA  1,-308(1)	Ghost frame becomes new active frame 
111:    LDA  3,1(7)	Return address in ac 
112:    JMP  7,-79(7)	call outnl
113:    LDA  3,0(2)	save the result in ac 
* Call end  outnl
* TOFF set:  -308
* EXPRESSION
* CALL  output
114:     ST  1,-308(1)	Store fp in ghost frame for  output
* TOFF dec:  -309
* TOFF dec:  -310
115:     ST  3,-310(1)	Push left side 
* TOFF dec:  -311
116:     ST  3,-311(1)	Push left side 
* TOFF dec:  -312
* TOFF dec:  -313
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  (null)
* OP  (null)
* OP  (null)
* OP  (null)
* Param  5
117:     ST  3,-313(1)	Push parameter 
* TOFF dec:  -314
* Param end  output
118:    LDA  1,-308(1)	Ghost frame becomes new active frame 
119:    LDA  3,1(7)	Return address in ac 
120:    JMP  7,-115(7)	call output
121:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set:  -308
* EXPRESSION
* CALL  outnl
122:     ST  1,-308(1)	Store fp in ghost frame for  outnl
* TOFF dec:  -309
* TOFF dec:  -310
* Param end  outnl
123:    LDA  1,-308(1)	Ghost frame becomes new active frame 
124:    LDA  3,1(7)	Return address in ac 
125:    JMP  7,-92(7)	call outnl
126:    LDA  3,0(2)	save the result in ac 
* Call end  outnl
* TOFF set:  -308
* EXPRESSION
* CALL  output
127:     ST  1,-308(1)	Store fp in ghost frame for  output
* TOFF dec:  -309
* TOFF dec:  -310
128:     ST  3,-310(1)	Push left side 
* TOFF dec:  -311
129:     ST  3,-311(1)	Push left side 
* TOFF dec:  -312
* TOFF dec:  -313
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
* OP  (null)
* OP  (null)
* OP  (null)
* OP  (null)
* OP  (null)
* Param  6
130:     ST  3,-313(1)	Push parameter 
* TOFF dec:  -314
* Param end  output
131:    LDA  1,-308(1)	Ghost frame becomes new active frame 
132:    LDA  3,1(7)	Return address in ac 
133:    JMP  7,-128(7)	call output
134:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set:  -308
* EXPRESSION
* CALL  outnl
135:     ST  1,-308(1)	Store fp in ghost frame for  outnl
* TOFF dec:  -309
* TOFF dec:  -310
* Param end  outnl
136:    LDA  1,-308(1)	Ghost frame becomes new active frame 
137:    LDA  3,1(7)	Return address in ac 
138:    JMP  7,-105(7)	call outnl
139:    LDA  3,0(2)	save the result in ac 
* Call end  outnl
* TOFF set:  -308
* EXPRESSION
* CALL  output
140:     ST  1,-308(1)	Store fp in ghost frame for  output
* TOFF dec:  -309
* TOFF dec:  -310
141:     ST  3,-310(1)	Push left side 
* TOFF dec:  -311
142:     ST  3,-311(1)	Push left side 
* TOFF dec:  -312
* TOFF dec:  -313
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
* OP  (null)
* OP  (null)
* OP  (null)
* OP  (null)
* OP  (null)
* OP  (null)
* Param  7
143:     ST  3,-313(1)	Push parameter 
* TOFF dec:  -314
* Param end  output
144:    LDA  1,-308(1)	Ghost frame becomes new active frame 
145:    LDA  3,1(7)	Return address in ac 
146:    JMP  7,-141(7)	call output
147:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set:  -308
* EXPRESSION
* CALL  outnl
148:     ST  1,-308(1)	Store fp in ghost frame for  outnl
* TOFF dec:  -309
* TOFF dec:  -310
* Param end  outnl
149:    LDA  1,-308(1)	Ghost frame becomes new active frame 
150:    LDA  3,1(7)	Return address in ac 
151:    JMP  7,-118(7)	call outnl
152:    LDA  3,0(2)	save the result in ac 
* Call end  outnl
* TOFF set:  -308
* EXPRESSION
* CALL  output
153:     ST  1,-308(1)	Store fp in ghost frame for  output
* TOFF dec:  -309
* TOFF dec:  -310
154:     ST  3,-310(1)	Push left side 
* TOFF dec:  -311
155:     ST  3,-311(1)	Push left side 
* TOFF dec:  -312
* TOFF dec:  -313
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
* OP  (null)
* OP  (null)
* OP  (null)
* OP  (null)
* OP  (null)
* OP  (null)
* OP  (null)
* Param  8
156:     ST  3,-313(1)	Push parameter 
* TOFF dec:  -314
* Param end  output
157:    LDA  1,-308(1)	Ghost frame becomes new active frame 
158:    LDA  3,1(7)	Return address in ac 
159:    JMP  7,-154(7)	call output
160:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set:  -308
* EXPRESSION
* CALL  outnl
161:     ST  1,-308(1)	Store fp in ghost frame for  outnl
* TOFF dec:  -309
* TOFF dec:  -310
* Param end  outnl
162:    LDA  1,-308(1)	Ghost frame becomes new active frame 
163:    LDA  3,1(7)	Return address in ac 
164:    JMP  7,-131(7)	call outnl
165:    LDA  3,0(2)	save the result in ac 
* Call end  outnl
* TOFF set:  -308
* EXPRESSION
* CALL  output
166:     ST  1,-308(1)	Store fp in ghost frame for  output
* TOFF dec:  -309
* TOFF dec:  -310
167:     ST  3,-310(1)	Push left side 
* TOFF dec:  -311
168:     ST  3,-311(1)	Push left side 
* TOFF dec:  -312
* TOFF dec:  -313
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
* EXPRESSION
* EXPRESSION
* OP  (null)
* OP  (null)
* OP  (null)
* OP  (null)
* OP  (null)
* OP  (null)
* OP  (null)
* OP  (null)
* Param  9
169:     ST  3,-313(1)	Push parameter 
* TOFF dec:  -314
* Param end  output
170:    LDA  1,-308(1)	Ghost frame becomes new active frame 
171:    LDA  3,1(7)	Return address in ac 
172:    JMP  7,-167(7)	call output
173:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set:  -308
* EXPRESSION
* CALL  outnl
174:     ST  1,-308(1)	Store fp in ghost frame for  outnl
* TOFF dec:  -309
* TOFF dec:  -310
* Param end  outnl
175:    LDA  1,-308(1)	Ghost frame becomes new active frame 
176:    LDA  3,1(7)	Return address in ac 
177:    JMP  7,-144(7)	call outnl
178:    LDA  3,0(2)	save the result in ac 
* Call end  outnl
* TOFF set:  -308
* EXPRESSION
* CALL  output
179:     ST  1,-308(1)	Store fp in ghost frame for  output
* TOFF dec:  -309
* TOFF dec:  -310
180:     ST  3,-310(1)	Push left side 
* TOFF dec:  -311
181:     ST  3,-311(1)	Push left side 
* TOFF dec:  -312
* TOFF dec:  -313
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
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  (null)
* OP  (null)
* OP  (null)
* OP  (null)
* OP  (null)
* OP  (null)
* OP  (null)
* OP  (null)
* OP  (null)
* Param  10
182:     ST  3,-313(1)	Push parameter 
* TOFF dec:  -314
* Param end  output
183:    LDA  1,-308(1)	Ghost frame becomes new active frame 
184:    LDA  3,1(7)	Return address in ac 
185:    JMP  7,-180(7)	call output
186:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set:  -308
* EXPRESSION
* CALL  outnl
187:     ST  1,-308(1)	Store fp in ghost frame for  outnl
* TOFF dec:  -309
* TOFF dec:  -310
* Param end  outnl
188:    LDA  1,-308(1)	Ghost frame becomes new active frame 
189:    LDA  3,1(7)	Return address in ac 
190:    JMP  7,-157(7)	call outnl
191:    LDA  3,0(2)	save the result in ac 
* Call end  outnl
* TOFF set:  -308
* EXPRESSION
* CALL  output
192:     ST  1,-308(1)	Store fp in ghost frame for  output
* TOFF dec:  -309
* TOFF dec:  -310
193:     ST  3,-310(1)	Push left side 
* TOFF dec:  -311
194:     ST  3,-311(1)	Push left side 
* TOFF dec:  -312
* TOFF dec:  -313
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
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  (null)
* OP  (null)
* OP  (null)
* OP  (null)
* OP  (null)
* OP  (null)
* OP  (null)
* OP  (null)
* OP  (null)
* OP  (null)
* Param  11
195:     ST  3,-313(1)	Push parameter 
* TOFF dec:  -314
* Param end  output
196:    LDA  1,-308(1)	Ghost frame becomes new active frame 
197:    LDA  3,1(7)	Return address in ac 
198:    JMP  7,-193(7)	call output
199:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set:  -308
* EXPRESSION
* CALL  outnl
200:     ST  1,-308(1)	Store fp in ghost frame for  outnl
* TOFF dec:  -309
* TOFF dec:  -310
* Param end  outnl
201:    LDA  1,-308(1)	Ghost frame becomes new active frame 
202:    LDA  3,1(7)	Return address in ac 
203:    JMP  7,-170(7)	call outnl
204:    LDA  3,0(2)	save the result in ac 
* Call end  outnl
* TOFF set:  -308
* END COMPOUND
* Add standard closing in case there is no return statement
205:    LDC  2,0(6)	Set return value to 0 
206:     LD  3,-1(1)	Load return address 
207:     LD  1,0(1)	Adjust frame pointer 
208:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,208(7)	Jump to init [backpatch] 
* =========================================
* INIT
209:    LDA  1,0(0)	Set first frame at end of globals 
210:     ST  1,0(1)	Store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
211:    LDA  3,1(7)	Return address in ac 
212:    JMP  7,-174(7)	Jump to main 
213:   HALT  0,0(0)	DONE! 
* END INIT
