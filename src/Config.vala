namespace GeneticSort {

    // UI constants
    const int OBSERVE_TIMER = 5000;
    const int PRINT_LIMIT = 40;

    // Number of generations to run for
    const int GENERATIONS = 100000;

    // Length of array to sort
    const int PROBLEM_SIZE = 50;

    // genetic algorithm settings
    const int POPULATION_SIZE = 1000;
    const double KEEP_RATIO = 0.1;
    const double BREED_RATIO = 0.3;
    const double FRESH_RATIO = 0.1;
    const double MUTATE_RATIO = 0.000001;

    const int KEEP_AMOUNT = (int) (POPULATION_SIZE * KEEP_RATIO);
    const int BREED_INDEX = (int) (POPULATION_SIZE * BREED_RATIO);
    const int RANDOM_INDEX = (int) (1 - POPULATION_SIZE * FRESH_RATIO);
    const int FRESH_AMOUNT = (int) (POPULATION_SIZE * FRESH_RATIO);
}
