

PImage background_img;

Simulator simulator = new Simulator();

void setup() 
{
  background_img = loadImage("background.jpg");
  
  // Ouverture de la fenêtre
  size(window_size_x, window_size_y);
  background(background_img);
  stroke(255);
  frameRate(framerate);
 
  simulator.setup_simulator();
}



void draw() {
  
    simulator.update_simulator();
   
   background(background_img);

    simulator.draw_simulator();

}


/**
 * Gestion des évènements clavier
 */
void keyPressed() {
}


void stop()
{
}

