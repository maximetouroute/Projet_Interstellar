Simulator simulator = new Simulator();
Background background = new Background();


int STATE;
int MOVEMENT_STATE = 0;
int SNAPSHOT_STATE = 1;

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
  
  if (STATE == MOVEMENT_STATE)
  {
    background.update_background();
  simulator.update_simulator();

  background.draw_background();
  simulator.draw_simulator();
  }
  else if (STATE == SNAPSHOT_STATE)
  {
    textSize(70);
    textAlign(CENTER, CENTER);
    fill(255, 255, 255);
    text("SNAPSHOT!", 250, 250); 
  }
  
}


/**
 * Gestion des évènements clavier
 */
void keyPressed() 
{
   if (key == 'p')
   {
      noLoop();
   }
   if (key == 'o')
   {
      loop();
   }
   if(key== 'x')
   {
     STATE = SNAPSHOT_STATE;
   }
   
   
}


void stop()
{
  stop_sound();
}

