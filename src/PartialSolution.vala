/*
 * PartialSolution describes a potential solution to the genetic algorithm
 * includes fitness, mutation, and breeding functions
 */

namespace GeneticSort {

    public class PartialSolution {

        public int[] genome;
        private int cached_fitness;

        /**
         * Create a new PartialSolution with a random genome
         */
        public PartialSolution.random() {
            this.empty();
            for (int i = 0; i < genome.length; i++) {
                genome[i] = i;
            }
            shuffle();
        }

        // Just a Fisher-Yates shuffle
        private void shuffle() {
            for (int i = genome.length - 1; i > 0; i--) {
                int swap_index = Random.int_range(0, i);
                swap(i, swap_index);
            }
        }

        // Swap the genes at indices a and b
        private void swap(int a, int b) {
            int temp = genome[a];
            genome[a] = genome[b];
            genome[b] = temp;
        }

        // Create a PartialSolution with an uninitialized genome
        private PartialSolution.empty() {
            genome = new int[PROBLEM_SIZE];
            cached_fitness = -1;
        }

        /**
         * Get the fitness score of this PartialSolution
         * 
         * The fitness score of a partial solution is currently defined as
         * the number of cases where genome[n - 1] < genome[n]. This bounds
         * the score on [0, PROBLEM_SIZE).
         * 
         * The fitness is cached to improve efficiency on multiple calls.
         */
        public int get_fitness() {
            if (cached_fitness != -1) {
                return cached_fitness;
            }
            int fitness = 0;
            for (int i = 1; i < genome.length; i++) {
                if (genome[i - 1] < genome[i]) {
                    fitness++;
                } else {
                    // break;
                }
            }
            cached_fitness = fitness;
            return fitness;
        }

        /**
         * Mutate this PartialSolution by swapping 2 elements of its genome.
         */
        public void mutate() {
            debug("Mutating...");
            int i1 = Random.int_range(0, genome.length);
            int i2 = Random.int_range(0, genome.length);
            if (i1 != i2) {
                cached_fitness = -1;
                swap(i1, i2);
            }
        }

        /**
         * Breed the two parent PartialSolutions, and return the child
         */
        public static PartialSolution breed(PartialSolution p1, PartialSolution p2) {
            return interweave(p1, p2);
        }

        // Each slot in the genome is filled with a gene from a random parent
        private static PartialSolution random_breed(PartialSolution p1, PartialSolution p2) {
            var child = new PartialSolution.empty();
            for (int i = 0; i < child.genome.length; i++) {
                bool use_p1 = (Random.next_int() % 2) == 0;
                int inherited_value = (use_p1) ? p1.genome[i] : p2.genome[i];
                child.genome[i] = inherited_value;
            }
            return child;
        }

        // Alternate genes of the two parents
        private static PartialSolution interweave(PartialSolution p1, PartialSolution p2) {
            var child = new PartialSolution.empty();
            for (int i = 0; i < child.genome.length; i++) {
                bool use_p1 = (i % 2) == 0;
                int inherited_value = (use_p1) ? p1.genome[i] : p2.genome[i];
                child.genome[i] = inherited_value;
            }
            return child;
        }
    }
}
