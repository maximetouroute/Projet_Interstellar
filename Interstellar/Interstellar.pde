void setup() 
{
  // Ouverture de la fenêtre
  size(window_size_x, window_size_y);
  background(0);
  stroke(255);
  frameRate(framerate);
  
  setup_simulator();
  
}



void draw() {
  
  // Mise à jour des données du jeu.
  update_simulator();
  
  draw_simulator();


}


/**
 * Gestion des évènements clavier
 */
void keyPressed() {
}


void stop()
{
}

