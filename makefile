SRCDIR = src
TESTDIR = tests
ODIR = out
BINDIR = bin
OUT = $(BINDIR)/app
TOUT = $(BINDIR)/test
TESTS = $(ODIR)/tests.o $(ODIR)/fixed_vector_test.o
CC = g++
DEBUG = -g
DEBUGGER = gdb
CFLAGS = -Wall -c `sdl-config --cflags` $(DEBUG)
LFLAGS = -Wall `sdl-config --libs` -lSDL_image $(DEBUG)

#MAKEMAKE<
OBJS=$(ODIR)/game.o $(ODIR)/graphics.o $(ODIR)/inpututils.o $(ODIR)/main.o $(ODIR)/mainscene.o $(ODIR)/player.o $(ODIR)/playerrenderer.o $(ODIR)/renderutils.o $(ODIR)/timer.o 

$(OUT) : $(OBJS)
	$(CC) $(LFLAGS) $(OBJS) -o $(OUT)

$(ODIR)/game.o: src/game.cpp src/game.h src/graphics.h src/inpututils.h src/timer.h src/scene.h src/mainscene.h
	$(CC) $(CFLAGS) src/game.cpp -o $(ODIR)/game.o

$(ODIR)/graphics.o: src/graphics.cpp src/graphics.h
	$(CC) $(CFLAGS) src/graphics.cpp -o $(ODIR)/graphics.o

$(ODIR)/inpututils.o: src/inpututils.cpp src/inpututils.h
	$(CC) $(CFLAGS) src/inpututils.cpp -o $(ODIR)/inpututils.o

$(ODIR)/main.o: src/main.cpp src/game.h
	$(CC) $(CFLAGS) src/main.cpp -o $(ODIR)/main.o

$(ODIR)/mainscene.o: src/mainscene.cpp src/mainscene.h src/scene.h src/player.h src/playerrenderer.h src/renderer.h src/renderutils.h src/inpututils.h
	$(CC) $(CFLAGS) src/mainscene.cpp -o $(ODIR)/mainscene.o

$(ODIR)/player.o: src/player.cpp src/player.h
	$(CC) $(CFLAGS) src/player.cpp -o $(ODIR)/player.o

$(ODIR)/playerrenderer.o: src/playerrenderer.cpp src/playerrenderer.h src/renderer.h src/renderutils.h src/player.h src/graphics.h
	$(CC) $(CFLAGS) src/playerrenderer.cpp -o $(ODIR)/playerrenderer.o

$(ODIR)/renderutils.o: src/renderutils.cpp src/renderutils.h
	$(CC) $(CFLAGS) src/renderutils.cpp -o $(ODIR)/renderutils.o

$(ODIR)/timer.o: src/timer.cpp src/timer.h
	$(CC) $(CFLAGS) src/timer.cpp -o $(ODIR)/timer.o

#MAKEMAKE>

makemake : 
	makemake $(SRCDIR)/*.cpp

tags : 
	ctags $(SRCDIR)/*.cpp -f $(SRCDIR)/tags

debug : $(OUT)
	$(DEBUGGER) $(OUT)

clean : 
	\rm -rf $(ODIR)/*.o $(OUT)

go : $(OUT)
	$(OUT)

scratch : clean go
	

test: $(TOUT)
	

rtest : $(TOUT)
	$(TOUT)

$(TOUT): $(TESTS)
	$(CC) $(LFLAGS) $(TESTS) -o $(TOUT)

$(ODIR)/tests.o : $(TESTDIR)/tests.cpp
	$(CC) $(CFLAGS) $(TESTDIR)/tests.cpp -o $(ODIR)/tests.o

