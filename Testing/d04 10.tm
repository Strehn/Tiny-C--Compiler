* C- version: 1.00
* by Sydney Petrehn
* Input file: d04.c-
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
* TOFF set:  -7
* Compound body
* Var
* Var
* Var
* EXPRESSION
* ASSIGN  =
 40:    LDC  3,1(6)	Load integer constant 
 41:     ST  3,-2(1)	Store variable x
* EXPRESSION
* EXPRESSION
* EXPRESSION
* ASSIGN  =
 42:    LDC  3,0(6)	Load integer constant 
 43:     ST  3,-3(1)	Store variable y
* EXPRESSION
* EXPRESSION
* EXPRESSION
* ASSIGN  =
 44:    LDC  3,1(6)	Load integer constant 
 45:     ST  3,-4(1)	Store variable z
* EXPRESSION
* EXPRESSION
* EXPRESSION
* CALL  outputb
 46:     ST  1,-13(1)	Store fp in ghost frame for  outputb
* TOFF dec:  -14
* TOFF dec:  -15
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  and
 47:     LD  4,-15(1)	Pop left into ac1 
 48:    AND  3,4,3	Op & 
* OP  or
 49:     LD  4,-15(1)	Pop left into ac1 
 50:     OR  3,4,3	Op | 
* Param  1
 51:     ST  3,-15(1)	Push parameter 
* TOFF dec:  -16
* Param end  outputb
 52:    LDA  1,-13(1)	Ghost frame becomes new active frame 
 53:    LDA  3,1(7)	Return address in ac 
 54:    JMP  7,-38(7)	call outputb
 55:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set:  -13
* EXPRESSION
* CALL  outputb
 56:     ST  1,-13(1)	Store fp in ghost frame for  outputb
* TOFF dec:  -14
* TOFF dec:  -15
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  and
 57:     LD  4,-15(1)	Pop left into ac1 
 58:    AND  3,4,3	Op & 
* EXPRESSION
* OP  or
 59:     LD  4,-15(1)	Pop left into ac1 
 60:     OR  3,4,3	Op | 
* Param  2
 61:     ST  3,-15(1)	Push parameter 
* TOFF dec:  -16
* Param end  outputb
 62:    LDA  1,-13(1)	Ghost frame becomes new active frame 
 63:    LDA  3,1(7)	Return address in ac 
 64:    JMP  7,-48(7)	call outputb
 65:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set:  -13
* EXPRESSION
* CALL  outputb
 66:     ST  1,-13(1)	Store fp in ghost frame for  outputb
* TOFF dec:  -14
* TOFF dec:  -15
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  and
 67:     LD  4,-15(1)	Pop left into ac1 
 68:    AND  3,4,3	Op & 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  and
 69:     LD  4,-15(1)	Pop left into ac1 
 70:    AND  3,4,3	Op & 
* OP  or
 71:     LD  4,-15(1)	Pop left into ac1 
 72:     OR  3,4,3	Op | 
* Param  3
 73:     ST  3,-15(1)	Push parameter 
* TOFF dec:  -16
* Param end  outputb
 74:    LDA  1,-13(1)	Ghost frame becomes new active frame 
 75:    LDA  3,1(7)	Return address in ac 
 76:    JMP  7,-60(7)	call outputb
 77:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set:  -13
* EXPRESSION
* CALL  outputb
 78:     ST  1,-13(1)	Store fp in ghost frame for  outputb
* TOFF dec:  -14
* TOFF dec:  -15
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  not
 79:    LDC  4,1(6)	Load 1 
 80:    XOR  3,3,4	Logical not 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  and
 81:     LD  4,-15(1)	Pop left into ac1 
 82:    AND  3,4,3	Op & 
* OP  or
 83:     LD  4,-15(1)	Pop left into ac1 
 84:     OR  3,4,3	Op | 
* Param  4
 85:     ST  3,-15(1)	Push parameter 
* TOFF dec:  -16
* Param end  outputb
 86:    LDA  1,-13(1)	Ghost frame becomes new active frame 
 87:    LDA  3,1(7)	Return address in ac 
 88:    JMP  7,-72(7)	call outputb
 89:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set:  -13
* EXPRESSION
* CALL  outputb
 90:     ST  1,-13(1)	Store fp in ghost frame for  outputb
* TOFF dec:  -14
* TOFF dec:  -15
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  not
 91:    LDC  4,1(6)	Load 1 
 92:    XOR  3,3,4	Logical not 
* EXPRESSION
* OP  and
 93:     LD  4,-15(1)	Pop left into ac1 
 94:    AND  3,4,3	Op & 
* EXPRESSION
* OP  or
 95:     LD  4,-15(1)	Pop left into ac1 
 96:     OR  3,4,3	Op | 
* Param  5
 97:     ST  3,-15(1)	Push parameter 
* TOFF dec:  -16
* Param end  outputb
 98:    LDA  1,-13(1)	Ghost frame becomes new active frame 
 99:    LDA  3,1(7)	Return address in ac 
