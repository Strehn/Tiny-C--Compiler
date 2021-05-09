* C- version: 1.00
* by Sydney Petrehn
* Input file: b0b.c-
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
 41:     LD  3,0(0)	Load variable (null)
 42:     ST  3,-4(1)	Push left side 
 43:     LD  3,0(0)	Load variable (null)
* EXPRESSION
* EXPRESSION
 44:    LDC  3,0(6)	Load integer constant 
 45:     ST  3,-4(1)	Push left side 
* EXPRESSION
 46:    LDC  3,0(6)	Load integer constant 
* OP  or
 47:     LD  4,-4(1)	Pop left into ac1 
 48:     OR  3,4,3	Op | 
* Param 
 49:     ST  3,-4(1)	Push parameter 
* TOFF dec: 
* Param end  outputb
 50:    LDA  1,-2(1)	Ghost frame becomes new active frame 
 51:    LDA  3,1(7)	Return address in ac 
 52:    JMP  7,-36(7)	call outputb
 53:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set: 
* EXPRESSION
* CALL  outputb
 54:     ST  1,-2(1)	Store fp in ghost frame for  outputb
* TOFF dec:  -3
* TOFF dec:  -4
 55:     LD  3,0(0)	Load variable (null)
 56:     ST  3,-4(1)	Push left side 
 57:     LD  3,0(0)	Load variable (null)
* EXPRESSION
* EXPRESSION
 58:    LDC  3,0(6)	Load integer constant 
 59:     ST  3,-4(1)	Push left side 
* EXPRESSION
 60:    LDC  3,1(6)	Load integer constant 
* OP  or
 61:     LD  4,-4(1)	Pop left into ac1 
 62:     OR  3,4,3	Op | 
* Param 
 63:     ST  3,-4(1)	Push parameter 
* TOFF dec: 
* Param end  outputb
 64:    LDA  1,-2(1)	Ghost frame becomes new active frame 
 65:    LDA  3,1(7)	Return address in ac 
 66:    JMP  7,-50(7)	call outputb
 67:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set: 
* EXPRESSION
* CALL  outputb
 68:     ST  1,-2(1)	Store fp in ghost frame for  outputb
* TOFF dec:  -3
* TOFF dec:  -4
 69:     LD  3,0(0)	Load variable (null)
 70:     ST  3,-4(1)	Push left side 
 71:     LD  3,0(0)	Load variable (null)
* EXPRESSION
* EXPRESSION
 72:    LDC  3,1(6)	Load integer constant 
 73:     ST  3,-4(1)	Push left side 
* EXPRESSION
 74:    LDC  3,0(6)	Load integer constant 
* OP  or
 75:     LD  4,-4(1)	Pop left into ac1 
 76:     OR  3,4,3	Op | 
* Param 
 77:     ST  3,-4(1)	Push parameter 
* TOFF dec: 
* Param end  outputb
 78:    LDA  1,-2(1)	Ghost frame becomes new active frame 
 79:    LDA  3,1(7)	Return address in ac 
 80:    JMP  7,-64(7)	call outputb
 81:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set: 
* EXPRESSION
* CALL  outputb
 82:     ST  1,-2(1)	Store fp in ghost frame for  outputb
* TOFF dec:  -3
* TOFF dec:  -4
 83:     LD  3,0(0)	Load variable (null)
 84:     ST  3,-4(1)	Push left side 
 85:     LD  3,0(0)	Load variable (null)
* EXPRESSION
* EXPRESSION
 86:    LDC  3,1(6)	Load integer constant 
 87:     ST  3,-4(1)	Push left side 
* EXPRESSION
 88:    LDC  3,1(6)	Load integer constant 
* OP  or
 89:     LD  4,-4(1)	Pop left into ac1 
 90:     OR  3,4,3	Op | 
* Param 
 91:     ST  3,-4(1)	Push parameter 
