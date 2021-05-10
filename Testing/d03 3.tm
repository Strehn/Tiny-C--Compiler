* C- version: 1.00
* by Sydney Petrehn
* Input file: d03.c-
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
* TOFF set:  -5
* Compound body
* Var
* Var
* Var
* EXPRESSION
* ASSIGN  =
 40:    LDC  3,755(6)	Load integer constant 
 41:     ST  3,-2(1)	Store variable x
* EXPRESSION
* EXPRESSION
* EXPRESSION
* ASSIGN  =
 42:    LDC  3,88(6)	Load integer constant 
 43:     ST  3,-3(1)	Store variable y
* EXPRESSION
* EXPRESSION
* EXPRESSION
* ASSIGN  =
 44:    LDC  3,3(6)	Load integer constant 
 45:     ST  3,-4(1)	Store variable z
* EXPRESSION
* EXPRESSION
* EXPRESSION
* CALL  output
 46:     ST  1,-11(1)	Store fp in ghost frame for  output
* TOFF dec:  -12
* TOFF dec:  -13
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  *
 47:     LD  4,-13(1)	Pop left into ac1 
 48:    MUL  3,4,3	Op * 
* OP  +
 49:     LD  3,-3(1)	Load variable  y
 50:     ST  3,-13(1)	Push left side 
 51:     LD  3,-2(1)	Load variable  x
 52:     ST  3,-13(1)	Push left side 
 53:     LD  4,-13(1)	Pop left into ac1 
 54:    ADD  3,4,3	Op + 
* Param  1
 55:     ST  3,-13(1)	Push parameter 
* TOFF dec:  -14
* Param end  output
 56:    LDA  1,-11(1)	Ghost frame becomes new active frame 
 57:    LDA  3,1(7)	Return address in ac 
 58:    JMP  7,-53(7)	call output
 59:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set:  -11
* EXPRESSION
* CALL  output
 60:     ST  1,-11(1)	Store fp in ghost frame for  output
* TOFF dec:  -12
* TOFF dec:  -13
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  *
 61:     LD  4,-13(1)	Pop left into ac1 
 62:    MUL  3,4,3	Op * 
* EXPRESSION
* OP  +
 63:     LD  3,-4(1)	Load variable  z
 64:     LD  4,-13(1)	Pop left into ac1 
 65:    ADD  3,4,3	Op + 
* Param  2
 66:     ST  3,-13(1)	Push parameter 
* TOFF dec:  -14
* Param end  output
 67:    LDA  1,-11(1)	Ghost frame becomes new active frame 
 68:    LDA  3,1(7)	Return address in ac 
 69:    JMP  7,-64(7)	call output
 70:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set:  -11
* EXPRESSION
* CALL  output
 71:     ST  1,-11(1)	Store fp in ghost frame for  output
* TOFF dec:  -12
* TOFF dec:  -13
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  -
 72:     LD  4,-13(1)	Pop left into ac1 
 73:    SUB  3,4,3	Op - 
* EXPRESSION
* OP  -
 74:     LD  4,-13(1)	Pop left into ac1 
 75:    SUB  3,4,3	Op - 
* Param  3
 76:     ST  3,-13(1)	Push parameter 
* TOFF dec:  -14
* Param end  output
 77:    LDA  1,-11(1)	Ghost frame becomes new active frame 
 78:    LDA  3,1(7)	Return address in ac 
 79:    JMP  7,-74(7)	call output
 80:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set:  -11
* EXPRESSION
* CALL  output
 81:     ST  1,-11(1)	Store fp in ghost frame for  output
* TOFF dec:  -12
* TOFF dec:  -13
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  /
 82:     LD  4,-13(1)	Pop left into ac1 
 83:    DIV  3,4,3	Op / 
* EXPRESSION
* OP  /
 84:     LD  4,-13(1)	Pop left into ac1 
 85:    DIV  3,4,3	Op / 
* Param  4
 86:     ST  3,-13(1)	Push parameter 
