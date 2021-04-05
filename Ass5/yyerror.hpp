//
//  yyerror.hpp
//  
//
//  Created by Sydney Petrehn on 3/31/21.
//

#ifndef yyerror_hpp
#define yyerror_hpp

#include <stdio.h>
// write a nice error message
#define YYERROR_VERBOSE

// NOTE: make sure these variables interface with your code!!!
extern int line;        // line number of last token scanned in your scanner (.l)
extern char *lastToken; // last token scanned in your scanner (connect to your .l)
extern int n_errors;   // number of errors

void initErrorProcessing();    // WARNING: MUST be called before any errors occur (near top of main)!
void yyerror(const char *); // error routine called by Bison


#endif /* yyerror_hpp */
