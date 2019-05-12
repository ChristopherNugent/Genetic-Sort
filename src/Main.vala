namespace GeneticSort {

    void main() {
        stdout.printf("Generations to be run = %d\nList size = %d\nPopulation size = %d\nTop members kept = %d\nFresh members added = %d\n\n",
                        GENERATIONS,
                        PROBLEM_SIZE,
                        POPULATION_SIZE,
                        KEEP_AMOUNT,
                        (int) (POPULATION_SIZE * FRESH_RATIO));

        var pop = new Population();
        Timer stopwatch = new Timer();
        stopwatch.start();
        for (int generation = 0; generation < GENERATIONS; generation++) {
            if (generation % OBSERVE_TIMER == 0) {
                print_scores(pop);
                print_best(pop);
                print_times(stopwatch.elapsed(), generation);
            }
            pop.iterate();
        }

        stdout.printf("Ran %d generations.\n", GENERATIONS);
        print_scores(pop);
        print_best(pop);    
    }

    void print_scores(Population p) {
        int[] scores = p.get_scores();
        stdout.printf("Fitness scores:");
        for (int i = 0; i < PRINT_LIMIT && i < scores.length; i++) {
            stdout.printf(" %d", scores[i]);
        }
        stdout.printf("\n");
    }

    void print_best(Population p) {
        int[] genome = p.get_best_genome();
        stdout.printf("Best genome:");
        for (int i = 0; i < PRINT_LIMIT && i < genome.length; i++) {
            stdout.printf(" %d", genome[i]);
        }
        stdout.printf("\n");
    }

    void print_times(double seconds_elapsed, int generation) {
        double seconds_per_generation = seconds_elapsed / generation;
        stdout.printf("Time per generation: %.3fms\n", 1000 * seconds_per_generation);
        stdout.printf("Generations per second: %.1f\n", 1.0 / seconds_per_generation);
        double time_remaining = (GENERATIONS - generation) * seconds_per_generation;
        stdout.printf("Estimated time remaining: %.2fs\n", time_remaining);
        stdout.printf("\n");
    }
}