* TOFF dec:  -14
* Param end  output
 87:    LDA  1,-11(1)	Ghost frame becomes new active frame 
 88:    LDA  3,1(7)	Return address in ac 
 89:    JMP  7,-84(7)	call output
 90:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set:  -11
* EXPRESSION
* CALL  output
 91:     ST  1,-11(1)	Store fp in ghost frame for  output
* TOFF dec:  -12
* TOFF dec:  -13
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  *
 92:     LD  4,-13(1)	Pop left into ac1 
 93:    MUL  3,4,3	Op * 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  *
 94:     LD  4,-13(1)	Pop left into ac1 
 95:    MUL  3,4,3	Op * 
* OP  +
 96:     LD  3,-4(1)	Load variable  z
 97:     ST  3,-13(1)	Push left side 
 98:     LD  4,-13(1)	Pop left into ac1 
 99:    ADD  3,4,3	Op + 
* Param  5
100:     ST  3,-13(1)	Push parameter 
* TOFF dec:  -14
* Param end  output
101:    LDA  1,-11(1)	Ghost frame becomes new active frame 
102:    LDA  3,1(7)	Return address in ac 
103:    JMP  7,-98(7)	call output
104:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set:  -11
* EXPRESSION
* CALL  output
105:     ST  1,-11(1)	Store fp in ghost frame for  output
* TOFF dec:  -12
* TOFF dec:  -13
* EXPRESSION
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  %
106:     LD  4,-13(1)	Pop left into ac1 
107:    MOD  3,4,3	Op % 
* EXPRESSION
* OP  %
108:     LD  4,-13(1)	Pop left into ac1 
109:    MOD  3,4,3	Op % 
* Param  6
110:     ST  3,-13(1)	Push parameter 
* TOFF dec:  -14
* Param end  output
111:    LDA  1,-11(1)	Ghost frame becomes new active frame 
112:    LDA  3,1(7)	Return address in ac 
113:    JMP  7,-108(7)	call output
114:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set:  -11
* EXPRESSION
* CALL  output
115:     ST  1,-11(1)	Store fp in ghost frame for  output
* TOFF dec:  -12
* TOFF dec:  -13
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  chsign
116:    NEG  3,3,3	Op Unary - 
* EXPRESSION
* EXPRESSION
* EXPRESSION
* OP  *
117:     LD  4,-13(1)	Pop left into ac1 
118:    MUL  3,4,3	Op * 
* OP  +
119:     LD  3,-3(1)	Load variable  y
120:     ST  3,-13(1)	Push left side 
121:     LD  4,-13(1)	Pop left into ac1 
122:    ADD  3,4,3	Op + 
* Param  7
123:     ST  3,-13(1)	Push parameter 
* TOFF dec:  -14
* Param end  output
124:    LDA  1,-11(1)	Ghost frame becomes new active frame 
125:    LDA  3,1(7)	Return address in ac 
126:    JMP  7,-121(7)	call output
127:    LDA  3,0(2)	save the result in ac 
* Call end  output
* TOFF set:  -11
* EXPRESSION
* CALL  outnl
128:     ST  1,-11(1)	Store fp in ghost frame for  outnl
* TOFF dec:  -12
* TOFF dec:  -13
* Param end  outnl
129:    LDA  1,-11(1)	Ghost frame becomes new active frame 
130:    LDA  3,1(7)	Return address in ac 
131:    JMP  7,-98(7)	call outnl
132:    LDA  3,0(2)	save the result in ac 
* Call end  outnl
* TOFF set:  -11
* END COMPOUND
* Add standard closing in case there is no return statement
133:    LDC  2,0(6)	Set return value to 0 
134:     LD  3,-1(1)	Load return address 
135:     LD  1,0(1)	Adjust frame pointer 
136:    JMP  7,0(3)	Return 
* END FUNCTION main
  0:    JMP  7,136(7)	Jump to init [backpatch] 
* =========================================
* INIT
137:    LDA  1,0(0)	Set first frame at end of globals 
138:     ST  1,0(1)	Store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
139:    LDA  3,1(7)	Return address in ac 
140:    JMP  7,-102(7)	Jump to main 
141:   HALT  0,0(0)	DONE! 
* END INIT
