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
* Param 
 51:     ST  3,-308(1)	Push parameter 
* TOFF dec: 
* Param end  output
 52:    LDA  1,-306(1)	Ghost frame becomes new active frame 
 53:    LDA  3,1(7)	Return address in ac 
 54:    JMP  7,-49(7)	call output
 55:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set: 
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
* TOFF set: 
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
* Param 
 78:     ST  3,-310(1)	Push parameter 
* TOFF dec: 
* Param end  output
 79:    LDA  1,-308(1)	Ghost frame becomes new active frame 
 80:    LDA  3,1(7)	Return address in ac 
 81:    JMP  7,-76(7)	call output
 82:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set: 
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
* TOFF set: 
* EXPRESSION
* CALL  output
 88:     ST  1,-308(1)	Store fp in ghost frame for  output
* TOFF dec:  -309
* TOFF dec:  -310
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  (null)
* OP  (null)
* Param 
 89:     ST  3,-310(1)	Push parameter 
* TOFF dec: 
* Param end  output
 90:    LDA  1,-308(1)	Ghost frame becomes new active frame 
 91:    LDA  3,1(7)	Return address in ac 
 92:    JMP  7,-87(7)	call output
 93:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set: 
* EXPRESSION
* CALL  outnl
 94:     ST  1,-308(1)	Store fp in ghost frame for  outnl
* TOFF dec:  -309
* TOFF dec:  -310
* Param end  outnl
 95:    LDA  1,-308(1)	Ghost frame becomes new active frame 
 96:    LDA  3,1(7)	Return address in ac 
 97:    JMP  7,-64(7)	call outnl
 98:    LDA  3,0(2)	save the result in ac 
* Call end  outnl
* TOFF set: 
* EXPRESSION
* CALL  output
 99:     ST  1,-308(1)	Store fp in ghost frame for  output
