//
//  ourgetopt.hpp
//  
//
//  Created by Sydney Petrehn on 2/15/21.
//

#ifndef ourgetopt_hpp
#define ourgetopt_hpp

#include <stdio.h>

int ourGetopt( int, char **, char*);

extern char *optarg;                   /* option argument if : in opts */
extern int optind;                     /* next argv index              */
extern int optopt;                     /* last option (export dubious) */

#endif /* ourgetopt_hpp */
