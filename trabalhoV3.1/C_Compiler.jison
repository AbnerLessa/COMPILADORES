/*
 * Compilador para Linguagem C (subconjunto)
 * Parte 1 — Analisador Léxico (expressões regulares para tokens)
 * Parte 2 — Gramática (estruturas de controle, atribuições, declarações)
 *
 * Ferramenta: Jison (JavaScript parser generator)
 */

%lex

%%

/* --- Espaços em branco --- */
\s+                                     { /* ignorar */ }

/* --- Comentários --- */
\/\/[^\n]*                              { /* comentário de linha */ }
"/*"([^*]|\*[^/])*"*/"                  { /* comentário de bloco */ }

/* --- Diretivas de pré-processador --- */
"#include"[ \t]+("<"[^>]+">"|"\""[^"]+"\"")\s*  { console.log('Token INCLUDE: ' + yytext.trim()); return 'INCLUDE'; }
"#define"                               { console.log('Token DEFINE_DIR'); return 'DEFINE_DIR'; }

/* --- Palavras Reservadas --- */
"auto"                                  { console.log('Token AUTO'); return 'AUTO'; }
"break"                                 { console.log('Token BREAK'); return 'BREAK'; }
"case"                                  { console.log('Token CASE'); return 'CASE'; }
"char"                                  { console.log('Token CHAR'); return 'CHAR'; }
"const"                                 { console.log('Token CONST'); return 'CONST'; }
"continue"                              { console.log('Token CONTINUE'); return 'CONTINUE'; }
"default"                               { console.log('Token DEFAULT'); return 'DEFAULT'; }
"do"                                    { console.log('Token DO'); return 'DO'; }
"double"                                { console.log('Token DOUBLE'); return 'DOUBLE'; }
"else"                                  { console.log('Token ELSE'); return 'ELSE'; }
"enum"                                  { console.log('Token ENUM'); return 'ENUM'; }
"extern"                                { console.log('Token EXTERN'); return 'EXTERN'; }
"float"                                 { console.log('Token FLOAT'); return 'FLOAT'; }
"for"                                   { console.log('Token FOR'); return 'FOR'; }
"goto"                                  { console.log('Token GOTO'); return 'GOTO'; }
"if"                                    { console.log('Token IF'); return 'IF'; }
"int"                                   { console.log('Token INT'); return 'INT'; }
"long"                                  { console.log('Token LONG'); return 'LONG'; }
"NULL"                                  { console.log('Token NULL_LIT'); return 'NULL_LIT'; }
"register"                              { console.log('Token REGISTER'); return 'REGISTER'; }
"return"                                { console.log('Token RETURN'); return 'RETURN'; }
"short"                                 { console.log('Token SHORT'); return 'SHORT'; }
"signed"                                { console.log('Token SIGNED'); return 'SIGNED'; }
"sizeof"                                { console.log('Token SIZEOF'); return 'SIZEOF'; }
"static"                                { console.log('Token STATIC'); return 'STATIC'; }
"struct"                                { console.log('Token STRUCT'); return 'STRUCT'; }
"switch"                                { console.log('Token SWITCH'); return 'SWITCH'; }
"typedef"                               { console.log('Token TYPEDEF'); return 'TYPEDEF'; }
"union"                                 { console.log('Token UNION'); return 'UNION'; }
"unsigned"                              { console.log('Token UNSIGNED'); return 'UNSIGNED'; }
"void"                                  { console.log('Token VOID'); return 'VOID'; }
"volatile"                              { console.log('Token VOLATILE'); return 'VOLATILE'; }
"while"                                 { console.log('Token WHILE'); return 'WHILE'; }
"malloc"                                { console.log('Token MALLOC'); return 'MALLOC'; }
"free"                                  { console.log('Token FREE'); return 'FREE'; }
"printf"                                { console.log('Token PRINTF'); return 'PRINTF'; }
"scanf"                                 { console.log('Token SCANF'); return 'SCANF'; }

/* --- Operadores compostos (devem vir antes dos simples) --- */
"++"                                    { console.log('Token INC'); return 'INC'; }
"--"                                    { console.log('Token DEC'); return 'DEC'; }
"<<="                                   { console.log('Token LSHIFT_ASSIGN'); return 'LSHIFT_ASSIGN'; }
">>="                                   { console.log('Token RSHIFT_ASSIGN'); return 'RSHIFT_ASSIGN'; }
"<<"                                    { console.log('Token LSHIFT'); return 'LSHIFT'; }
">>"                                    { console.log('Token RSHIFT'); return 'RSHIFT'; }
"<="                                    { console.log('Token LE'); return 'LE'; }
">="                                    { console.log('Token GE'); return 'GE'; }
"=="                                    { console.log('Token EQ'); return 'EQ'; }
"!="                                    { console.log('Token NE'); return 'NE'; }
"&&"                                    { console.log('Token AND'); return 'AND'; }
"||"                                    { console.log('Token OR'); return 'OR'; }
"+="                                    { console.log('Token ADD_ASSIGN'); return 'ADD_ASSIGN'; }
"-="                                    { console.log('Token SUB_ASSIGN'); return 'SUB_ASSIGN'; }
"*="                                    { console.log('Token MUL_ASSIGN'); return 'MUL_ASSIGN'; }
"/="                                    { console.log('Token DIV_ASSIGN'); return 'DIV_ASSIGN'; }
"%="                                    { console.log('Token MOD_ASSIGN'); return 'MOD_ASSIGN'; }
"&="                                    { console.log('Token AND_ASSIGN'); return 'AND_ASSIGN'; }
"|="                                    { console.log('Token OR_ASSIGN'); return 'OR_ASSIGN'; }
"^="                                    { console.log('Token XOR_ASSIGN'); return 'XOR_ASSIGN'; }
"->"                                    { console.log('Token ARROW'); return 'ARROW'; }

/* --- Operadores simples --- */
"+"                                     { console.log('Token +'); return '+'; }
"-"                                     { console.log('Token -'); return '-'; }
"*"                                     { console.log('Token *'); return '*'; }
"/"                                     { console.log('Token /'); return '/'; }
"%"                                     { console.log('Token %'); return '%'; }
"="                                     { console.log('Token ='); return '='; }
"<"                                     { console.log('Token <'); return '<'; }
">"                                     { console.log('Token >'); return '>'; }
"!"                                     { console.log('Token !'); return '!'; }
"&"                                     { console.log('Token &'); return '&'; }
"|"                                     { console.log('Token |'); return '|'; }
"^"                                     { console.log('Token ^'); return '^'; }
"~"                                     { console.log('Token ~'); return '~'; }
"?"                                     { console.log('Token ?'); return '?'; }
":"                                     { console.log('Token :'); return ':'; }
";"                                     { console.log('Token ;'); return ';'; }
","                                     { console.log('Token ,'); return ','; }
"."                                     { console.log('Token .'); return '.'; }
"("                                     { console.log('Token ('); return '('; }
")"                                     { console.log('Token )'); return ')'; }
"["                                     { console.log('Token ['); return '['; }
"]"                                     { console.log('Token ]'); return ']'; }
"{"                                     { console.log('Token {'); return '{'; }
"}"                                     { console.log('Token }'); return '}'; }

/* --- Literais --- */
\"([^"\\]|\\.)*\"                       { console.log('Token STR_LIT: ' + yytext); return 'STR_LIT'; }
\'([^'\\]|\\.)\'                        { console.log('Token CHAR_LIT: ' + yytext); return 'CHAR_LIT'; }
[0-9]+\.[0-9]+([eE][\+\-]?[0-9]+)?     { console.log('Token F_LIT: ' + yytext); return 'F_LIT'; }
[0-9]+[eE][\+\-]?[0-9]+                { console.log('Token F_LIT: ' + yytext); return 'F_LIT'; }
[0-9]+                                  { console.log('Token INT_LIT: ' + yytext); return 'INT_LIT'; }

