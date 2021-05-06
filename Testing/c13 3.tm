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
* TOFF set: 
 39:     ST  3,-1(1)	store return address 
* COMPOUND
* TOFF set: 
* Compound body
* Var
* Var
* EXPRESSION
* ASSIGN  =
 40:    LDC  3,5(6)	Load integer constant 
 41:     ST  3,-303(1)	Store variable z
* EXPRESSION
* EXPRESSION
* EXPRESSION
* ASSIGN  =
 42:    LDC  3,73(6)	Load integer constant 
 43:     ST  3,0(1)	Store variable (null)
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  (null)
* EXPRESSION
* EXPRESSION
* CALL  output
 44:     ST  1,-3(1)	Store fp in ghost frame for  output
* TOFF dec: 
* TOFF dec: 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  (null)
* Param 
 45:     ST  3,-5(1)	Push parameter 
* TOFF dec: 
* Param end  output
 46:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 47:    LDA  3,1(7)	Return address in ac 
 48:    JMP  7,-43(7)	call output
 49:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set: 
* EXPRESSION
* CALL  outnl
 50:     ST  1,-3(1)	Store fp in ghost frame for  outnl
* TOFF dec: 
* TOFF dec: 
* Param end  outnl
 51:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 52:    LDA  3,1(7)	Return address in ac 
 53:    JMP  7,-20(7)	call outnl
 54:    LDA  3,0(2)	save the result in ac 
* Call end  outnl
* TOFF set: 
* EXPRESSION
* ASSIGN  =
 55:    LDC  3,5(6)	Load integer constant 
 56:     ST  3,-303(1)	Store variable z
* EXPRESSION
* EXPRESSION
* EXPRESSION
* ASSIGN  =
 57:    LDC  3,17(6)	Load integer constant 
 58:     ST  3,0(1)	Store variable (null)
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  (null)
* EXPRESSION
* EXPRESSION
* ASSIGN  =
 59:    LDC  3,17(6)	Load integer constant 
 60:     ST  3,-303(1)	Store variable z
* EXPRESSION
* EXPRESSION
* EXPRESSION
* ASSIGN  =
 61:    LDC  3,5(6)	Load integer constant 
 62:     ST  3,0(1)	Store variable (null)
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  (null)
* EXPRESSION
* EXPRESSION
* CALL  output
 63:     ST  1,-3(1)	Store fp in ghost frame for  output
* TOFF dec: 
* TOFF dec: 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  (null)
* Param 
 64:     ST  3,-5(1)	Push parameter 
* TOFF dec: 
* Param end  output
 65:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 66:    LDA  3,1(7)	Return address in ac 
 67:    JMP  7,-62(7)	call output
 68:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set: 
* EXPRESSION
* CALL  outnl
 69:     ST  1,-3(1)	Store fp in ghost frame for  outnl
* TOFF dec: 
* TOFF dec: 
* Param end  outnl
 70:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 71:    LDA  3,1(7)	Return address in ac 
 72:    JMP  7,-39(7)	call outnl
 73:    LDA  3,0(2)	save the result in ac 
* Call end  outnl
* TOFF set: 
* EXPRESSION
* CALL  output
 74:     ST  1,-3(1)	Store fp in ghost frame for  output
* TOFF dec: 
* TOFF dec: 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  (null)
* OP  (null)
* Param 
 75:     ST  3,-5(1)	Push parameter 
* TOFF dec: 
* Param end  output
 76:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 77:    LDA  3,1(7)	Return address in ac 
 78:    JMP  7,-73(7)	call output
 79:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set: 
* EXPRESSION
* CALL  outnl
 80:     ST  1,-3(1)	Store fp in ghost frame for  outnl
* TOFF dec: 
* TOFF dec: 
* Param end  outnl
 81:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 82:    LDA  3,1(7)	Return address in ac 
 83:    JMP  7,-50(7)	call outnl
 84:    LDA  3,0(2)	save the result in ac 
* Call end  outnl
* TOFF set: 
* EXPRESSION
* CALL  output
 85:     ST  1,-3(1)	Store fp in ghost frame for  output
