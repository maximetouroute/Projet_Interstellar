
class Simulator
{
  // Variable qui s'incrémente de 1 en 1 (unités de temps)
  int temps;
  
  // La période d'echantillonnage
  float Te;
  
    // Les elements dans le simulateur
    Observateur observateur = new Observateur();
    Asteroide asteroide = new Asteroide();


  /* Useless pour l'instant */
  void setup_simulator()
  {
     temps = 0;
     Te = 0.5;
     observateur.setup_observateur();
     asteroide.setup_asteroide();
  }
  void update_simulator() 
  {
      // Mise à jour des données du jeu.
     temps++;
     observateur.update_observateur();
     asteroide.update_asteroide();
  }
  void draw_simulator()
  {
    
    asteroide.draw_asteroide();
    observateur.draw_observateur();
  }

}


