PROJ=hello-luke-dart
SRC=main.dart
BIN=bin/$(SRC)

all: run

clean:
	
build: $(SRC)

run:
	dart $(BIN)