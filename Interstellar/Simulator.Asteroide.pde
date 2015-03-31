/*
L'asteroide
*/

class Asteroide
{
  
  // La position initiale de l'asteroide
  float x_initial = 0;
  float y_initial = 0;
  
  // La position courante de l'asteroide
  float posx;
  float posy;
  
  // La position precedente de l'asteroide
  float prev_posx;
  float prev_posy;
  
  // La vitesse dans les deux axes
  float vitesse_x;
  float vitesse_y;
  
   
  PImage asteroide_img;
  
  /*
  Construction des donnees de l'asteroide
  */
  void setup_asteroide()
  {
    vitesse_x = 0.1;
    vitesse_y = -0.1;
    posx = x_initial;
    posy = y_initial;
    asteroide_img = loadImage("asteroide.png");
  }
  
 void update_asteroide()
 {
   prev_posx = posx;
   prev_posy = posy;
   
   posx = x_initial + vitesse_x*simulator.temps*simulator.Te;
   posy = y_initial + vitesse_y*simulator.temps*simulator.Te;  
 }
  
  void draw_asteroide()
  {
    

    image(asteroide_img, originx+posx-asteroide_img.width/2, originy+posy-asteroide_img.height/2);
  }
}