100:    JMP  7,-84(7)	call outputb
101:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set:  -13
* EXPRESSION
* CALL  outnl
102:     ST  1,-13(1)	Store fp in ghost frame for  outnl
* TOFF dec:  -14
* TOFF dec:  -15
* Param end  outnl
103:    LDA  1,-13(1)	Ghost frame becomes new active frame 
104:    LDA  3,1(7)	Return address in ac 
105:    JMP  7,-72(7)	call outnl
106:    LDA  3,0(2)	save the result in ac 
* Call end  outnl
* TOFF set:  -13
* EXPRESSION
* ASSIGN  =
107:    LDC  3,1(6)	Load integer constant 
108:     ST  3,-2(1)	Store variable x
* EXPRESSION
* EXPRESSION
* EXPRESSION
* ASSIGN  =
109:    LDC  3,1(6)	Load integer constant 
110:     ST  3,-3(1)	Store variable y
* EXPRESSION
* EXPRESSION
* EXPRESSION
* ASSIGN  =
111:    LDC  3,0(6)	Load integer constant 
112:     ST  3,-4(1)	Store variable z
* EXPRESSION
* EXPRESSION
* EXPRESSION
* CALL  outputb
113:     ST  1,-16(1)	Store fp in ghost frame for  outputb
* TOFF dec:  -17
* TOFF dec:  -18
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  and
114:     LD  4,-18(1)	Pop left into ac1 
115:    AND  3,4,3	Op & 
* OP  or
116:     LD  4,-18(1)	Pop left into ac1 
117:     OR  3,4,3	Op | 
* Param  6
118:     ST  3,-18(1)	Push parameter 
* TOFF dec:  -19
* Param end  outputb
119:    LDA  1,-16(1)	Ghost frame becomes new active frame 
120:    LDA  3,1(7)	Return address in ac 
121:    JMP  7,-105(7)	call outputb
122:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set:  -16
* EXPRESSION
* CALL  outputb
123:     ST  1,-16(1)	Store fp in ghost frame for  outputb
* TOFF dec:  -17
* TOFF dec:  -18
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  and
124:     LD  4,-18(1)	Pop left into ac1 
125:    AND  3,4,3	Op & 
* EXPRESSION
* OP  or
126:     LD  4,-18(1)	Pop left into ac1 
127:     OR  3,4,3	Op | 
* Param  7
128:     ST  3,-18(1)	Push parameter 
* TOFF dec:  -19
* Param end  outputb
129:    LDA  1,-16(1)	Ghost frame becomes new active frame 
130:    LDA  3,1(7)	Return address in ac 
131:    JMP  7,-115(7)	call outputb
132:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set:  -16
* EXPRESSION
* CALL  outputb
133:     ST  1,-16(1)	Store fp in ghost frame for  outputb
* TOFF dec:  -17
* TOFF dec:  -18
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  and
134:     LD  4,-18(1)	Pop left into ac1 
135:    AND  3,4,3	Op & 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  and
136:     LD  4,-18(1)	Pop left into ac1 
137:    AND  3,4,3	Op & 
* OP  or
138:     LD  4,-18(1)	Pop left into ac1 
139:     OR  3,4,3	Op | 
* Param  8
140:     ST  3,-18(1)	Push parameter 
* TOFF dec:  -19
* Param end  outputb
141:    LDA  1,-16(1)	Ghost frame becomes new active frame 
142:    LDA  3,1(7)	Return address in ac 
143:    JMP  7,-127(7)	call outputb
144:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set:  -16
* EXPRESSION
* CALL  outputb
145:     ST  1,-16(1)	Store fp in ghost frame for  outputb
* TOFF dec:  -17
* TOFF dec:  -18
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  not
146:    LDC  4,1(6)	Load 1 
147:    XOR  3,3,4	Logical not 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  and
148:     LD  4,-18(1)	Pop left into ac1 
149:    AND  3,4,3	Op & 
* OP  or
150:     LD  4,-18(1)	Pop left into ac1 
151:     OR  3,4,3	Op | 
* Param  9
152:     ST  3,-18(1)	Push parameter 
* TOFF dec:  -19
* Param end  outputb
153:    LDA  1,-16(1)	Ghost frame becomes new active frame 
154:    LDA  3,1(7)	Return address in ac 
155:    JMP  7,-139(7)	call outputb
156:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set:  -16
* EXPRESSION
* CALL  outputb
157:     ST  1,-16(1)	Store fp in ghost frame for  outputb
* TOFF dec:  -17
* TOFF dec:  -18
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  not
158:    LDC  4,1(6)	Load 1 
159:    XOR  3,3,4	Logical not 
* EXPRESSION
* OP  and
160:     LD  4,-18(1)	Pop left into ac1 
161:    AND  3,4,3	Op & 
* EXPRESSION
* OP  or
162:     LD  4,-18(1)	Pop left into ac1 
163:     OR  3,4,3	Op | 
* Param  10
164:     ST  3,-18(1)	Push parameter 
* TOFF dec:  -19
* Param end  outputb
165:    LDA  1,-16(1)	Ghost frame becomes new active frame 
166:    LDA  3,1(7)	Return address in ac 
167:    JMP  7,-151(7)	call outputb
168:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set:  -16
* EXPRESSION
* CALL  outnl
169:     ST  1,-16(1)	Store fp in ghost frame for  outnl
* TOFF dec:  -17
* TOFF dec:  -18
* Param end  outnl
170:    LDA  1,-16(1)	Ghost frame becomes new active frame 
171:    LDA  3,1(7)	Return address in ac 
172:    JMP  7,-139(7)	call outnl
173:    LDA  3,0(2)	save the result in ac 
* Call end  outnl
* TOFF set:  -16
* END COMPOUND
* Add standard closing in case there is no return statement
174:    LDC  2,0(6)	Set return value to 0 
175:     LD  3,-1(1)	Load return address 
176:     LD  1,0(1)	Adjust frame pointer 
177:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,177(7)	Jump to init [backpatch] 
* =========================================
* INIT
178:    LDA  1,0(0)	Set first frame at end of globals 
179:     ST  1,0(1)	Store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
180:    LDA  3,1(7)	Return address in ac 
181:    JMP  7,-143(7)	Jump to main 
182:   HALT  0,0(0)	DONE! 
* END INIT
