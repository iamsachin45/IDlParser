%{
#include <cstdio>
#include <cstdlib>
#include "driver.hpp"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "vector"

driver dv;

struct field_data {
    std::string datatype;
    std::string name;
};

void yyerror(const char *s);
int yylex();
%}

%union {
    int number;
    char* string;
}

%token <number> NUMBER
%token PLUS
%token LBRACE
%token RBRACE
%token <string> IDENTIFIER
%token STRUCT
%token SEMICOLON
%token <string> PRIMITIVETYPE
%token MINUS
%token LT
%token GT
%token AT
%token MODULE


%left PLUS

%start definition

%%

definition:
     moduleexp
     | structexp
     | field
     ;

moduleexp:
    MODULE IDENTIFIER { dv.processModuleStart($2); } LBRACE structexp RBRACE SEMICOLON
    | moduleexp MODULE IDENTIFIER { dv.processModuleStart($3); } LBRACE structexp RBRACE SEMICOLON

structexp:
    STRUCT IDENTIFIER {dv.processStructStart($2); } LBRACE field RBRACE SEMICOLON
    | definition STRUCT IDENTIFIER {dv.processStructStart($3); } LBRACE field RBRACE SEMICOLON
    ;

field:
    PRIMITIVETYPE IDENTIFIER SEMICOLON { dv.processStructEnd($1, $2); }
    | field PRIMITIVETYPE IDENTIFIER SEMICOLON { dv.processStructEnd($2, $3); }
    ;

%%

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main() {
    printf("Enter an expression: \n");
    yyparse();
    
    return 0;
}