* TOFF dec:  -309
* TOFF dec:  -310
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
* Param 
100:     ST  3,-310(1)	Push parameter 
* TOFF dec: 
* Param end  output
101:    LDA  1,-308(1)	Ghost frame becomes new active frame 
102:    LDA  3,1(7)	Return address in ac 
103:    JMP  7,-98(7)	call output
104:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set: 
* EXPRESSION
* CALL  outnl
105:     ST  1,-308(1)	Store fp in ghost frame for  outnl
* TOFF dec:  -309
* TOFF dec:  -310
* Param end  outnl
106:    LDA  1,-308(1)	Ghost frame becomes new active frame 
107:    LDA  3,1(7)	Return address in ac 
108:    JMP  7,-75(7)	call outnl
109:    LDA  3,0(2)	save the result in ac 
* Call end  outnl
* TOFF set: 
* EXPRESSION
* CALL  output
110:     ST  1,-308(1)	Store fp in ghost frame for  output
* TOFF dec:  -309
* TOFF dec:  -310
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
* Param 
111:     ST  3,-310(1)	Push parameter 
* TOFF dec: 
* Param end  output
112:    LDA  1,-308(1)	Ghost frame becomes new active frame 
113:    LDA  3,1(7)	Return address in ac 
114:    JMP  7,-109(7)	call output
115:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set: 
* EXPRESSION
* CALL  outnl
116:     ST  1,-308(1)	Store fp in ghost frame for  outnl
* TOFF dec:  -309
* TOFF dec:  -310
* Param end  outnl
117:    LDA  1,-308(1)	Ghost frame becomes new active frame 
118:    LDA  3,1(7)	Return address in ac 
119:    JMP  7,-86(7)	call outnl
120:    LDA  3,0(2)	save the result in ac 
* Call end  outnl
* TOFF set: 
* EXPRESSION
* CALL  output
121:     ST  1,-308(1)	Store fp in ghost frame for  output
* TOFF dec:  -309
* TOFF dec:  -310
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
* Param 
122:     ST  3,-310(1)	Push parameter 
* TOFF dec: 
* Param end  output
123:    LDA  1,-308(1)	Ghost frame becomes new active frame 
124:    LDA  3,1(7)	Return address in ac 
125:    JMP  7,-120(7)	call output
126:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set: 
* EXPRESSION
* CALL  outnl
127:     ST  1,-308(1)	Store fp in ghost frame for  outnl
* TOFF dec:  -309
* TOFF dec:  -310
* Param end  outnl
128:    LDA  1,-308(1)	Ghost frame becomes new active frame 
129:    LDA  3,1(7)	Return address in ac 
130:    JMP  7,-97(7)	call outnl
131:    LDA  3,0(2)	save the result in ac 
* Call end  outnl
* TOFF set: 
* EXPRESSION
* CALL  output
132:     ST  1,-308(1)	Store fp in ghost frame for  output
* TOFF dec:  -309
* TOFF dec:  -310
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
* Param 
133:     ST  3,-310(1)	Push parameter 
* TOFF dec: 
* Param end  output
134:    LDA  1,-308(1)	Ghost frame becomes new active frame 
135:    LDA  3,1(7)	Return address in ac 
136:    JMP  7,-131(7)	call output
137:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set: 
* EXPRESSION
* CALL  outnl
138:     ST  1,-308(1)	Store fp in ghost frame for  outnl
* TOFF dec:  -309
* TOFF dec:  -310
* Param end  outnl
139:    LDA  1,-308(1)	Ghost frame becomes new active frame 
140:    LDA  3,1(7)	Return address in ac 
141:    JMP  7,-108(7)	call outnl
142:    LDA  3,0(2)	save the result in ac 
* Call end  outnl
* TOFF set: 
* EXPRESSION
* CALL  output
143:     ST  1,-308(1)	Store fp in ghost frame for  output
* TOFF dec:  -309
* TOFF dec:  -310
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
* Param 
144:     ST  3,-310(1)	Push parameter 
* TOFF dec: 
* Param end  output
145:    LDA  1,-308(1)	Ghost frame becomes new active frame 
146:    LDA  3,1(7)	Return address in ac 
147:    JMP  7,-142(7)	call output
148:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set: 
* EXPRESSION
* CALL  outnl
149:     ST  1,-308(1)	Store fp in ghost frame for  outnl
* TOFF dec:  -309
* TOFF dec:  -310
* Param end  outnl
150:    LDA  1,-308(1)	Ghost frame becomes new active frame 
151:    LDA  3,1(7)	Return address in ac 
152:    JMP  7,-119(7)	call outnl
153:    LDA  3,0(2)	save the result in ac 
* Call end  outnl
* TOFF set: 
* EXPRESSION
* CALL  output
154:     ST  1,-308(1)	Store fp in ghost frame for  output
* TOFF dec:  -309
* TOFF dec:  -310
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
* Param 
155:     ST  3,-310(1)	Push parameter 
* TOFF dec: 
* Param end  output
156:    LDA  1,-308(1)	Ghost frame becomes new active frame 
157:    LDA  3,1(7)	Return address in ac 
158:    JMP  7,-153(7)	call output
159:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set: 
* EXPRESSION
* CALL  outnl
160:     ST  1,-308(1)	Store fp in ghost frame for  outnl
* TOFF dec:  -309
* TOFF dec:  -310
* Param end  outnl
161:    LDA  1,-308(1)	Ghost frame becomes new active frame 
162:    LDA  3,1(7)	Return address in ac 
163:    JMP  7,-130(7)	call outnl
164:    LDA  3,0(2)	save the result in ac 
* Call end  outnl
* TOFF set: 
* EXPRESSION
* CALL  output
165:     ST  1,-308(1)	Store fp in ghost frame for  output
* TOFF dec:  -309
* TOFF dec:  -310
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
* Param 
166:     ST  3,-310(1)	Push parameter 
* TOFF dec: 
* Param end  output
167:    LDA  1,-308(1)	Ghost frame becomes new active frame 
168:    LDA  3,1(7)	Return address in ac 
169:    JMP  7,-164(7)	call output
170:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set: 
* EXPRESSION
* CALL  outnl
171:     ST  1,-308(1)	Store fp in ghost frame for  outnl
* TOFF dec:  -309
* TOFF dec:  -310
* Param end  outnl
172:    LDA  1,-308(1)	Ghost frame becomes new active frame 
173:    LDA  3,1(7)	Return address in ac 
174:    JMP  7,-141(7)	call outnl
175:    LDA  3,0(2)	save the result in ac 
* Call end  outnl
* TOFF set: 
* EXPRESSION
* CALL  output
176:     ST  1,-308(1)	Store fp in ghost frame for  output
* TOFF dec:  -309
* TOFF dec:  -310
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
* Param 
177:     ST  3,-310(1)	Push parameter 
* TOFF dec: 
* Param end  output
178:    LDA  1,-308(1)	Ghost frame becomes new active frame 
179:    LDA  3,1(7)	Return address in ac 
180:    JMP  7,-175(7)	call output
181:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set: 
* EXPRESSION
* CALL  outnl
182:     ST  1,-308(1)	Store fp in ghost frame for  outnl
* TOFF dec:  -309
* TOFF dec:  -310
* Param end  outnl
183:    LDA  1,-308(1)	Ghost frame becomes new active frame 
184:    LDA  3,1(7)	Return address in ac 
185:    JMP  7,-152(7)	call outnl
186:    LDA  3,0(2)	save the result in ac 
* Call end  outnl
* TOFF set: 
* END COMPOUND
* Add standard closing in case there is no return statement
187:    LDC  2,0(6)	Set return value to 0 
188:     LD  3,-1(1)	Load return address 
189:     LD  1,0(1)	Adjust frame pointer 
190:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,190(7)	Jump to init [backpatch] 
* =========================================
* INIT
191:    LDA  1,0(0)	Set first frame at end of globals 
192:     ST  1,0(1)	Store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
193:    LDA  3,1(7)	Return address in ac 
194:    JMP  7,-156(7)	Jump to main 
195:   HALT  0,0(0)	DONE! 
* END INIT
