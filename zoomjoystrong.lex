%{
  #include <stdio.h>
  #include <string.h>
  #include "zoomjoystrong.tab.h"
  #include "zoomjoystrong.h"
%}

%option noyywrap

%%
(END|end)                {return END;}
;                        {return END_STATEMENT;} 
(POINT|point)            {return POINT;}
(LINE|line)              {return LINE;}
(CIRCLE|circle)          {return CIRCLE;}
(RECTANGLE|rectangle)    {return RECTANGLE;}
(SET_COLOR|set_color)    {return SET_COLOR;}
[0-9]+                   {return INT;}
[0-9]+\.[0-9]+           {return FLOAT;}
[\n|\t| ]+               ; 
.                        {printf("Unregognizable character/syntax"); }
%%