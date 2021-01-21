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
AudioPlayer song2;
AudioPlayer song3;
int numberOfSongs = 3;
AudioPlayer[] song = new AudioPlayer[numberOfSongs]; 
AudioMetaData[] songMetaData = new AudioMetaData[numberOfSongs]; 
int loopIntNum = 1; 
int currentSong = numberOfSongs - numberOfSongs; 


void setup() {
  size(500,400);
  minim = new Minim(this);
  song[currentSong] = minim.loadFile("../Music/Polo G Chosen1 .mp3");
  song[currentSong+=1] = minim.loadFile("../Music/PoloG 21.mp3");
  song[currentSong+=1] = minim.loadFile("../Music/PoloG EPI.mp3");
  
  //
  currentSong = numberOfSongs - numberOfSongs;
  for (int i=currentSong; i<numberOfSongs; i++) {
   songMetaData[i] = song[0].getMetaData(); 
}
//
 println("Start of Console"); 
  println("Click the Console to Finish Starting this program"); 
  println("Press keyboard to test: P, etc.");
  //
  for ( int i=currentSong; i<numberOfSongs; i++) {
    println("File Name: ", songMetaData[i].fileName() );
    println("Song Length (in milliseconds); ", songMetaData[i].length() );
    println("Song Length (in seconds): ", songMetaData[i].length()/1000 );
    println("Song Length (in mintues and seconds): ", songMetaData[i].length()/1000/60, "minutes", (songMetaData[i].length()/1000)-(songMetaData[i].length()/1000/60 *60), "seconds" );
    println("Song Title: ", songMetaData[i].title() );
    println("Author: ", songMetaData[i].author() );
    println("Composer: ", songMetaData[i].composer() );
    println("Orchestra: ", songMetaData[i].orchestra() );
    println("Albums: ", songMetaData[i].album() );
    println("Disk: ", songMetaData[i].disc() );
    println("Publisher: ", songMetaData[i].publisher() );
    println("Date Release: ", songMetaData[i].date() );
    println("Copyright: ", songMetaData[i].copyright() );
    println("Comments: ", songMetaData[i].comment() );
    println("Lyrics: ", songMetaData[i].lyrics() );
    println("Track: ", songMetaData[i].track() );
    println("Genre: ", songMetaData[i].genre() );
    println("Encoded: ", songMetaData[i].encoded() );
  }//End Console Output
  //
}
void draw() {
}//End draw()

void keyPressed() {
  //
  if ( key == 'p' || key == 'P' ) {//Play-Pause Button
    if ( song[currentSong].isPlaying() ) {
      song[currentSong].pause();
    } else if ( song[currentSong].position() == song[currentSong].length() ) {//.legnth() = end
      song[currentSong].rewind();
      song[currentSong].play();
    } else {
      song[currentSong].play();
    }
  }//End of Play-Pause Button
  //
  if (key == 's' || key == 'S') {//Stop Button
    if ( song[currentSong].isPlaying() ) {
      song[currentSong].pause();
      song[currentSong].rewind();
    } else if ( song[currentSong].position() == song[currentSong].length() ) {//.legnth() = end
      song[currentSong].rewind();
    } else { //Song is not playing
      song[currentSong].rewind();
    }
  }// End Stop Button
  //
  if ( key == 'f' || key == 'F') song[currentSong].skip(1000); // skip forward 1 second (1000 milliseconds)
  if ( key == 'r' || key == 'R') song[currentSong].skip(-1000); // skip backward 1 second (1000 milliseconds)
  //
  if ( key == 'l' || key =='L' ) song[currentSong].loop(loopIntNum); //Loop Button
  //
  //Next Button: 
  if ( key == 'n' || key == 'N' ) {
    if ( song[currentSong].isPlaying() ) {
      song[currentSong].pause();
      song[currentSong].rewind();
      if ( currentSong == numberOfSongs-1 ) {
        currentSong = numberOfSongs - numberOfSongs;
      } else {
        currentSong++;
      }
      song[currentSong].play();
    } else { 
      song[currentSong].rewind();
      if ( currentSong == numberOfSongs-1 ) {
        currentSong = numberOfSongs - numberOfSongs;
      } else {
        currentSong++;
      }
    }
  }//End Next Button
  //
  if (key == 'b' || key == 'B') {
    currentSong--;
    if ( song[currentSong].isPlaying() ) {
      song[currentSong].pause();
      song[currentSong].rewind();
      if ( currentSong == numberOfSongs - numberOfSongs ) {
        currentSong = numberOfSongs - 1;
      } else {
        currentSong -= 1;
      }
      song[currentSong].play();
    } else { 
      song[currentSong].rewind();
      if ( currentSong == numberOfSongs - numberOfSongs ) {
        currentSong = numberOfSongs-1;
      } else {
        currentSong -= 1;
      }
      println(currentSong);
    }
  }
  //
}// End keyPressed()
//
void mousePressed() {}//End mousePressed()
