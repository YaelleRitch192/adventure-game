boolean mouseReleased;
boolean hadPressed;
boolean wkey, skey, akey, dkey;
PFont   introfont;

//color pallette
color blue   = #191A5D;
color green  = #88A65E;
color brown   = #8C2318;
color darkgreen = #255506;
color yellow = #BF9F41;
color black  = #000000;
color white  = #FFFFFF;

int mode;
final int intro =1;
final int game =2;
final int pause =3;
final int gameover =4;

//gifs
gif forest;
//buttons
Button startbutton;

//
ArrayList<gameobject> myobjects;
//ArrayList<darknesscell> darkness;
hero myhero;

void setup() {
  size(800, 600);  
  imageMode(CENTER);
  rectMode(CENTER);
  textAlign(CENTER, CENTER);
  mode=intro;
  //fonts
  introfont=createFont("Night Zone.ttf", 100);
  //gifs
  forest=new gif(28, "frame_", "_delay-0.03s.gif");
  //buttons
  startbutton  = new Button("Start", width/2, 400, 200, 150, green, darkgreen);
  //
  myhero = new hero();
  myobjects = new ArrayList<gameobject>(1000);
  myobjects.add(myhero);
}



void draw() {
  //button
  if (mousePressed) hadPressed = true;
  else if (hadPressed && !mousePressed) {
    mouseReleased = true;
    hadPressed = false;
  } else if (mouseReleased)mouseReleased=false;

  if (mode==intro) {
    intro();
  } else if (mode==game) {
    game();
  } else if (mode==pause) {
    pause();
  } else if (mode==gameover) {
    gameover();
  }
}
 void keyPressed() { 
if (key=='w' ||key=='W') wkey=true;
if (key=='s'||key=='S')skey=true;
if (key=='a' ||key=='A')akey=true;
if (key=='d'||key=='D')dkey=true;
 }  
void keyReleased() {
  if (key=='w' ||key=='W')wkey=false;
  if (key=='s'||key=='S')skey=false;
  if (key=='a' ||key=='A')akey=false;
  if (key=='d'||key=='D')dkey=false;
}
