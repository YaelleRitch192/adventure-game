class enemybullet extends gameobject {

  int timer;
  color bulletcolour;
int rx,ry;


  enemybullet(PVector aimvector, float x, float y, int colour, int s) {    
    location.x=x;
    location.y=y;
    bulletcolour= colour;
    size=s;
    velocity=aimvector.copy();
    velocity.setMag(2);
    timer=100;
    hp=1;
    s=10;
    roomx=myhero.roomx;
    roomy=myhero.roomy;
  }

  void show() {
    stroke(white);
    fill(bulletcolour);
    stroke(bulletcolour);
    ellipse(location.x, location.y, size, size);
  }

  void act() {
    location.add(velocity);
    timer--;
    if (timer==0) {
      hp=0;
    }
    if (location.x<width*0.1|| location.x> width*0.9||location.y<height*0.1|| location.y>height*0.9) {
      hp=0;
      explode(10);
    }
  }
}
