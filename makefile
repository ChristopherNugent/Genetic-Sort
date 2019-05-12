SRC = src/PartialSolution.vala src/Population.vala src/Main.vala src/Config.vala
FLAGS = --pkg=gee-0.8 -X -O
OUT = GeneticSort

all: $(OUT)

$(OUT): ${SRC}
	valac $(SRC) $(FLAGS) -o $(OUT)

clean:
	rm $(OUT)

run: $(OUT)
	./$(OUT)