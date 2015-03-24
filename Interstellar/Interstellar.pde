Observateur observateur = new Observateur();
Asteroide asteroide = new Asteroide();

PImage background_img;
PImage test;
int x = 0;
int y = 0;

void setup() 
{
  background_img = loadImage("background.jpg");
  
  // Ouverture de la fenêtre
  size(window_size_x, window_size_y);
  background(background_img);
  stroke(255);
  frameRate(framerate);
 
  
  
  observateur.setup_observateur();
   asteroide.setup_asteroide();
  
}



void draw() {
  
  //x = constrain(x, 0, background_img.width - window_size_x);
  //y = constrain(y, 0, background_img.height - window_size_y);
  
  //image(background_img, x, y); 

  // Mise à jour des données du jeu.
   observateur.update_observateur();
   asteroide.update_asteroide();
   
   background(background_img);
  observateur.draw_observateur();
  asteroide.draw_asteroide();
  


}


/**
 * Gestion des évènements clavier
 */
void keyPressed() {
}


void stop()
{
}

