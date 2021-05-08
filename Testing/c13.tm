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
 43:     LD  4,-3(1)	Pop index 
 44:    LDA  5,-4(1)	Load address of base of array x
 45:    SUB  5,5,4	Compute offset of value 
 46:     ST  3,0(5)	Store variable x
 47:    LDC  3,73(6)	Load integer constant 
 48:     ST  3,0(5)	Store variable x
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  (null)
* EXPRESSION
* EXPRESSION
* CALL  output
 49:     ST  1,-3(1)	Store fp in ghost frame for  output
* TOFF dec:  -3
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  (null)
* Param 
 50:     ST  3,-5(1)	Push parameter 
* TOFF dec: 
* Param end  output
 51:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 52:    LDA  3,1(7)	Return address in ac 
 53:    JMP  7,-48(7)	call output
 54:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set: 
* EXPRESSION
* CALL  outnl
 55:     ST  1,-3(1)	Store fp in ghost frame for  outnl
* TOFF dec:  -3
* Param end  outnl
 56:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 57:    LDA  3,1(7)	Return address in ac 
 58:    JMP  7,-25(7)	call outnl
 59:    LDA  3,0(2)	save the result in ac 
* Call end  outnl
* TOFF set: 
* EXPRESSION
* ASSIGN  =
 60:    LDC  3,5(6)	Load integer constant 
 61:     ST  3,-303(1)	Store variable z
* TOFF dec:  -4
* EXPRESSION
* EXPRESSION
* EXPRESSION
* ASSIGN  =
 62:     ST  3,-4(1)	Push index 
 63:     LD  4,-4(1)	Pop index 
 64:    LDA  5,-4(1)	Load address of base of array x
 65:    SUB  5,5,4	Compute offset of value 
 66:     ST  3,0(5)	Store variable x
 67:    LDC  3,17(6)	Load integer constant 
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
* TOFF dec:  -5
* EXPRESSION
* EXPRESSION
* EXPRESSION
* ASSIGN  =
 71:     ST  3,-5(1)	Push index 
 72:     LD  4,-5(1)	Pop index 
 73:    LDA  5,-4(1)	Load address of base of array x
 74:    SUB  5,5,4	Compute offset of value 
 75:     ST  3,0(5)	Store variable x
 76:    LDC  3,5(6)	Load integer constant 
 77:     ST  3,0(5)	Store variable x
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  (null)
* EXPRESSION
* EXPRESSION
* CALL  output
 78:     ST  1,-5(1)	Store fp in ghost frame for  output
* TOFF dec:  -5
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  (null)
* Param 
 79:     ST  3,-7(1)	Push parameter 
* TOFF dec: 
* Param end  output
 80:    LDA  1,-5(1)	Ghost frame becomes new active frame 
 81:    LDA  3,1(7)	Return address in ac 
 82:    JMP  7,-77(7)	call output
 83:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set: 
* EXPRESSION
* CALL  outnl
 84:     ST  1,-5(1)	Store fp in ghost frame for  outnl
* TOFF dec:  -5
* Param end  outnl
 85:    LDA  1,-5(1)	Ghost frame becomes new active frame 
 86:    LDA  3,1(7)	Return address in ac 
 87:    JMP  7,-54(7)	call outnl
 88:    LDA  3,0(2)	save the result in ac 
* Call end  outnl
* TOFF set: 
* EXPRESSION
* CALL  output
 89:     ST  1,-5(1)	Store fp in ghost frame for  output
* TOFF dec:  -5
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  (null)
* OP  (null)
* Param 
 90:     ST  3,-7(1)	Push parameter 
* TOFF dec: 
* Param end  output
 91:    LDA  1,-5(1)	Ghost frame becomes new active frame 
 92:    LDA  3,1(7)	Return address in ac 
 93:    JMP  7,-88(7)	call output
 94:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set: 
* EXPRESSION
* CALL  outnl
 95:     ST  1,-5(1)	Store fp in ghost frame for  outnl
