/*
L'asteroide
*/
class Asteroide
{
  float x_initial = -5;
  float y_initial = -10;
  float posx;
  float posy;
  float prev_posx;
  float prev_posy;
  
  float vitesse_x;
  float vitesse_y;

  float Te;
  int temps;
  
  void setup_asteroide()
  {
    Te = 0.1;
    vitesse_x = -1;
    vitesse_y = -1;
    posx = x_initial;
    posy = y_initial;
       
  }
  
 void update_asteroide()
 {
   temps++;
   prev_posx = posx;
   prev_posy = posy;
   
   posx = x_initial + vitesse_x*temps*Te;
   posy = y_initial + vitesse_y*temps*Te;  
 }
  
  void draw_asteroide()
  {
    fill(235,207,171);
    ellipse(originx+posx, originy+posy, 25, 25);    
  }
}