/* --- Identificadores (deve vir depois das palavras reservadas) --- */
[a-zA-Z_][a-zA-Z0-9_]*                 { console.log('Token IDF: ' + yytext); return 'IDF'; }

/* --- Erro léxico --- */
.                                       { throw new Error('ERRO LEXICO: caractere [' + yytext + '] nao reconhecido na linha ' + (yylineno + 1)); }

<<EOF>>                                 { console.log('Token EOF'); return 'EOF'; }

/lex

/* ===========================================================
   PARTE 2 — Gramática (Análise Sintática)
   =========================================================== */

/* Precedência e associatividade dos operadores */
%left OR
%left AND
%left '|'
%left '^'
%left '&'
%left EQ NE
%left '<' '>' LE GE
%left LSHIFT RSHIFT
%left '+' '-'
%left '*' '/' '%'
%right UMINUS UPLUS '!' '~'
%left INC DEC '.' ARROW

%start programa

%%

programa
    : unidades EOF
      { console.log('\n=== ANALISE SINTATICA CONCLUIDA COM SUCESSO ==='); }
    ;

unidades
    : unidade
    | unidades unidade
    ;

unidade
    : INCLUDE
      { console.log('>>> [INCLUDE]   Biblioteca incluida: ' + yytext.trim()); }
    | define_dir
    | decl_struct_global
    | decl_union_global
    | decl_enum_global
    | typedef_decl
    | prototipo_funcao
    | definicao_funcao
    | declaracao_var_global
    | bloco_livre
    ;

