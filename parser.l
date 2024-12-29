%{
#include "parser.tab.h"
#include <stdlib.h>
#include <string.h>
%}

%%


[0-9]+          { yylval.number = atoi(yytext); return NUMBER; }
"+"             { return PLUS; }
"-"             { return MINUS; }
"struct"        { return STRUCT; }
"module"        { return MODULE; }
"{"             { return LBRACE; }
"}"             { return RBRACE; }
"<"             { return LT;}
">"             { return GT;}
"@"             { return AT;}
"uint8"         { yylval.string = strdup(yytext); return PRIMITIVETYPE;}
"int8"         { yylval.string = strdup(yytext); return PRIMITIVETYPE;}
"uint16"         { yylval.string = strdup(yytext); return PRIMITIVETYPE;}
"int16"         { yylval.string = strdup(yytext); return PRIMITIVETYPE;}
"uint32"         { yylval.string = strdup(yytext); return PRIMITIVETYPE;}
"int32"         { yylval.string = strdup(yytext); return PRIMITIVETYPE;}
"uint64"         { yylval.string = strdup(yytext); return PRIMITIVETYPE;}
"int64"         { yylval.string = strdup(yytext); return PRIMITIVETYPE;}
"TRUE"         { yylval.string = strdup(yytext); return PRIMITIVETYPE;}
"FALSE"         { yylval.string = strdup(yytext); return PRIMITIVETYPE;}
"string"         { yylval.string = strdup(yytext); return PRIMITIVETYPE;}
[a-zA-Z_][a-zA-Z_]*          { yylval.string = strdup(yytext); return IDENTIFIER; }
";"             { return SEMICOLON; }
[ \t\n]+            ;
.               { printf("Unexpected character: %s\n", yytext); }

%%

int yywrap() {
    return 1;
}
