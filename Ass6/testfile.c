main()
{
        * a, b;
        int x : +;
 int x : while ;
 int x : while true for ;
 int fred(int y) +;
 x[*];
 while ] ;
 if while then 666;
 if while then 666 else 777;
 if * x then 666;
 if * x then 666 else 777;
 if bool then 666;
 if * x else 666;
 if bool else 666;
 if then 666;
 if then 666; else if true then 222;
 for = do 666;
 true  and  ;
 true  or  ;
 not for  ;
 { * } ;
 } ;  // be sure to catch this

 while 3+ do 777;
 while do 88;
 while;
 while then;
 while and or not for;
 if while and or not for;
 return int ;
 break 5;
}

// error varDeclList ';'                              { $$ = NULL; yyerrok; printf("ERR4\n"); } 
// varDeclId ':' error                                { $$ = NULL; printf("ERR8\n"); }          
// typeSpec ID '(' parms ')' error                    { $$ = NULL; printf("ERR13\n"); }         
// error ']'                                          {yyerrok; $$ = NULL; printf("ERR21\n"); } 
// '{' error stmtList '}'                             { $$ = NULL; yyerrok; printf("ERR22\n"); }
// '{' localDecls error '}'                           { $$ = NULL; yyerrok; printf("ERR23\n"); }
// IF error THEN matched ELSE matched                 { $$ = NULL; yyerrok; printf("ERR26\n"); }
// WHILE error DO matched                             { $$ = NULL; yyerrok; printf("ERR27\n"); }
// FOR error DO matched                               { $$ = NULL; yyerrok; printf("ERR29\n"); }
// IF error ELSE unmatched                            { $$ = NULL; yyerrok; printf("ERR32\n"); }
// WHILE error DO unmatched                           { $$ = NULL; yyerrok; printf("ERR34\n"); }
// FOR error DO unmatched                             { $$ = NULL; yyerrok; printf("ERR35\n"); }