/* ============ #define ============ */
define_dir
    : DEFINE_DIR IDF INT_LIT
      { console.log('>>> [DEFINE]    Constante definida: ' + $2 + ' = ' + $3); }
    | DEFINE_DIR IDF F_LIT
      { console.log('>>> [DEFINE]    Constante definida: ' + $2 + ' = ' + $3); }
    | DEFINE_DIR IDF IDF
      { console.log('>>> [DEFINE]    Constante definida: ' + $2 + ' = ' + $3); }
    ;

/* ============ typedef ============ */
typedef_decl
    : TYPEDEF tipo_completo IDF ';'
      { console.log('>>> [TYPEDEF]   Novo tipo definido: ' + $3 + ' (base: ' + $2 + ')'); }
    ;

/* ============ Struct / Union / Enum ============ */
decl_struct_global
    : STRUCT IDF '{' membros '}' ';'
      { console.log('>>> [STRUCT]    Estrutura declarada: struct ' + $2); }
    ;

decl_union_global
    : UNION IDF '{' membros '}' ';'
      { console.log('>>> [UNION]     Union declarada: union ' + $2); }
    ;

decl_enum_global
    : ENUM IDF '{' lista_enum '}' ';'
      { console.log('>>> [ENUM]      Enumeracao declarada: enum ' + $2); }
    ;

membros
    : membro
    | membros membro
    ;

membro
    : tipo_completo IDF ';'
    | tipo_completo IDF '[' expr ']' ';'
    ;

lista_enum
    : enum_item
    | lista_enum ',' enum_item
    ;

enum_item
    : IDF
    | IDF '=' expr
    ;

/* ============ Protótipo de função ============ */
prototipo_funcao
    : tipo_completo IDF '(' params_opt ')' ';'
      { console.log('>>> [PROTOTIPO] Funcao declarada: ' + $1 + ' ' + $2 + '()'); }
    | tipo_completo '*' IDF '(' params_opt ')' ';'
      { console.log('>>> [PROTOTIPO] Funcao declarada: ' + $1 + '* ' + $3 + '()'); }
    ;

/* ============ Definição de função ============ */
definicao_funcao
    : tipo_completo IDF '(' params_opt ')' bloco
      { console.log('>>> [FUNCAO]    Definicao de funcao: ' + $1 + ' ' + $2 + '()'); }
    ;

params_opt
    :
    | params
    ;

params
    : param
    | params ',' param
    ;

param
    : tipo_completo IDF
    | tipo_completo '*' IDF
    | tipo_completo IDF '[' ']'
    ;

/* ============ Tipos ============ */
tipo_completo
    : tipo_base
    | mod_storage tipo_base
    | mod_tipo tipo_base
    | mod_storage mod_tipo tipo_base
    | mod_tipo mod_tipo tipo_base
    | mod_tipo mod_tipo
    | mod_storage mod_tipo
    | mod_storage mod_tipo mod_tipo
    | STRUCT IDF
    | UNION IDF
    | ENUM IDF
    ;

tipo_base
    : INT
    | CHAR
    | FLOAT
    | DOUBLE
    | VOID
    ;

mod_tipo
    : SIGNED
    | UNSIGNED
    | LONG
    | SHORT
    | CONST
    | VOLATILE
    ;

mod_storage
    : AUTO
    | EXTERN
    | REGISTER
    | STATIC
    ;

