/**
 * The Population class manages a population of Partial solutions,
 * and provides functions to advance the Population to the next generation
 */

using Gee; // for List data structurs

namespace GeneticSort {

    public class Population : Object {

        private static CompareDataFunc<PartialSolution> comparator =
            (ps1, ps2) => { return ps2.get_fitness() - ps1.get_fitness(); };

        private Gee.List<PartialSolution> population;
        private int generation;

        public Population() {
            generation = 0;
            population = new ArrayList<PartialSolution>();
            for (int i = 0; i < POPULATION_SIZE; i++) {
                population.add(new PartialSolution.random());
            }
            population.sort(comparator);
        }

        // Move this population to the next generation
        public void iterate() {
            generation++;
            var next_generation = new ArrayList<PartialSolution>();

            for (int i = 0; i < KEEP_AMOUNT; i++) {
                next_generation.add(population.get(i));
            }

            for (int i = KEEP_AMOUNT; i < RANDOM_INDEX; i++) {
                var p1 = population.get(Random.int_range(0, BREED_INDEX));
                var p2 = population.get(Random.int_range(0, BREED_INDEX));
                var child = PartialSolution.breed(p1, p2);
                next_generation.add(child);
            }

            for (int i = RANDOM_INDEX; i < POPULATION_SIZE; i++) {
                next_generation.add(new PartialSolution.random());
            }

            foreach (PartialSolution ps in next_generation) {
                bool do_mutate = Random.next_double() < MUTATE_RATIO;
                if (do_mutate) {
                    ps.mutate();
                }
            }

            next_generation.sort(comparator);
            population = next_generation;
        }

        public int[] get_scores() {
            int[] scores = new int[POPULATION_SIZE];
            for (int i = 0; i < scores.length; i++) {
                scores[i] = population.get(i).get_fitness();
            }
            return scores;
        }

        public int[] get_best_genome() {
            var best = population.get(0);
            return best.genome;
        }
    }
}
