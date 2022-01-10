
import processing.pdf.*;

boolean mouseReleased;
boolean hadPressed;
boolean wkey, skey, akey, dkey, space, onekey, twokey, threekey;
PFont   introfont;
int xp;
int extradamage;
int extralight;

//color pallette
color blue   = #191A5D;
color green  = #88A65E;
color brown   = #8C2318;
color darkgreen = #255506;
color yellow = #BF9F41;
color black  = #000000;
color white  = #FFFFFF;
color red = #FF0303;
color purple = #9F66C4;
color cyan = #41BFB4;


int mode;
final int instructions = 5;
final int intro =1;
final int game =2;
final int pause =3;
final int gameover =4;

//gifs
gif forest;
gif manup;
gif mandown;
gif manleft;
gif manright;
gif zombieup;
gif zombiedown;
gif zombieleft;
gif zombieright;
gif slimezero;
gif slimeone;
gif slimetwo;
gif slimethree;
gif slimefour;

//pics
PImage healthpotion;
PImage droppedgun;
PImage sprite;
PImage shop;
PImage winportal;
//buttons
Button startbutton;
Button restartbutton;
Button hpbutton;
Button speedbutton;
Button damagebutton;
Button upgradeshopbutton;
Button extralightbutton;
Button instructionsbutton;
//map
PImage map;
color northroom, eastroom, southroom, westroom;
//darkness
float size;
ArrayList<darknesscell> darkness;
//
ArrayList<gameobject> myobjects;

hero myhero;
//weapons
final int machinegun_threshold = 10;
final int macheinegun_bulletspeed = 5;
final int shotgun_threshold = 50;
final int shotgun_bulletspeed = 6;
final int sniper_threshold = 60;
final int snipern_bulletspeed = 8;
final int bulletsize=10;
//enemy
final int follower_hp= 100;
final int follower_size=50;
final int lurker_hp=100;
final int lurker_size=50;
final int shooter_hp=100;
final int shoooter_size=50;
final int enemybullet_size=10;
final int grower_hp=100;
final int grower_size=50;
//dropped items
final int ammo=0;
final int health=1;
final int gun = 2;
boolean shotgun;
boolean machinegun;
boolean sniper;
boolean shotgununlocked;
boolean machinegununlocked;
boolean sniperunlocked;




void setup() {
  size(800, 600);  
  imageMode(CENTER);
  rectMode(CENTER);
  textAlign(CENTER, CENTER);
  mode=intro;
  xp=0;
  extradamage=0;
  extralight=0;
  //fonts
  introfont=createFont("Night Zone.ttf", 100);
  //images
  healthpotion= loadImage("healthpotion.jpg"); 
  droppedgun=loadImage("gun.png");
  sprite=loadImage("sprite.png");
  shop=loadImage("shop.png");
  winportal=loadImage("winportal.png");
  //gifs
  forest=new gif(28, 10, "frame_", "_delay-0.03s.gif");
  manup = new gif(4, 10, "man/up/sprite_", ".png");
  mandown = new gif(4, 10, "man/down/sprite_", ".png");
  manleft= new gif(4, 10, "man/left/sprite_", ".png");
  manright = new gif(4, 10, "man/right/sprite_", ".png");
  zombieup = new gif(4, 10, "zombie/up/Zombie_0", ".png");
  zombiedown = new gif(4, 10, "zombie/down/Zombie_0", ".png");
  zombieleft= new gif(4, 10, "zombie/left/Zombie_0", ".png");
  zombieright = new gif(4, 10, "zombie/right/Zombie_0", ".png");
  slimezero = new gif(5, 10, "Slime/Slime_", ".png");
  //buttons
  instructionsbutton  = new Button("instructions", 500, 350, 300, 150, green, darkgreen);
  startbutton  = new Button("Start", 150, 350, 200, 150, green, darkgreen);
  restartbutton  = new Button("Restart", width/2, 400, 200, 150, green, darkgreen);
  hpbutton = new   Button("*", 200, 250, 30, 30, blue, yellow);
  speedbutton = new   Button("*", 200, 350, 30, 30, blue, yellow);
  damagebutton = new   Button("*", 200, 450, 30, 30, blue, yellow);
  upgradeshopbutton =   new Button("Exit", 600, 160, 60, 30, blue, yellow);
  extralightbutton = new Button("*", 200, 550, 30, 30, blue, yellow);
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
  x=0;
  y=0;
  while (y< map.height) {
    color roomcolour = map.get(x, y);
    if (roomcolour == green) {
      myobjects.add(new enemy(x, y));
      myobjects.add(new enemy(x, y));
      myobjects.add(new enemy(x, y));
    }
    if (roomcolour==blue) {
      myobjects.add(new follower(x, y));
    }
    if (roomcolour==purple) {
      myobjects.add(new shooter(x, y));
      myobjects.add(new shooter(x, y));
    }
    if (roomcolour==yellow) {
      myobjects.add(new grower(x, y));
    }
    if (roomcolour==black) {
      myobjects.add(new upgradeshop(x, y));
    }
    if (roomcolour==cyan) {
      myobjects.add(new winportal(x, y));
    }
    if (roomcolour==red) {
      myobjects.add(new shooter(x, y));
      myobjects.add(new shooter(x, y));
      myobjects.add(new follower(x, y));
    }
    x++;
    if (x==map.width) {
      x=0;
      y++;
    }
  }
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
  } else if (mode==instructions) {
    instructions();
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