/* ============ Declaração de variável ============ */
declaracao_var_global
    : declaracao_var ';'
    ;

declaracao_var
    : tipo_completo lista_decl
    | tipo_completo '*' lista_decl_ptr
    ;

lista_decl
    : decl_item
    | lista_decl ',' decl_item
    ;

lista_decl_ptr
    : decl_ptr_item
    | lista_decl_ptr ',' decl_ptr_item
    ;

decl_item
    : IDF
      { console.log('>>> [DECL]      Variavel declarada: ' + $1); }
    | IDF '=' expr
      { console.log('>>> [DECL]      Variavel inicializada: ' + $1 + ' = (expr)'); }
    | IDF '[' expr ']'
      { console.log('>>> [ARRAY]     Array declarado: ' + $1 + '[n]'); }
    | IDF '[' expr ']' '=' '{' lista_expr '}'
      { console.log('>>> [ARRAY]     Array declarado com valores: ' + $1 + '[n] = {...}'); }
    | IDF '[' ']' '=' '{' lista_expr '}'
      { console.log('>>> [ARRAY]     Array declarado com valores: ' + $1 + '[] = {...}'); }
    | IDF '[' ']'
      { console.log('>>> [ARRAY]     Array declarado: ' + $1 + '[]'); }
    | IDF '[' expr ']' '[' expr ']'
      { console.log('>>> [MATRIZ]    Matriz declarada: ' + $1 + '[n][m]'); }
    | IDF '[' expr ']' '[' expr ']' '=' '{' lista_init_mat '}'
      { console.log('>>> [MATRIZ]    Matriz declarada com valores: ' + $1 + '[n][m] = {...}'); }
    | IDF '=' '{' lista_expr '}'
      { console.log('>>> [DECL]      Struct/union inicializado: ' + $1 + ' = {...}'); }
    ;

decl_ptr_item
    : IDF
      { console.log('>>> [PONTEIRO]  Ponteiro declarado: *' + $1); }
    | IDF '=' expr
      { console.log('>>> [PONTEIRO]  Ponteiro inicializado: *' + $1 + ' = (expr)'); }
    ;

lista_init_mat
    : '{' lista_expr '}'
    | lista_init_mat ',' '{' lista_expr '}'
    ;

/* ============ Bloco com escopo ============ */
bloco
    : '{' stmts_opt '}'
    ;

bloco_livre
    : '{' stmts_opt '}'
    ;

stmts_opt
    :
    | stmts
    ;

stmts
    : stmt
    | stmts stmt
    ;

/* ============ Statements ============ */
stmt
    : declaracao_var ';'
    | expr_atrib ';'
    | chamada_funcao_stmt ';'
    | if_stmt
    | switch_stmt
    | while_stmt
    | dowhile_stmt
    | for_stmt
    | BREAK ';'
      { console.log('>>> [CONTROLE]  break - saida do bloco'); }
    | CONTINUE ';'
      { console.log('>>> [CONTROLE]  continue - proxima iteracao'); }
    | RETURN expr ';'
      { console.log('>>> [CONTROLE]  return - retorno com valor'); }
    | RETURN ';'
      { console.log('>>> [CONTROLE]  return - retorno sem valor'); }
    | GOTO IDF ';'
      { console.log('>>> [CONTROLE]  goto ' + $2); }
    | bloco
    | printf_stmt ';'
    | scanf_stmt ';'
    | free_stmt ';'
    | IDF ':' stmt
      { console.log('>>> [LABEL]     Label definido: ' + $1 + ':'); }
    | typedef_decl
    | IDF lista_decl_typedef ';'
    ;

/* ============ printf / scanf / free ============ */
printf_stmt
    : PRINTF '(' lista_args ')'
      { console.log('>>> [SAIDA]     printf() - impressao na tela'); }
    ;

scanf_stmt
    : SCANF '(' lista_args ')'
      { console.log('>>> [ENTRADA]   scanf() - leitura do usuario'); }
    ;

free_stmt
    : FREE '(' expr ')'
      { console.log('>>> [MEMORIA]   free() - desalocacao de memoria'); }
    ;

chamada_funcao_stmt
    : IDF '(' lista_args_opt ')'
      { console.log('>>> [CHAMADA]   Funcao chamada: ' + $1 + '()'); }
    ;

