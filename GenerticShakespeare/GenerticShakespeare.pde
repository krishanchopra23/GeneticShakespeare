float mutationRate;
int totalPopulation = 150;
DNA[] population;
ArrayList<DNA> matingPool;
String target;

void setup() {
  size(800, 800);
  target = "to be or not to be";
  mutationRate = 0.01;
  population = new DNA[totalPopulation];
  for (int i = 0; i < population.length; i++) {
     population[i] = new DNA();
  }
  
  //for (DNA dna : population) {
  //  dna.fitness();
  //  println(dna.fitness);
  //}
  
  //for (DNA d : population) {
  //   for (char c : d.genes) {
  //      print(c); 
  //   }
  //   println("");
  //}
}

void draw() {
   background(255);
   frameRate(5);
   fill(0);
   String words = "";
   for (int i = 0; i < population.length; i++) {
      words += population[i].getPhrase() + "     ";
   }
    textFont(createFont("Courier",16,true),16);
    text(words,20,20,width,height);
   //calculate fitness
   for (int i = 0; i < population.length; i++) {
      population[i].fitness(); 
   }
   //add a mating pool
   ArrayList<DNA> matingPool = new ArrayList<DNA>();
   for (int i = 0; i < population.length; i++) {
      int n = int(population[i].fitness * 100);
      for (int j = 0; j < n; j++) {
        matingPool.add(population[i]); 
      }
   }
   //reproduction
   for (int i = 0; i < population.length; i++) {
      int a = int(random(matingPool.size()));
      int b = int(random(matingPool.size()));
      //ensure unique random selection
      while (a == b) {
        b = int(random(matingPool.size())); 
      }
      DNA partnerA = matingPool.get(a);
      DNA partnerB = matingPool.get(b);
      DNA child = partnerA.crossover(partnerB);
      child.mutate(mutationRate);
      population[i] = child;
   }
   
}