* TOFF dec: 
* TOFF dec: 
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
 86:     ST  3,-5(1)	Push parameter 
* TOFF dec: 
* Param end  output
 87:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 88:    LDA  3,1(7)	Return address in ac 
 89:    JMP  7,-84(7)	call output
 90:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set: 
* EXPRESSION
* CALL  outnl
 91:     ST  1,-3(1)	Store fp in ghost frame for  outnl
* TOFF dec: 
* TOFF dec: 
* Param end  outnl
 92:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 93:    LDA  3,1(7)	Return address in ac 
 94:    JMP  7,-61(7)	call outnl
 95:    LDA  3,0(2)	save the result in ac 
* Call end  outnl
* TOFF set: 
* EXPRESSION
* CALL  output
 96:     ST  1,-3(1)	Store fp in ghost frame for  output
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
* OP  (null)
* OP  (null)
* OP  (null)
* OP  (null)
* Param 
 97:     ST  3,-5(1)	Push parameter 
* TOFF dec: 
* Param end  output
 98:    LDA  1,-3(1)	Ghost frame becomes new active frame 
 99:    LDA  3,1(7)	Return address in ac 
100:    JMP  7,-95(7)	call output
101:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set: 
* EXPRESSION
* CALL  outnl
102:     ST  1,-3(1)	Store fp in ghost frame for  outnl
* TOFF dec: 
* TOFF dec: 
* Param end  outnl
103:    LDA  1,-3(1)	Ghost frame becomes new active frame 
104:    LDA  3,1(7)	Return address in ac 
105:    JMP  7,-72(7)	call outnl
106:    LDA  3,0(2)	save the result in ac 
* Call end  outnl
* TOFF set: 
* EXPRESSION
* CALL  output
107:     ST  1,-3(1)	Store fp in ghost frame for  output
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
* OP  (null)
* OP  (null)
* OP  (null)
* OP  (null)
* OP  (null)
* Param 
108:     ST  3,-5(1)	Push parameter 
* TOFF dec: 
* Param end  output
109:    LDA  1,-3(1)	Ghost frame becomes new active frame 
110:    LDA  3,1(7)	Return address in ac 
111:    JMP  7,-106(7)	call output
112:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set: 
* EXPRESSION
* CALL  outnl
113:     ST  1,-3(1)	Store fp in ghost frame for  outnl
* TOFF dec: 
* TOFF dec: 
* Param end  outnl
114:    LDA  1,-3(1)	Ghost frame becomes new active frame 
115:    LDA  3,1(7)	Return address in ac 
116:    JMP  7,-83(7)	call outnl
117:    LDA  3,0(2)	save the result in ac 
* Call end  outnl
* TOFF set: 
* EXPRESSION
* CALL  output
118:     ST  1,-3(1)	Store fp in ghost frame for  output
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
* OP  (null)
* OP  (null)
* OP  (null)
* OP  (null)
* OP  (null)
* OP  (null)
* Param 
119:     ST  3,-5(1)	Push parameter 
* TOFF dec: 
* Param end  output
120:    LDA  1,-3(1)	Ghost frame becomes new active frame 
121:    LDA  3,1(7)	Return address in ac 
122:    JMP  7,-117(7)	call output
123:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set: 
* EXPRESSION
* CALL  outnl
124:     ST  1,-3(1)	Store fp in ghost frame for  outnl
* TOFF dec: 
* TOFF dec: 
* Param end  outnl
125:    LDA  1,-3(1)	Ghost frame becomes new active frame 
126:    LDA  3,1(7)	Return address in ac 
127:    JMP  7,-94(7)	call outnl
128:    LDA  3,0(2)	save the result in ac 
* Call end  outnl
* TOFF set: 
* EXPRESSION
* CALL  output
129:     ST  1,-3(1)	Store fp in ghost frame for  output
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
* OP  (null)
* OP  (null)
* OP  (null)
* OP  (null)
* OP  (null)
* OP  (null)
* OP  (null)
* Param 
130:     ST  3,-5(1)	Push parameter 
* TOFF dec: 
* Param end  output
131:    LDA  1,-3(1)	Ghost frame becomes new active frame 
132:    LDA  3,1(7)	Return address in ac 
133:    JMP  7,-128(7)	call output
134:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set: 
* EXPRESSION
* CALL  outnl
135:     ST  1,-3(1)	Store fp in ghost frame for  outnl
* TOFF dec: 
* TOFF dec: 
* Param end  outnl
136:    LDA  1,-3(1)	Ghost frame becomes new active frame 
137:    LDA  3,1(7)	Return address in ac 
138:    JMP  7,-105(7)	call outnl
139:    LDA  3,0(2)	save the result in ac 
* Call end  outnl
* TOFF set: 
* EXPRESSION
* CALL  output
140:     ST  1,-3(1)	Store fp in ghost frame for  output
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
141:     ST  3,-5(1)	Push parameter 
* TOFF dec: 
* Param end  output
142:    LDA  1,-3(1)	Ghost frame becomes new active frame 
143:    LDA  3,1(7)	Return address in ac 
144:    JMP  7,-139(7)	call output
145:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set: 
* EXPRESSION
* CALL  outnl
146:     ST  1,-3(1)	Store fp in ghost frame for  outnl
* TOFF dec: 
* TOFF dec: 
* Param end  outnl
147:    LDA  1,-3(1)	Ghost frame becomes new active frame 
148:    LDA  3,1(7)	Return address in ac 
149:    JMP  7,-116(7)	call outnl
150:    LDA  3,0(2)	save the result in ac 
* Call end  outnl
* TOFF set: 
* EXPRESSION
* CALL  output
151:     ST  1,-3(1)	Store fp in ghost frame for  output
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
152:     ST  3,-5(1)	Push parameter 
* TOFF dec: 
* Param end  output
153:    LDA  1,-3(1)	Ghost frame becomes new active frame 
154:    LDA  3,1(7)	Return address in ac 
155:    JMP  7,-150(7)	call output
156:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set: 
* EXPRESSION
* CALL  outnl
157:     ST  1,-3(1)	Store fp in ghost frame for  outnl
* TOFF dec: 
* TOFF dec: 
* Param end  outnl
158:    LDA  1,-3(1)	Ghost frame becomes new active frame 
159:    LDA  3,1(7)	Return address in ac 
160:    JMP  7,-127(7)	call outnl
161:    LDA  3,0(2)	save the result in ac 
* Call end  outnl
* TOFF set: 
* EXPRESSION
* CALL  output
162:     ST  1,-3(1)	Store fp in ghost frame for  output
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
163:     ST  3,-5(1)	Push parameter 
* TOFF dec: 
* Param end  output
164:    LDA  1,-3(1)	Ghost frame becomes new active frame 
165:    LDA  3,1(7)	Return address in ac 
166:    JMP  7,-161(7)	call output
167:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set: 
* EXPRESSION
* CALL  outnl
168:     ST  1,-3(1)	Store fp in ghost frame for  outnl
* TOFF dec: 
* TOFF dec: 
* Param end  outnl
169:    LDA  1,-3(1)	Ghost frame becomes new active frame 
170:    LDA  3,1(7)	Return address in ac 
171:    JMP  7,-138(7)	call outnl
172:    LDA  3,0(2)	save the result in ac 
* Call end  outnl
* TOFF set: 
* END COMPOUND
* Add standard closing in case there is no return statement
173:    LDC  2,0(6)	Set return value to 0 
174:     LD  3,-1(1)	Load return address 
175:     LD  1,0(1)	Adjust frame pointer 
176:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,176(7)	Jump to init [backpatch] 
* =========================================
* INIT
177:    LDA  1,298(0)	Set first frame at end of globals 
178:     ST  1,0(1)	Store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
179:    LDA  3,1(7)	Return address in ac 
180:    JMP  7,-142(7)	Jump to main 
181:   HALT  0,0(0)	DONE! 
* END INIT
