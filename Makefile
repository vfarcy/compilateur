# --- Variables ---
CC = gcc
LEX = flex
YACC = bison
CFLAGS = -Wall

# Nom de l'exécutable final
EXEC = mon_compilateur

# --- Règles ---

# Règle par défaut
all: $(EXEC)

# Compilation de l'exécutable final
# On lie les fichiers objets générés par Bison et Flex
$(EXEC): lex.yy.o parser.tab.o
	$(CC) $(CFLAGS) -o $(EXEC) lex.yy.o parser.tab.o

# Compilation du lexer (Flex)
# Dépend de lex.yy.c et du header généré par Bison pour les tokens
lex.yy.o: lex.yy.c parser.tab.h
	$(CC) $(CFLAGS) -c lex.yy.c

# Compilation du parser (Bison)
parser.tab.o: parser.tab.c
	$(CC) $(CFLAGS) -c parser.tab.c

# Génération du code C du lexer à partir de Flex
lex.yy.c: scanner.l
	$(LEX) scanner.l

# Génération du code C du parser et du header (.h) à partir de Bison
# L'option -d est cruciale pour créer parser.tab.h
parser.tab.c parser.tab.h: parser.y
	$(YACC) -d parser.y

# Nettoyage des fichiers temporaires
clean:
	rm -f *.o lex.yy.c parser.tab.c parser.tab.h $(EXEC)

# Règle pour tout recompiler proprement
rebuild: clean all

