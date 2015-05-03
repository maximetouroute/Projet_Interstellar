
class Simulator
{
  // Variable qui s'incrémente de 1 en 1 (unités de temps)
  int temps;

  // La période d'echantillonnage
  float Te;
  
  // Le nombre de positions stockées
  int STOCK_NUMBER = 4;
  
  float angle_observe;
  // Les elements dans le simulateur
  Observateur observateur = new Observateur();
  Asteroide asteroide = new Asteroide();
  
  FloatList angles_observes = new FloatList();
  FloatList positions_x = new FloatList();
  FloatList positions_y = new FloatList();

//Pour retrouver la position et la vitesse initiale de l'astéroide
  Calculator calculator;

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
    
    // On ajoute les nouvelles valeurs dans la liste
    
    angles_observes.append(angle_observe);
    positions_x.append(observateur.posx);
    positions_y.append(observateur.posy);
    
    if( angles_observes.size() > STOCK_NUMBER ) // TODO: pas très rigoureux comme test
    {
      angles_observes.remove(0);
      positions_x.remove(0);
      positions_y.remove(0);  
      calcul_pos_vit_asteroide(); 
    }
    
    
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
  
  void calcul_pos_vit_asteroide(){
      calculator=new Calculator(angles_observes, positions_x, positions_y);
      calculator.solveSystem();
  }

  void draw_angle_observe()
  {
    
    stroke(255, 255, 255);
    strokeWeight(1);
    line(observateur.posx+originx, 0, observateur.posx+originx, observateur.posy+originy);

    stroke(255, 255, 0);
    strokeWeight(2);
    line(asteroide.posx+originx, asteroide.posy+originy, observateur.posx+originx, observateur.posy+originy);

    strokeWeight(0);
    ellipseMode(CENTER);
    fill(0, 200, 0, 100);
    //triangle(asteroide.posx+originx, asteroide.posy+originy, observateur.posx+originx, observateur.posy+originy, asteroide.posx+originx, originy+observateur.rayon);
    
   if(observateur.posx < asteroide.posx)
   {
     fill(0, 200, 0, 100);
     arc(observateur.posx+originx, observateur.posy+originy, 200, 200, -HALF_PI, -radians(90-angle_observe), PIE);
     
     noFill();
     stroke(200,0,0);
     strokeWeight(2);
     arc(observateur.posx+originx, observateur.posy+originy, 200, 200, -HALF_PI, -radians(90-angle_observe), OPEN);
   }     
   else
   {
     fill(0, 200, 0, 100);
     arc(observateur.posx+originx, observateur.posy+originy, 200, 200, HALF_PI+radians(180-angle_observe), PI+HALF_PI, PIE);  // Un peu sale mais bon.
     
     noFill();
     stroke(200,0,0);
     strokeWeight(2);
     arc(observateur.posx+originx, observateur.posy+originy, 200, 200, HALF_PI+radians(180-angle_observe), PI+HALF_PI, OPEN);  // Un peu sale mais bon.
   }


    textAlign(CENTER, CENTER);
    fill(255, 255, 255);
    
    
    textSize(20);
     text("Angle : " + round(angles_observes.get(3)) + "°", 450, 580); 
   
    textSize(10);
    text(round(angles_observes.get(2)), 520, 585);
    text(round(angles_observes.get(1)), 550, 585); 
    text(round(angles_observes.get(0)), 580, 585); 
    
    
    // text("Angle Observateur:" + observateur.angle, 500, 550);
  }
}

