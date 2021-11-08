boolean mouseReleased;
boolean hadPressed;
boolean wkey, skey, akey, dkey, space, onekey, twokey, threekey;
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
//map
PImage map;
color northroom, eastroom, southroom, westroom;
//darkness
float size;
ArrayList<darknesscell> darkness;

//
ArrayList<gameobject> myobjects;

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
  //images
  map=loadImage("map.png");
  //
  myhero = new hero();
  myobjects = new ArrayList<gameobject>(1000);
  myobjects.add(myhero);
  //darkness
  darkness = new ArrayList<darknesscell>(1000);
  int size = 5;
  int x =-5;
  int y =0;
  int i=0;
  while ( i< 20000) {
    x=x+size;
    if (x>width-size) {
      y=y+5;
      x=0;
    } 
    darkness.add(new darknesscell(x, y, size));
    i++;
  }   
  //enemy
  myobjects.add(new enemy());
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
  if (key == ' ') space=true;
  if (key=='1')onekey=true;
  if (key=='2')twokey=true;
  if (key=='3')threekey=true;
}  
void keyReleased() {
  if (key=='w' ||key=='W')wkey=false;
  if (key=='s'||key=='S')skey=false;
  if (key=='a' ||key=='A')akey=false;
  if (key=='d'||key=='D')dkey=false;
  if (key == ' ') space=false;
  if (key=='1')onekey=false;
  if (key=='2')twokey=false;
  if (key=='3')threekey=false;
}
