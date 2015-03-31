Simulator simulator = new Simulator();
Background background = new Background();


void setup() {  
  // Ouverture de la fenêtre
  size(window_size_x, window_size_y);
  stroke(255);
  frameRate(framerate);

  simulator.setup_simulator();
  background.setup_background();
 
  setup_sound();
  play_music();
}



void draw() {
  
  background.update_background();
  simulator.update_simulator();

  background.draw_background();
  simulator.draw_simulator();
}


/**
 * Gestion des évènements clavier
 */
void keyPressed() {
}


void stop()
{
  stop_sound();
}

