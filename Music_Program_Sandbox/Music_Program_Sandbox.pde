//Minim Library: use Sketch / Import Library / Add Library
//Minim Library: use Sketch / Import Library / Minim
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

// Global Variables
Minim minim; //creates object to access all functions
AudioPlayer song1;

void setup() {
  size(500,400);
  minim = new Minim(this);
  song1 = minim.loadFile("../Music/Polo G Chosen1.mp3");
  song1.play();
}
