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
* TOFF set:  -2
* Compound body
* Var
* Var
* EXPRESSION
* ASSIGN  =
 40:    LDC  3,5(6)	Load integer constant 
 41:     ST  3,-303(1)	Store variable z
* TOFF dec:  -3
* EXPRESSION
* EXPRESSION
* EXPRESSION
* ASSIGN  =
 42:     ST  3,-3(1)	Push index 
 43:    LDC  3,73(6)	Load integer constant 
 44:     LD  4,-3(1)	Pop index 
 45:    LDA  5,-4(1)	Load address of base of array x
 46:    SUB  5,5,4	Compute offset of value 
 47:     ST  3,0(5)	Store variable x
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  (null)
* EXPRESSION
* EXPRESSION
* CALL  output
 48:     ST  1,-3(1)	Store fp in ghost frame for  output
* TOFF dec:  -3
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  (null)
* Param 
 49:     ST  3,-5(1)	Push parameter 
* TOFF dec: 
* Param end  output
 50:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 51:    LDA  3,1(7)	Return address in ac 
 52:    JMP  7,-47(7)	call output
 53:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set: 
* EXPRESSION
* CALL  outnl
 54:     ST  1,-3(1)	Store fp in ghost frame for  outnl
* TOFF dec:  -3
* Param end  outnl
 55:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 56:    LDA  3,1(7)	Return address in ac 
 57:    JMP  7,-24(7)	call outnl
 58:    LDA  3,0(2)	save the result in ac 
* Call end  outnl
* TOFF set: 
* EXPRESSION
* ASSIGN  =
 59:    LDC  3,5(6)	Load integer constant 
 60:     ST  3,-303(1)	Store variable z
* TOFF dec:  -4
* EXPRESSION
* EXPRESSION
* EXPRESSION
* ASSIGN  =
 61:     ST  3,-4(1)	Push index 
 62:    LDC  3,17(6)	Load integer constant 
 63:     LD  4,-4(1)	Pop index 
 64:    LDA  5,-4(1)	Load address of base of array x
 65:    SUB  5,5,4	Compute offset of value 
 66:     ST  3,0(5)	Store variable x
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  (null)
* EXPRESSION
* EXPRESSION
* ASSIGN  =
 67:    LDC  3,17(6)	Load integer constant 
 68:     ST  3,-303(1)	Store variable z
* TOFF dec:  -5
* EXPRESSION
* EXPRESSION
* EXPRESSION
* ASSIGN  =
 69:     ST  3,-5(1)	Push index 
 70:    LDC  3,5(6)	Load integer constant 
 71:     LD  4,-5(1)	Pop index 
 72:    LDA  5,-4(1)	Load address of base of array x
 73:    SUB  5,5,4	Compute offset of value 
 74:     ST  3,0(5)	Store variable x
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  (null)
* EXPRESSION
* EXPRESSION
* CALL  output
 75:     ST  1,-5(1)	Store fp in ghost frame for  output
* TOFF dec:  -5
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  (null)
* Param 
 76:     ST  3,-7(1)	Push parameter 
* TOFF dec: 
* Param end  output
 77:    LDA  1,-5(1)	Ghost frame becomes new active frame 
 78:    LDA  3,1(7)	Return address in ac 
 79:    JMP  7,-74(7)	call output
 80:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set: 
* EXPRESSION
* CALL  outnl
 81:     ST  1,-5(1)	Store fp in ghost frame for  outnl
* TOFF dec:  -5
* Param end  outnl
 82:    LDA  1,-5(1)	Ghost frame becomes new active frame 
 83:    LDA  3,1(7)	Return address in ac 
 84:    JMP  7,-51(7)	call outnl
 85:    LDA  3,0(2)	save the result in ac 
* Call end  outnl
* TOFF set: 
* EXPRESSION
* CALL  output
 86:     ST  1,-5(1)	Store fp in ghost frame for  output
* TOFF dec:  -5
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  (null)
* OP  (null)
* Param 
 87:     ST  3,-7(1)	Push parameter 
* TOFF dec: 
* Param end  output
 88:    LDA  1,-5(1)	Ghost frame becomes new active frame 
 89:    LDA  3,1(7)	Return address in ac 
 90:    JMP  7,-85(7)	call output
 91:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set: 
