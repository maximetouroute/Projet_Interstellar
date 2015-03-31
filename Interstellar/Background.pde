/*
Le background
 */
class Background
{
  PImage background_img;
  float angle;
  int offset_x = 0;

  void setup_background()
  {
    background_img = loadImage("moving_background.png");
  }

  void update_background()
  {
    angle += 0.02;
  }

  void draw_background()
  {
    pushMatrix();

    translate(offset_x, 0);
    rotate(radians(angle));
    imageMode(CENTER);
    image(background_img, 0, 0);

    popMatrix();
  }
}

