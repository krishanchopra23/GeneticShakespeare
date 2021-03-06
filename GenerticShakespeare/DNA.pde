class DNA {
  //String target = "to be or not to be";
  //char [] genes = new char[18];
  char [] genes;
  float fitness;
  
  DNA() {
    genes = new char[target.length()];
    for (int i = 0; i < genes.length; i++) {
       genes[i] = (char) random(32, 128); 
    }
  }
  
  void fitness() {
    int score = 0;
    for (int i = 0; i < genes.length; i++) {
      if (genes[i] == target.charAt(i)) {
        ++score; 
      }
    }
    fitness = float(score)/target.length();
  }
  //crossover function
  DNA crossover(DNA partner) {
    DNA child = new DNA();
    //int midpoint = int(random(genes.length));
    
    for (int i = 0; i < genes.length; i++) {
      //if (i > midpoint) child.genes[i] = genes[i];
      //else child.genes[i] = partner.genes[i];
     //implement the coin flipping method
      int geneSelection = int(random(0, 1));
      if (geneSelection == 0) {
         child.genes[i] = genes[i]; 
      } else {
         child.genes[i] = partner.genes[i]; 
      }
    }
    return child;
  }
  //mutation rate
  void mutate(float mutationRate) {
    for (int i = 0; i < genes.length; i++) {
       if (random(1) < mutationRate) {
          genes[i] = (char) random(32, 128); 
       }
    }
  }
  
  String getPhrase() {
    return new String(genes);
  }
}
