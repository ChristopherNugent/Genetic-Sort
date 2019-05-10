SRC = src/PartialSolution.vala src/Genetic.vala src/Main.vala src/Config.vala
FLAGS = --pkg=gee-0.8
OUT = GeneticSort

all:
	valac $(SRC) $(FLAGS) -o $(OUT)

