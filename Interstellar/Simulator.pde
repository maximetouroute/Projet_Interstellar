
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
    draw_angle_observe();
    asteroide.draw_asteroide();
    observateur.draw_observateur();
  }


  void calcul_angle_observe()
  {


    // Definition du vecteur reliant l'observateur a l'asteroide

      PVector vector = new PVector(observateur.posx - asteroide.posx, observateur.posy - asteroide.posy);
    PVector vec_vertical = new PVector (0, 1);

    //angle_observe = acos( (vector.x * vec_vertical.x + vector.y * vec_vertical.y) / (sqrt( sq(vector.x) + sq(vector.y) ) * sqrt( sq(vec_vertical.x) + sq(vec_vertical.y) )));
    angle_observe = degrees(PVector.angleBetween(vector, vec_vertical));
  }

  void draw_angle_observe()
  {
    stroke(255, 255, 255);
    strokeWeight(1);
    line(asteroide.posx+originx, 0, asteroide.posx+originx, window_size_y);

    stroke(255, 255, 0);
    strokeWeight(2);
    line(asteroide.posx+originx, asteroide.posy+originy, observateur.posx+originx, observateur.posy+originy);

    strokeWeight(0);
    fill(0, 200, 0, 100);
    triangle(asteroide.posx+originx, asteroide.posy+originy, observateur.posx+originx, observateur.posy+originy, asteroide.posx+originx, originy+observateur.rayon);

    textSize(20);
    textAlign(CENTER, CENTER);
    fill(255, 255, 255);
    text("Angle : " + round(angle_observe) + "°", 500, 550); 
    // text("Angle Observateur:" + observateur.angle, 500, 550);
  }
}