lista_args_opt
    :
    | lista_args
    ;

lista_args
    : expr
    | lista_args ',' expr
    ;

/* ============ Declaração usando typedef ============ */
lista_decl_typedef
    : IDF '=' expr
      { console.log('>>> [DECL]      Variavel (tipo customizado) inicializada: ' + $1 + ' = (expr)'); }
    | IDF
      { console.log('>>> [DECL]      Variavel (tipo customizado) declarada: ' + $1); }
    ;

/* ============ Atribuição ============ */
expr_atrib
    : lvalue '=' expr
      { console.log('>>> [ATRIB]     Atribuicao: ' + $1 + ' = (expr)'); }
    | lvalue ADD_ASSIGN expr
      { console.log('>>> [ATRIB]     Atribuicao composta: ' + $1 + ' += (expr)'); }
    | lvalue SUB_ASSIGN expr
      { console.log('>>> [ATRIB]     Atribuicao composta: ' + $1 + ' -= (expr)'); }
    | lvalue MUL_ASSIGN expr
      { console.log('>>> [ATRIB]     Atribuicao composta: ' + $1 + ' *= (expr)'); }
    | lvalue DIV_ASSIGN expr
      { console.log('>>> [ATRIB]     Atribuicao composta: ' + $1 + ' /= (expr)'); }
    | lvalue MOD_ASSIGN expr
      { console.log('>>> [ATRIB]     Atribuicao composta: ' + $1 + ' %= (expr)'); }
    | lvalue AND_ASSIGN expr
      { console.log('>>> [ATRIB]     Atribuicao composta: ' + $1 + ' &= (expr)'); }
    | lvalue OR_ASSIGN expr
      { console.log('>>> [ATRIB]     Atribuicao composta: ' + $1 + ' |= (expr)'); }
    | lvalue XOR_ASSIGN expr
      { console.log('>>> [ATRIB]     Atribuicao composta: ' + $1 + ' ^= (expr)'); }
    | lvalue LSHIFT_ASSIGN expr
      { console.log('>>> [ATRIB]     Atribuicao composta: ' + $1 + ' <<= (expr)'); }
    | lvalue RSHIFT_ASSIGN expr
      { console.log('>>> [ATRIB]     Atribuicao composta: ' + $1 + ' >>= (expr)'); }
    | lvalue INC
      { console.log('>>> [ATRIB]     Pos-incremento: ' + $1 + '++'); }
    | lvalue DEC
      { console.log('>>> [ATRIB]     Pos-decremento: ' + $1 + '--'); }
    | INC lvalue
      { console.log('>>> [ATRIB]     Pre-incremento: ++' + $2); }
    | DEC lvalue
      { console.log('>>> [ATRIB]     Pre-decremento: --' + $2); }
    ;

lvalue
    : IDF
      { $$ = $1; }
    | IDF '[' expr ']'
      { $$ = $1 + '[...]'; }
    | '*' IDF
      { $$ = '*' + $2; }
    | IDF '.' IDF
      { $$ = $1 + '.' + $3; }
    | IDF ARROW IDF
      { $$ = $1 + '->' + $3; }
    ;

/* ============ IF ============ */
if_stmt
    : IF '(' expr ')' bloco
      { console.log('>>> [COND]      if ( condicao ) { ... }'); }
    | IF '(' expr ')' bloco ELSE bloco
      { console.log('>>> [COND]      if ( condicao ) { ... } else { ... }'); }
    | IF '(' expr ')' bloco ELSE if_stmt
      { console.log('>>> [COND]      if ( condicao ) { ... } else if ...'); }
    | IF '(' expr ')' stmt_simples
      { console.log('>>> [COND]      if ( condicao ) stmt (sem bloco)'); }
    | IF '(' expr ')' stmt_simples ELSE stmt_simples
      { console.log('>>> [COND]      if ( condicao ) stmt else stmt (sem bloco)'); }
    ;

stmt_simples
    : expr_atrib ';'
    | declaracao_var ';'
    ;

/* ============ SWITCH ============ */
switch_stmt
    : SWITCH '(' expr ')' '{' switch_body '}'
      { console.log('>>> [COND]      switch ( expr ) { ... }'); }
    ;

