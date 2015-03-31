
class Simulator
{
  // Variable qui s'incrémente de 1 en 1 (unités de temps)
  int temps;
  
  // La période d'echantillonnage
  float Te;
  
  float angle_observe;
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
     calcul_angle_observe();
  }
  void draw_simulator()
  {
    
    asteroide.draw_asteroide();
    observateur.draw_observateur();
    draw_angle_observe();
  }
  
  
  void calcul_angle_observe()
  {

    
    // Definition du vecteur reliant l'observateur a l'asteroide
    
    PVector vector = new PVector(observateur.posx - asteroide.posx, observateur.posy - asteroide.posy);
    PVector vec_vertical = new PVector (0, 1);
    
    //angle_observe = acos( (vector.x * vec_vertical.x + vector.y * vec_vertical.y) / (sqrt( sq(vector.x) + sq(vector.y) ) * sqrt( sq(vec_vertical.x) + sq(vec_vertical.y) )));
    angle_observe = degrees(PVector.angleBetween(vector, vec_vertical));
    
    fill(255, 0, 0);
    line(asteroide.posx, asteroide.posy, observateur.posx, observateur.posy);
  }
  
  void draw_angle_observe()
  {
     textSize(15);
    textAlign(CENTER, CENTER);
    fill(255, 255, 255);
    text("Angle:" + round(angle_observe), 500, 500); 
   // text("Angle Observateur:" + observateur.angle, 500, 550); 
   

  }
  
  
  
  
  
  
  

}


