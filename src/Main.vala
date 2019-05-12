namespace GeneticSort {

    void main() {
        stdout.printf("List size = %d\nPopulation size = %d\nTop members kept = %d\nFresh members added = %d\n\n",
                        PROBLEM_SIZE,
                        POPULATION_SIZE,
                        KEEP_AMOUNT,
                        (int) (POPULATION_SIZE * FRESH_RATIO));


        var pop = new Population();

        Timer stopwatch = new Timer();
        stopwatch.start();
        for (int i = -1; i < GENERATIONS; i++) {
            if (i % OBSERVE_TIMER == 0) {
                print_scores(pop);
                print_best(pop);
                double generation_time = stopwatch.elapsed() / i;
                stdout.printf("Time per generation: %.3fms\n", 1000 * generation_time);
                stdout.printf("Generations per second: %.1f\n", 1.0 / generation_time);
                double time_remaining = (GENERATIONS - i) * generation_time;
                stdout.printf("Estimated time remaining: %.2fs\n", time_remaining);
                stdout.printf("\n");
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
}
