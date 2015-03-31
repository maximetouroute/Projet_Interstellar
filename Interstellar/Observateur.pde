/*
L'observateur
*/
class Observateur
{
 
  float posx;
  float posy;
  float prev_posx;
  float prev_posy;
  
  float vitesse;
  float rayon;
  
  float angle_initial;
  
  float angle;
  float Te;
  int temps;
  
  void setup_observateur()
  {
    //ps[0] = new ParticleSystem(new PVector(posx-prev_posx+originx, posy-prev_posy+originy));
    Te = 0.1;
    angle_initial = 0;
    rayon = 100;
    vitesse = 1;
    posx = 0-rayon;
    posy = 0+rayon;
    
    //posx = rayon * cos( 
    
  }
  
 void update_observateur()
 {
   temps++;
   prev_posx = posx;
   prev_posy = posy;
   
   posx = rayon * cos(vitesse*temps*Te + angle_initial);
   posy = rayon * sin(vitesse*temps*Te + angle_initial);  
 }
  
  void draw_observateur()
  {
    
    fill(255,255,255);
    ellipse(originx+posx, originy+posy, 10, 10);

  }
}