* TOFF dec:  -5
* Param end  outnl
 96:    LDA  1,-5(1)	Ghost frame becomes new active frame 
 97:    LDA  3,1(7)	Return address in ac 
 98:    JMP  7,-65(7)	call outnl
 99:    LDA  3,0(2)	save the result in ac 
* Call end  outnl
* TOFF set: 
* EXPRESSION
* CALL  output
100:     ST  1,-5(1)	Store fp in ghost frame for  output
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
101:     ST  3,-7(1)	Push parameter 
* TOFF dec: 
* Param end  output
102:    LDA  1,-5(1)	Ghost frame becomes new active frame 
103:    LDA  3,1(7)	Return address in ac 
104:    JMP  7,-99(7)	call output
105:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set: 
* EXPRESSION
* CALL  outnl
106:     ST  1,-5(1)	Store fp in ghost frame for  outnl
* TOFF dec:  -5
* Param end  outnl
107:    LDA  1,-5(1)	Ghost frame becomes new active frame 
108:    LDA  3,1(7)	Return address in ac 
109:    JMP  7,-76(7)	call outnl
110:    LDA  3,0(2)	save the result in ac 
* Call end  outnl
* TOFF set: 
* EXPRESSION
* CALL  output
111:     ST  1,-5(1)	Store fp in ghost frame for  output
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
112:     ST  3,-7(1)	Push parameter 
* TOFF dec: 
* Param end  output
113:    LDA  1,-5(1)	Ghost frame becomes new active frame 
114:    LDA  3,1(7)	Return address in ac 
115:    JMP  7,-110(7)	call output
116:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set: 
* EXPRESSION
* CALL  outnl
117:     ST  1,-5(1)	Store fp in ghost frame for  outnl
* TOFF dec:  -5
* Param end  outnl
118:    LDA  1,-5(1)	Ghost frame becomes new active frame 
119:    LDA  3,1(7)	Return address in ac 
120:    JMP  7,-87(7)	call outnl
121:    LDA  3,0(2)	save the result in ac 
* Call end  outnl
* TOFF set: 
* EXPRESSION
* CALL  output
122:     ST  1,-5(1)	Store fp in ghost frame for  output
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
123:     ST  3,-7(1)	Push parameter 
* TOFF dec: 
* Param end  output
124:    LDA  1,-5(1)	Ghost frame becomes new active frame 
125:    LDA  3,1(7)	Return address in ac 
126:    JMP  7,-121(7)	call output
127:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set: 
* EXPRESSION
* CALL  outnl
128:     ST  1,-5(1)	Store fp in ghost frame for  outnl
* TOFF dec:  -5
* Param end  outnl
129:    LDA  1,-5(1)	Ghost frame becomes new active frame 
130:    LDA  3,1(7)	Return address in ac 
131:    JMP  7,-98(7)	call outnl
132:    LDA  3,0(2)	save the result in ac 
* Call end  outnl
* TOFF set: 
* EXPRESSION
* CALL  output
133:     ST  1,-5(1)	Store fp in ghost frame for  output
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
134:     ST  3,-7(1)	Push parameter 
* TOFF dec: 
* Param end  output
135:    LDA  1,-5(1)	Ghost frame becomes new active frame 
136:    LDA  3,1(7)	Return address in ac 
137:    JMP  7,-132(7)	call output
138:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set: 
* EXPRESSION
* CALL  outnl
139:     ST  1,-5(1)	Store fp in ghost frame for  outnl
* TOFF dec:  -5
* Param end  outnl
140:    LDA  1,-5(1)	Ghost frame becomes new active frame 
141:    LDA  3,1(7)	Return address in ac 
142:    JMP  7,-109(7)	call outnl
143:    LDA  3,0(2)	save the result in ac 
* Call end  outnl
* TOFF set: 
* EXPRESSION
* CALL  output
144:     ST  1,-5(1)	Store fp in ghost frame for  output
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
145:     ST  3,-7(1)	Push parameter 
* TOFF dec: 
* Param end  output
146:    LDA  1,-5(1)	Ghost frame becomes new active frame 
147:    LDA  3,1(7)	Return address in ac 
148:    JMP  7,-143(7)	call output
149:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set: 
* EXPRESSION
* CALL  outnl
150:     ST  1,-5(1)	Store fp in ghost frame for  outnl
* TOFF dec:  -5
* Param end  outnl
151:    LDA  1,-5(1)	Ghost frame becomes new active frame 
152:    LDA  3,1(7)	Return address in ac 
153:    JMP  7,-120(7)	call outnl
154:    LDA  3,0(2)	save the result in ac 
* Call end  outnl
* TOFF set: 
* EXPRESSION
* CALL  output
155:     ST  1,-5(1)	Store fp in ghost frame for  output
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
156:     ST  3,-7(1)	Push parameter 
* TOFF dec: 
* Param end  output
157:    LDA  1,-5(1)	Ghost frame becomes new active frame 
158:    LDA  3,1(7)	Return address in ac 
159:    JMP  7,-154(7)	call output
160:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set: 
* EXPRESSION
* CALL  outnl
161:     ST  1,-5(1)	Store fp in ghost frame for  outnl
* TOFF dec:  -5
* Param end  outnl
162:    LDA  1,-5(1)	Ghost frame becomes new active frame 
163:    LDA  3,1(7)	Return address in ac 
164:    JMP  7,-131(7)	call outnl
165:    LDA  3,0(2)	save the result in ac 
* Call end  outnl
* TOFF set: 
* EXPRESSION
* CALL  output
166:     ST  1,-5(1)	Store fp in ghost frame for  output
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
167:     ST  3,-7(1)	Push parameter 
* TOFF dec: 
* Param end  output
168:    LDA  1,-5(1)	Ghost frame becomes new active frame 
169:    LDA  3,1(7)	Return address in ac 
170:    JMP  7,-165(7)	call output
171:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set: 
* EXPRESSION
* CALL  outnl
172:     ST  1,-5(1)	Store fp in ghost frame for  outnl
* TOFF dec:  -5
* Param end  outnl
173:    LDA  1,-5(1)	Ghost frame becomes new active frame 
174:    LDA  3,1(7)	Return address in ac 
175:    JMP  7,-142(7)	call outnl
176:    LDA  3,0(2)	save the result in ac 
* Call end  outnl
* TOFF set: 
* EXPRESSION
* CALL  output
177:     ST  1,-5(1)	Store fp in ghost frame for  output
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
178:     ST  3,-7(1)	Push parameter 
* TOFF dec: 
* Param end  output
179:    LDA  1,-5(1)	Ghost frame becomes new active frame 
180:    LDA  3,1(7)	Return address in ac 
181:    JMP  7,-176(7)	call output
182:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set: 
* EXPRESSION
* CALL  outnl
183:     ST  1,-5(1)	Store fp in ghost frame for  outnl
* TOFF dec:  -5
* Param end  outnl
184:    LDA  1,-5(1)	Ghost frame becomes new active frame 
185:    LDA  3,1(7)	Return address in ac 
186:    JMP  7,-153(7)	call outnl
187:    LDA  3,0(2)	save the result in ac 
* Call end  outnl
* TOFF set: 
* END COMPOUND
* Add standard closing in case there is no return statement
188:    LDC  2,0(6)	Set return value to 0 
189:     LD  3,-1(1)	Load return address 
190:     LD  1,0(1)	Adjust frame pointer 
191:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,191(7)	Jump to init [backpatch] 
* =========================================
* INIT
192:    LDA  1,298(0)	Set first frame at end of globals 
193:     ST  1,0(1)	Store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
194:    LDA  3,1(7)	Return address in ac 
195:    JMP  7,-157(7)	Jump to main 
196:   HALT  0,0(0)	DONE! 
* END INIT
