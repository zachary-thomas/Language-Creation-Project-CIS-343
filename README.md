# Language-Creation-Project-CIS-343
ZoomJoyStrong language project.

To run:

bison -d zoomjoystrong.y
flex zoomjoystrong.lex
gcc -o zjs zoomjoystrong.c lex.yy.c zoomjoystrong.tab.c -lSDL2 -lm
./zjs < sample.zjs 
