%{
	#include <stdio.h>
	int yyerror(const char* err);
%}

%union{
  int iVal;
  float fVal;
}

%token END
%token END_STATEMENT
%token POINT
%token LINE
%token CIRCLE
%token RECTANGLE
%token SET_COLOR
%token <iVal> INT
%token <fVal> FLOAT

%%

program:        statement_list end
              ;

statement_list: statement
              | statement statement_list
              ;

statement:      line
              | point
              | circle
              | rectangle
              | set_color
              ;

line:           LINE INT INT INT INT END_STATEMENT                    {  }
              ;

point:         POINT INT INT END_STATEMENT                            {  }
             | POINT FLOAT FLOAT END_STATEMENT                        {  }
             ;

circle:        CIRCLE INT INT INT END_STATEMENT                       {  }
             | CIRCLE FLOAT FLOAT FLOAT END_STATEMENT                 {  }
             ;

rectangle:     RECTANGLE INT INT INT INT END_STATEMENT                {  }
             | RECTANGLE FLOAT FLOAT FLOAT FLOAT END_STATEMENT        {  }
             ;

set_color:     SET_COLOR INT INT INT END_STATEMENT                    {  }
             ;

end:          END                                                     {  }
             ;

%%

int main(int argc, char** argv){
	yyparse();
}
int yyerror(const char* err){
	printf("%s\n", err);
}