switch_body
    :
    | switch_body case_cl
    | switch_body default_cl
    ;

case_cl
    : CASE expr ':' stmts_opt
      { console.log('>>> [CASE]      case ' + $2 + ':'); }
    | CASE expr ':'
      { console.log('>>> [CASE]      case ' + $2 + ': (fall-through)'); }
    ;

default_cl
    : DEFAULT ':' stmts_opt
      { console.log('>>> [CASE]      default:'); }
    ;

/* ============ WHILE ============ */
while_stmt
    : WHILE '(' expr ')' bloco
      { console.log('>>> [LOOP]      while ( condicao ) { ... }'); }
    | WHILE '(' expr ')' stmt_simples
      { console.log('>>> [LOOP]      while ( condicao ) stmt (sem bloco)'); }
    ;

/* ============ DO-WHILE ============ */
dowhile_stmt
    : DO bloco WHILE '(' expr ')' ';'
      { console.log('>>> [LOOP]      do { ... } while ( condicao )'); }
    ;

/* ============ FOR ============ */
for_stmt
    : FOR '(' for_init ';' for_cond ';' for_upd ')' bloco
      { console.log('>>> [LOOP]      for ( init; cond; upd ) { ... }'); }
    | FOR '(' for_init ';' for_cond ';' for_upd ')' stmt_simples
      { console.log('>>> [LOOP]      for ( init; cond; upd ) stmt (sem bloco)'); }
    ;

for_init
    :
    | expr_atrib
    | declaracao_var
    ;

for_cond
    :
    | expr
    ;

for_upd
    :
    | expr_atrib
    | expr_atrib ',' expr_atrib
    ;

/* ============ Expressões ============ */
expr
    : expr_or
    ;

lista_expr
    : expr
    | lista_expr ',' expr
    ;

expr_or
    : expr_and
    | expr_or OR expr_and
    ;

expr_and
    : expr_bor
    | expr_and AND expr_bor
    ;

expr_bor
    : expr_bxor
    | expr_bor '|' expr_bxor
    ;

expr_bxor
    : expr_band
    | expr_bxor '^' expr_band
    ;

expr_band
    : expr_eq
    | expr_band '&' expr_eq
    ;

expr_eq
    : expr_rel
    | expr_eq EQ expr_rel
    | expr_eq NE expr_rel
    ;

expr_rel
    : expr_shift
    | expr_rel '<' expr_shift
    | expr_rel '>' expr_shift
    | expr_rel LE expr_shift
    | expr_rel GE expr_shift
    ;

expr_shift
    : expr_add
    | expr_shift LSHIFT expr_add
    | expr_shift RSHIFT expr_add
    ;

expr_add
    : expr_mul
    | expr_add '+' expr_mul
    | expr_add '-' expr_mul
    ;

expr_mul
    : expr_unary
    | expr_mul '*' expr_unary
    | expr_mul '/' expr_unary
    | expr_mul '%' expr_unary
    ;

expr_unary
    : expr_postfix
    | '-' expr_unary %prec UMINUS
    | '+' expr_unary %prec UPLUS
    | '!' expr_unary
    | '~' expr_unary
    | '&' expr_unary
    | SIZEOF '(' tipo_completo ')'
    | SIZEOF '(' IDF ')'
    | '(' tipo_completo ')' expr_unary
      { console.log('>>> [CAST]      Conversao de tipo para: ' + $2); }
    | '(' tipo_completo '*' ')' expr_unary
      { console.log('>>> [CAST]      Conversao de tipo para: ' + $2 + '*'); }
    | INC expr_postfix
    | DEC expr_postfix
    ;

expr_postfix
    : expr_primaria
    | expr_postfix '[' expr ']'
    | expr_postfix INC
    | expr_postfix DEC
    | expr_postfix '.' IDF
    | expr_postfix ARROW IDF
    | IDF '(' lista_args_opt ')'
      { console.log('>>> [CHAMADA]   Funcao chamada: ' + $1 + '()'); }
    | MALLOC '(' expr ')'
      { console.log('>>> [MEMORIA]   malloc() - alocacao dinamica de memoria'); }
    ;

expr_primaria
    : IDF
    | INT_LIT
    | F_LIT
    | CHAR_LIT
    | STR_LIT
    | NULL_LIT
    | '(' expr ')'
    ;

%%
