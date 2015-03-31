/*
L'observateur
*/

class Observateur
{
 
  
  // Position de l'observateur
  float posx;
  float posy;
  
  // Position precedente de l'observateur
  float prev_posx;
  float prev_posy;
  
  // Vitesse de rotation de l'observateur
  float vitesse;
  
  // Rayon de rotation de l'observateur
  float rayon;
  
  // Angle d'attaque du mouvement
  float angle_initial;
  


  
  void setup_observateur()
  {
    angle_initial = 0;
    
    rayon = 200;
    vitesse = 0.05;
  }
  
 void update_observateur()
 {
   prev_posx = posx;
   prev_posy = posy;
   
   posx = rayon * cos(vitesse*simulator.temps*simulator.Te + angle_initial);
   posy = rayon * sin(vitesse*simulator.temps*simulator.Te + angle_initial);  
 }
  
  void draw_observateur()
  {
    
    fill(255,255,255);
    ellipse(originx+posx, originy+posy, 10, 10);

  }
}



