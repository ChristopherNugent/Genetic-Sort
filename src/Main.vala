namespace GeneticSort {

    void main() {
        stdout.printf("List size = %d\nPopulation size = %d\nTop members kept = %d\nFresh members added = %d\n\n",
                        PROBLEM_SIZE,
                        POPULATION_SIZE,
                        KEEP_AMOUNT,
                        (int) (POPULATION_SIZE * FRESH_RATIO));


        Genetic g = new Genetic();

        Timer stopwatch = new Timer();
        stopwatch.start();
        for (int i = -1; i < GENERATIONS; i++) {
            if (i % OBSERVE_TIMER == 0) {
                g.print_scores();
                g.print_best();
                double generation_time = stopwatch.elapsed() / i;
                stdout.printf("Time per generation: %.3fms\n", 1000 * generation_time);
                stdout.printf("Generations per second: %.1f\n", 1.0 / generation_time);
                double time_remaining = (GENERATIONS - i) * generation_time;
                stdout.printf("Estimated time remaining: %.2fs\n", time_remaining);
                stdout.printf("\n");
            }
            g.iterate();
        }

        stdout.printf("Ran %d generations.\n", GENERATIONS);
        g.print_scores();
        g.print_best();    
    }
}
