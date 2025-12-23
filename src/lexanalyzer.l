%{
#include "Token.hpp"
  #include <iostream>
  using namespace std;
%}

%option c++
%option noyywrap

DIGIT   [0-9]
NZDIGIT [1-9]
WSPACE  [\ \t\n]
ALPHA   [a-zA-Z]

%%

%{
   // Keywords.
%}
"void"                       {return TokenType::VOID_T;}
"int"                        {return TokenType::INT_T;}
"float"                      {return TokenType::FLOAT_T;}
"begin"                      {return TokenType::BEGIN_T;}
"end"                        {return TokenType::END_T;}
"if"                         {return TokenType::IF_T;}
"then"                       {return TokenType::THEN_T;}
"else"                       {return TokenType::ELSE_T;}
"while"                      {return TokenType::WHILE_T;}

%{
  // Rules from the given automata. 
%}
{ALPHA}({ALPHA}|{DIGIT})*    {return TokenType::ID_T;}
{NZDIGIT}{DIGIT}*            {return TokenType::NUM_INT_T;}
"0"                          {return TokenType::NUM_INT_T;}
{NZDIGIT}{DIGIT}*"."{DIGIT}+ {return TokenType::NUM_REAL_T;}
"0""."{DIGIT}+               {return TokenType::NUM_REAL_T;}
"+"                          {return TokenType::ADDOP_T;}
"-"                          {return TokenType::ADDOP_T;}
"*"                          {return TokenType::MULOP_T;}
"/"                          {return TokenType::MULOP_T;}
">"                          {return TokenType::RELOP_T;}
">="                         {return TokenType::RELOP_T;}
"=="                         {return TokenType::RELOP_T;}
"<"                          {return TokenType::RELOP_T;}
"<="                         {return TokenType::RELOP_T;}
"<."                         {return TokenType::ASSIGNOP_T;}
"&&"                         {return TokenType::AND_T;}
"||"                         {return TokenType::OR_T;}
";"                          {return TokenType::SEMICOLON_T;}
"["                          {return TokenType::LBRACK_T;}
"]"                          {return TokenType::RBRACK_T;}
","                          {return TokenType::COMMA_T;}
")"                          {return TokenType::RPAREN_T;}
"("                          {return TokenType::LPAREN_T;}
"~"                          {return TokenType::NOT_T;}

%{
  // Comments, whitespace, invalid ID.
%}
"#".*                        {}
{WSPACE}+                    {}
{DIGIT}{ALPHA}*{DIGIT}*      {return TokenType::ERROR_T;}
.                            {return TokenType::ERROR_T;}

%{
  // End of file.
%}
<<eof>>                      {return TokenType::EOF_T;}


%%