* EXPRESSION
* CALL  outnl
 92:     ST  1,-5(1)	Store fp in ghost frame for  outnl
* TOFF dec:  -5
* Param end  outnl
 93:    LDA  1,-5(1)	Ghost frame becomes new active frame 
 94:    LDA  3,1(7)	Return address in ac 
 95:    JMP  7,-62(7)	call outnl
 96:    LDA  3,0(2)	save the result in ac 
* Call end  outnl
* TOFF set: 
* EXPRESSION
* CALL  output
 97:     ST  1,-5(1)	Store fp in ghost frame for  output
* TOFF dec:  -5
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
 98:     ST  3,-7(1)	Push parameter 
* TOFF dec: 
* Param end  output
 99:    LDA  1,-5(1)	Ghost frame becomes new active frame 
100:    LDA  3,1(7)	Return address in ac 
101:    JMP  7,-96(7)	call output
102:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set: 
* EXPRESSION
* CALL  outnl
103:     ST  1,-5(1)	Store fp in ghost frame for  outnl
* TOFF dec:  -5
* Param end  outnl
104:    LDA  1,-5(1)	Ghost frame becomes new active frame 
105:    LDA  3,1(7)	Return address in ac 
106:    JMP  7,-73(7)	call outnl
107:    LDA  3,0(2)	save the result in ac 
* Call end  outnl
* TOFF set: 
* EXPRESSION
* CALL  output
108:     ST  1,-5(1)	Store fp in ghost frame for  output
* TOFF dec:  -5
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
109:     ST  3,-7(1)	Push parameter 
* TOFF dec: 
* Param end  output
110:    LDA  1,-5(1)	Ghost frame becomes new active frame 
111:    LDA  3,1(7)	Return address in ac 
112:    JMP  7,-107(7)	call output
113:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set: 
* EXPRESSION
* CALL  outnl
114:     ST  1,-5(1)	Store fp in ghost frame for  outnl
* TOFF dec:  -5
* Param end  outnl
115:    LDA  1,-5(1)	Ghost frame becomes new active frame 
116:    LDA  3,1(7)	Return address in ac 
117:    JMP  7,-84(7)	call outnl
118:    LDA  3,0(2)	save the result in ac 
* Call end  outnl
* TOFF set: 
* EXPRESSION
* CALL  output
119:     ST  1,-5(1)	Store fp in ghost frame for  output
* TOFF dec:  -5
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
120:     ST  3,-7(1)	Push parameter 
* TOFF dec: 
* Param end  output
121:    LDA  1,-5(1)	Ghost frame becomes new active frame 
122:    LDA  3,1(7)	Return address in ac 
123:    JMP  7,-118(7)	call output
124:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set: 
* EXPRESSION
* CALL  outnl
125:     ST  1,-5(1)	Store fp in ghost frame for  outnl
* TOFF dec:  -5
* Param end  outnl
126:    LDA  1,-5(1)	Ghost frame becomes new active frame 
127:    LDA  3,1(7)	Return address in ac 
128:    JMP  7,-95(7)	call outnl
129:    LDA  3,0(2)	save the result in ac 
* Call end  outnl
* TOFF set: 
* EXPRESSION
* CALL  output
130:     ST  1,-5(1)	Store fp in ghost frame for  output
* TOFF dec:  -5
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
131:     ST  3,-7(1)	Push parameter 
* TOFF dec: 
* Param end  output
132:    LDA  1,-5(1)	Ghost frame becomes new active frame 
133:    LDA  3,1(7)	Return address in ac 
134:    JMP  7,-129(7)	call output
135:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set: 
* EXPRESSION
* CALL  outnl
136:     ST  1,-5(1)	Store fp in ghost frame for  outnl
* TOFF dec:  -5
* Param end  outnl
137:    LDA  1,-5(1)	Ghost frame becomes new active frame 
138:    LDA  3,1(7)	Return address in ac 
139:    JMP  7,-106(7)	call outnl
140:    LDA  3,0(2)	save the result in ac 
* Call end  outnl
* TOFF set: 
* EXPRESSION
* CALL  output
141:     ST  1,-5(1)	Store fp in ghost frame for  output
* TOFF dec:  -5
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
142:     ST  3,-7(1)	Push parameter 
* TOFF dec: 
* Param end  output
143:    LDA  1,-5(1)	Ghost frame becomes new active frame 
144:    LDA  3,1(7)	Return address in ac 
145:    JMP  7,-140(7)	call output
146:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set: 
* EXPRESSION
* CALL  outnl
147:     ST  1,-5(1)	Store fp in ghost frame for  outnl
* TOFF dec:  -5
* Param end  outnl
148:    LDA  1,-5(1)	Ghost frame becomes new active frame 
149:    LDA  3,1(7)	Return address in ac 
150:    JMP  7,-117(7)	call outnl
151:    LDA  3,0(2)	save the result in ac 
* Call end  outnl
* TOFF set: 
* EXPRESSION
* CALL  output
152:     ST  1,-5(1)	Store fp in ghost frame for  output
* TOFF dec:  -5
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
153:     ST  3,-7(1)	Push parameter 
* TOFF dec: 
* Param end  output
154:    LDA  1,-5(1)	Ghost frame becomes new active frame 
155:    LDA  3,1(7)	Return address in ac 
156:    JMP  7,-151(7)	call output
157:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set: 
* EXPRESSION
* CALL  outnl
158:     ST  1,-5(1)	Store fp in ghost frame for  outnl
* TOFF dec:  -5
* Param end  outnl
159:    LDA  1,-5(1)	Ghost frame becomes new active frame 
160:    LDA  3,1(7)	Return address in ac 
161:    JMP  7,-128(7)	call outnl
162:    LDA  3,0(2)	save the result in ac 
* Call end  outnl
* TOFF set: 
* EXPRESSION
* CALL  output
163:     ST  1,-5(1)	Store fp in ghost frame for  output
* TOFF dec:  -5
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
164:     ST  3,-7(1)	Push parameter 
* TOFF dec: 
* Param end  output
165:    LDA  1,-5(1)	Ghost frame becomes new active frame 
166:    LDA  3,1(7)	Return address in ac 
167:    JMP  7,-162(7)	call output
168:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set: 
* EXPRESSION
* CALL  outnl
169:     ST  1,-5(1)	Store fp in ghost frame for  outnl
* TOFF dec:  -5
* Param end  outnl
170:    LDA  1,-5(1)	Ghost frame becomes new active frame 
171:    LDA  3,1(7)	Return address in ac 
172:    JMP  7,-139(7)	call outnl
173:    LDA  3,0(2)	save the result in ac 
* Call end  outnl
* TOFF set: 
* EXPRESSION
* CALL  output
174:     ST  1,-5(1)	Store fp in ghost frame for  output
* TOFF dec:  -5
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
175:     ST  3,-7(1)	Push parameter 
* TOFF dec: 
* Param end  output
176:    LDA  1,-5(1)	Ghost frame becomes new active frame 
177:    LDA  3,1(7)	Return address in ac 
178:    JMP  7,-173(7)	call output
179:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set: 
* EXPRESSION
* CALL  outnl
180:     ST  1,-5(1)	Store fp in ghost frame for  outnl
* TOFF dec:  -5
* Param end  outnl
181:    LDA  1,-5(1)	Ghost frame becomes new active frame 
182:    LDA  3,1(7)	Return address in ac 
183:    JMP  7,-150(7)	call outnl
184:    LDA  3,0(2)	save the result in ac 
* Call end  outnl
* TOFF set: 
* END COMPOUND
* Add standard closing in case there is no return statement
185:    LDC  2,0(6)	Set return value to 0 
186:     LD  3,-1(1)	Load return address 
187:     LD  1,0(1)	Adjust frame pointer 
188:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,188(7)	Jump to init [backpatch] 
* =========================================
* INIT
189:    LDA  1,298(0)	Set first frame at end of globals 
190:     ST  1,0(1)	Store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
191:    LDA  3,1(7)	Return address in ac 
192:    JMP  7,-154(7)	Jump to main 
193:   HALT  0,0(0)	DONE! 
* END INIT
