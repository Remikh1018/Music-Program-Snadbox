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
  song1 = minim.loadFile("../Music/Polo G Chosen1 .mp3");
  song1.play();
}

void draw() {
}//End draw()

void keyPressed() {
  //
  if ( key == 'p' || key == 'P' ) {//Play-Pause Button
    if ( song1.isPlaying() ) {
      song1.pause();
    } else if ( song1.position() == song1.length() ) {//.legnth() = end
      song1.rewind();
      song1.play();
    } else {
      song1.play();
    }
  }//End of Play-Pause Button
  //
  if (key == 's' || key == 'S') {//Stop Button
    if ( song1.isPlaying() ) {
      song1.pause();
      song1.rewind();
    } else if ( song1.position() == song1.length() ) {//.legnth() = end
      song1.rewind();
    } else { //Song is not playing
      song1.rewind();
    }
  }// End Stop Button
  //
  if ( key == 'f' || key == 'F') song1.skip(1000); 
  if ( key == 'r' || key == 'R') song1.skip(-1000);
  //
  if ( key == 'l' || key == 'L') song1.loop(loopIntNum); 
  //
}// End keyPressed()
//
void mousePressed() {}//End mousePressed()