* TOFF dec: 
* Param end  outputb
 92:    LDA  1,-2(1)	Ghost frame becomes new active frame 
 93:    LDA  3,1(7)	Return address in ac 
 94:    JMP  7,-78(7)	call outputb
 95:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set: 
* EXPRESSION
* CALL  outnl
 96:     ST  1,-2(1)	Store fp in ghost frame for  outnl
* TOFF dec:  -3
* TOFF dec:  -4
* Param end  outnl
 97:    LDA  1,-2(1)	Ghost frame becomes new active frame 
 98:    LDA  3,1(7)	Return address in ac 
 99:    JMP  7,-66(7)	call outnl
100:    LDA  3,0(2)	save the result in ac 
* Call end  outnl
* TOFF set: 
* EXPRESSION
* CALL  outputb
101:     ST  1,-2(1)	Store fp in ghost frame for  outputb
* TOFF dec:  -3
* TOFF dec:  -4
102:     LD  3,0(0)	Load variable (null)
103:     ST  3,-4(1)	Push left side 
104:     LD  3,0(0)	Load variable (null)
* EXPRESSION
* EXPRESSION
105:    LDC  3,0(6)	Load integer constant 
106:     ST  3,-4(1)	Push left side 
* EXPRESSION
107:    LDC  3,0(6)	Load integer constant 
* OP  and
108:     LD  4,-4(1)	Pop left into ac1 
109:    AND  3,4,3	Op & 
* Param 
110:     ST  3,-4(1)	Push parameter 
* TOFF dec: 
* Param end  outputb
111:    LDA  1,-2(1)	Ghost frame becomes new active frame 
112:    LDA  3,1(7)	Return address in ac 
113:    JMP  7,-97(7)	call outputb
114:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set: 
* EXPRESSION
* CALL  outputb
115:     ST  1,-2(1)	Store fp in ghost frame for  outputb
* TOFF dec:  -3
* TOFF dec:  -4
116:     LD  3,0(0)	Load variable (null)
117:     ST  3,-4(1)	Push left side 
118:     LD  3,0(0)	Load variable (null)
* EXPRESSION
* EXPRESSION
119:    LDC  3,0(6)	Load integer constant 
120:     ST  3,-4(1)	Push left side 
* EXPRESSION
121:    LDC  3,1(6)	Load integer constant 
* OP  and
122:     LD  4,-4(1)	Pop left into ac1 
123:    AND  3,4,3	Op & 
* Param 
124:     ST  3,-4(1)	Push parameter 
* TOFF dec: 
* Param end  outputb
125:    LDA  1,-2(1)	Ghost frame becomes new active frame 
126:    LDA  3,1(7)	Return address in ac 
127:    JMP  7,-111(7)	call outputb
128:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set: 
* EXPRESSION
* CALL  outputb
129:     ST  1,-2(1)	Store fp in ghost frame for  outputb
* TOFF dec:  -3
* TOFF dec:  -4
130:     LD  3,0(0)	Load variable (null)
131:     ST  3,-4(1)	Push left side 
132:     LD  3,0(0)	Load variable (null)
* EXPRESSION
* EXPRESSION
133:    LDC  3,1(6)	Load integer constant 
134:     ST  3,-4(1)	Push left side 
* EXPRESSION
135:    LDC  3,0(6)	Load integer constant 
* OP  and
136:     LD  4,-4(1)	Pop left into ac1 
137:    AND  3,4,3	Op & 
* Param 
138:     ST  3,-4(1)	Push parameter 
* TOFF dec: 
* Param end  outputb
139:    LDA  1,-2(1)	Ghost frame becomes new active frame 
140:    LDA  3,1(7)	Return address in ac 
141:    JMP  7,-125(7)	call outputb
142:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set: 
* EXPRESSION
* CALL  outputb
143:     ST  1,-2(1)	Store fp in ghost frame for  outputb
* TOFF dec:  -3
* TOFF dec:  -4
144:     LD  3,0(0)	Load variable (null)
145:     ST  3,-4(1)	Push left side 
146:     LD  3,0(0)	Load variable (null)
* EXPRESSION
* EXPRESSION
147:    LDC  3,1(6)	Load integer constant 
148:     ST  3,-4(1)	Push left side 
* EXPRESSION
149:    LDC  3,1(6)	Load integer constant 
* OP  and
150:     LD  4,-4(1)	Pop left into ac1 
151:    AND  3,4,3	Op & 
* Param 
152:     ST  3,-4(1)	Push parameter 
* TOFF dec: 
* Param end  outputb
153:    LDA  1,-2(1)	Ghost frame becomes new active frame 
154:    LDA  3,1(7)	Return address in ac 
155:    JMP  7,-139(7)	call outputb
156:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set: 
* EXPRESSION
* CALL  outnl
157:     ST  1,-2(1)	Store fp in ghost frame for  outnl
* TOFF dec:  -3
* TOFF dec:  -4
* Param end  outnl
158:    LDA  1,-2(1)	Ghost frame becomes new active frame 
159:    LDA  3,1(7)	Return address in ac 
160:    JMP  7,-127(7)	call outnl
161:    LDA  3,0(2)	save the result in ac 
* Call end  outnl
* TOFF set: 
* EXPRESSION
* CALL  outputb
162:     ST  1,-2(1)	Store fp in ghost frame for  outputb
* TOFF dec:  -3
* TOFF dec:  -4
* TOFF inc:  -4
163:    LDC  3,0(6)	Load integer constant 
* EXPRESSION
* EXPRESSION
164:    LDC  3,0(6)	Load integer constant 
165:     ST  3,-4(1)	Push left side 
* OP  not
166:    LDC  4,1(6)	Load 1 
167:    XOR  3,3,4	Logical not 
* Param 
168:     ST  3,-4(1)	Push parameter 
* TOFF dec: 
* Param end  outputb
169:    LDA  1,-2(1)	Ghost frame becomes new active frame 
170:    LDA  3,1(7)	Return address in ac 
171:    JMP  7,-155(7)	call outputb
172:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set: 
* EXPRESSION
* CALL  outputb
173:     ST  1,-2(1)	Store fp in ghost frame for  outputb
* TOFF dec:  -3
* TOFF dec:  -4
* TOFF inc:  -4
174:    LDC  3,1(6)	Load integer constant 
* EXPRESSION
* EXPRESSION
175:    LDC  3,1(6)	Load integer constant 
176:     ST  3,-4(1)	Push left side 
* OP  not
177:    LDC  4,1(6)	Load 1 
178:    XOR  3,3,4	Logical not 
* Param 
179:     ST  3,-4(1)	Push parameter 
* TOFF dec: 
* Param end  outputb
180:    LDA  1,-2(1)	Ghost frame becomes new active frame 
181:    LDA  3,1(7)	Return address in ac 
182:    JMP  7,-166(7)	call outputb
183:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set: 
* EXPRESSION
* CALL  outnl
184:     ST  1,-2(1)	Store fp in ghost frame for  outnl
* TOFF dec:  -3
* TOFF dec:  -4
* Param end  outnl
185:    LDA  1,-2(1)	Ghost frame becomes new active frame 
186:    LDA  3,1(7)	Return address in ac 
187:    JMP  7,-154(7)	call outnl
188:    LDA  3,0(2)	save the result in ac 
* Call end  outnl
* TOFF set: 
* END COMPOUND
* Add standard closing in case there is no return statement
189:    LDC  2,0(6)	Set return value to 0 
190:     LD  3,-1(1)	Load return address 
191:     LD  1,0(1)	Adjust frame pointer 
192:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,192(7)	Jump to init [backpatch] 
* =========================================
* INIT
193:    LDA  1,0(0)	Set first frame at end of globals 
194:     ST  1,0(1)	Store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
195:    LDA  3,1(7)	Return address in ac 
196:    JMP  7,-158(7)	Jump to main 
197:   HALT  0,0(0)	DONE! 
* END INIT
