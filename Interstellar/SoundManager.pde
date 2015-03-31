/* Gestion du son 
*  18/03/2015
*  Maxime Touroute
*/


import ddf.minim.*;


Minim music_minim;
AudioPlayer music_player;

void setup_sound()
{
  music_minim = new Minim(this);
 
}

void play_music()
{
  music_player = music_minim.loadFile("theme_music.mp3", 1024);
  music_player.play();
}



void stop_sound()
{
  music_player.close();
  music_minim.stop(); 
}


