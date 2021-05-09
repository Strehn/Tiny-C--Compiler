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
* EXPRESSION
* EXPRESSION
 41:    LDC  3,0(6)	Load integer constant 
 42:     ST  3,-4(1)	Push left side 
* EXPRESSION
 43:    LDC  3,0(6)	Load integer constant 
* OP  or
 44:     LD  4,-4(1)	Pop left into ac1 
 45:     OR  3,4,3	Op | 
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
 52:    LDC  3,0(6)	Load integer constant 
 53:     ST  3,-4(1)	Push left side 
* EXPRESSION
 54:    LDC  3,1(6)	Load integer constant 
* OP  or
 55:     LD  4,-4(1)	Pop left into ac1 
 56:     OR  3,4,3	Op | 
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
 65:    LDC  3,0(6)	Load integer constant 
* OP  or
 66:     LD  4,-4(1)	Pop left into ac1 
 67:     OR  3,4,3	Op | 
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
 76:    LDC  3,1(6)	Load integer constant 
* OP  or
 77:     LD  4,-4(1)	Pop left into ac1 
 78:     OR  3,4,3	Op | 
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
* CALL  outnl
 84:     ST  1,-2(1)	Store fp in ghost frame for  outnl
* TOFF dec:  -3
* TOFF dec:  -4
* Param end  outnl
 85:    LDA  1,-2(1)	Ghost frame becomes new active frame 
 86:    LDA  3,1(7)	Return address in ac 
 87:    JMP  7,-54(7)	call outnl
 88:    LDA  3,0(2)	save the result in ac 
* Call end  outnl
* TOFF set:  -2
* EXPRESSION
* CALL  outputb
 89:     ST  1,-2(1)	Store fp in ghost frame for  outputb
* TOFF dec:  -3
* TOFF dec:  -4
* EXPRESSION
* EXPRESSION
 90:    LDC  3,0(6)	Load integer constant 
 91:     ST  3,-4(1)	Push left side 
* EXPRESSION
 92:    LDC  3,0(6)	Load integer constant 
* OP  and
 93:     LD  4,-4(1)	Pop left into ac1 
 94:    AND  3,4,3	Op & 
* Param  5
 95:     ST  3,-4(1)	Push parameter 
* TOFF dec:  -5
* Param end  outputb
 96:    LDA  1,-2(1)	Ghost frame becomes new active frame 
 97:    LDA  3,1(7)	Return address in ac 
 98:    JMP  7,-82(7)	call outputb
 99:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set:  -2
