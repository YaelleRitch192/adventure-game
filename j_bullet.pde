class bullet extends gameobject {

  int timer;



  bullet(PVector aimvector, int colour, int s) {
    location=myhero.location.copy();
    c= colour;
    size=s;
    velocity=aimvector.copy();
    timer=40;
    hp=1;
    s=10;
    roomx=myhero.roomx;
    roomy=myhero.roomy;
  }

  void show() {
    stroke(white);
    fill(c);
    stroke(c);
    ellipse(location.x, location.y, size, size);
  }

  void act() {
    location.add(velocity);
    timer--;
    if (timer==0) {
      hp=0;
      explode(15);
    }
    if (location.x<width*0.1|| location.x> width*0.9||location.y<height*0.1|| location.y>height*0.9) {
      hp=0;
      explode(15);
    }
  }
}