* EXPRESSION
* CALL  outputb
100:     ST  1,-2(1)	Store fp in ghost frame for  outputb
* TOFF dec:  -3
* TOFF dec:  -4
* EXPRESSION
* EXPRESSION
101:    LDC  3,0(6)	Load integer constant 
102:     ST  3,-4(1)	Push left side 
* EXPRESSION
103:    LDC  3,1(6)	Load integer constant 
* OP  and
104:     LD  4,-4(1)	Pop left into ac1 
105:    AND  3,4,3	Op & 
* Param  6
106:     ST  3,-4(1)	Push parameter 
* TOFF dec:  -5
* Param end  outputb
107:    LDA  1,-2(1)	Ghost frame becomes new active frame 
108:    LDA  3,1(7)	Return address in ac 
109:    JMP  7,-93(7)	call outputb
110:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set:  -2
* EXPRESSION
* CALL  outputb
111:     ST  1,-2(1)	Store fp in ghost frame for  outputb
* TOFF dec:  -3
* TOFF dec:  -4
* EXPRESSION
* EXPRESSION
112:    LDC  3,1(6)	Load integer constant 
113:     ST  3,-4(1)	Push left side 
* EXPRESSION
114:    LDC  3,0(6)	Load integer constant 
* OP  and
115:     LD  4,-4(1)	Pop left into ac1 
116:    AND  3,4,3	Op & 
* Param  7
117:     ST  3,-4(1)	Push parameter 
* TOFF dec:  -5
* Param end  outputb
118:    LDA  1,-2(1)	Ghost frame becomes new active frame 
119:    LDA  3,1(7)	Return address in ac 
120:    JMP  7,-104(7)	call outputb
121:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set:  -2
* EXPRESSION
* CALL  outputb
122:     ST  1,-2(1)	Store fp in ghost frame for  outputb
* TOFF dec:  -3
* TOFF dec:  -4
* EXPRESSION
* EXPRESSION
123:    LDC  3,1(6)	Load integer constant 
124:     ST  3,-4(1)	Push left side 
* EXPRESSION
125:    LDC  3,1(6)	Load integer constant 
* OP  and
126:     LD  4,-4(1)	Pop left into ac1 
127:    AND  3,4,3	Op & 
* Param  8
128:     ST  3,-4(1)	Push parameter 
* TOFF dec:  -5
* Param end  outputb
129:    LDA  1,-2(1)	Ghost frame becomes new active frame 
130:    LDA  3,1(7)	Return address in ac 
131:    JMP  7,-115(7)	call outputb
132:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set:  -2
* EXPRESSION
* CALL  outnl
133:     ST  1,-2(1)	Store fp in ghost frame for  outnl
* TOFF dec:  -3
* TOFF dec:  -4
* Param end  outnl
134:    LDA  1,-2(1)	Ghost frame becomes new active frame 
135:    LDA  3,1(7)	Return address in ac 
136:    JMP  7,-103(7)	call outnl
137:    LDA  3,0(2)	save the result in ac 
* Call end  outnl
* TOFF set:  -2
* EXPRESSION
* CALL  outputb
138:     ST  1,-2(1)	Store fp in ghost frame for  outputb
* TOFF dec:  -3
* TOFF dec:  -4
* TOFF inc:  -4
139:    LDC  3,0(6)	Load integer constant 
* EXPRESSION
* EXPRESSION
140:    LDC  3,0(6)	Load integer constant 
141:     ST  3,-4(1)	Push left side 
* OP  not
142:    LDC  4,1(6)	Load 1 
143:    XOR  3,3,4	Logical not 
* Param  9
144:     ST  3,-4(1)	Push parameter 
* TOFF dec:  -5
* Param end  outputb
145:    LDA  1,-2(1)	Ghost frame becomes new active frame 
146:    LDA  3,1(7)	Return address in ac 
147:    JMP  7,-131(7)	call outputb
148:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set:  -2
* EXPRESSION
* CALL  outputb
149:     ST  1,-2(1)	Store fp in ghost frame for  outputb
* TOFF dec:  -3
* TOFF dec:  -4
* TOFF inc:  -4
150:    LDC  3,1(6)	Load integer constant 
* EXPRESSION
* EXPRESSION
151:    LDC  3,1(6)	Load integer constant 
152:     ST  3,-4(1)	Push left side 
* OP  not
153:    LDC  4,1(6)	Load 1 
154:    XOR  3,3,4	Logical not 
* Param  10
155:     ST  3,-4(1)	Push parameter 
* TOFF dec:  -5
* Param end  outputb
156:    LDA  1,-2(1)	Ghost frame becomes new active frame 
157:    LDA  3,1(7)	Return address in ac 
158:    JMP  7,-142(7)	call outputb
159:    LDA  3,0(2)	save the result in ac 
* Call end  outputb
* TOFF set:  -2
* EXPRESSION
* CALL  outnl
160:     ST  1,-2(1)	Store fp in ghost frame for  outnl
* TOFF dec:  -3
* TOFF dec:  -4
* Param end  outnl
161:    LDA  1,-2(1)	Ghost frame becomes new active frame 
162:    LDA  3,1(7)	Return address in ac 
163:    JMP  7,-130(7)	call outnl
164:    LDA  3,0(2)	save the result in ac 
* Call end  outnl
* TOFF set:  -2
* END COMPOUND
* Add standard closing in case there is no return statement
165:    LDC  2,0(6)	Set return value to 0 
166:     LD  3,-1(1)	Load return address 
167:     LD  1,0(1)	Adjust frame pointer 
168:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,168(7)	Jump to init [backpatch] 
* =========================================
* INIT
169:    LDA  1,0(0)	Set first frame at end of globals 
170:     ST  1,0(1)	Store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
171:    LDA  3,1(7)	Return address in ac 
172:    JMP  7,-134(7)	Jump to main 
173:   HALT  0,0(0)	DONE! 
* END INIT
