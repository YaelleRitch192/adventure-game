class bullet extends gameobject {

  int timer;
  color bulletcolour;



  bullet(PVector aimvector, int colour, int s) {
    location=myhero.location.copy();
    bulletcolour= colour;
    size=s;
    velocity=aimvector.copy();
    timer=40;
    hp=1;
    s=10;
    velocity.add(myhero.velocity);
    roomx=myhero.roomx;
    roomy=myhero.roomy;
  }

  void show() {
    stroke(255);
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
      myobjects.add(new particles(location.x, location.y));
      myobjects.add(new particles(location.x, location.y));
      myobjects.add(new particles(location.x, location.y));
      myobjects.add(new particles(location.x, location.y));
      myobjects.add(new particles(location.x, location.y));
      myobjects.add(new particles(location.x, location.y));
      myobjects.add(new particles(location.x, location.y));
      myobjects.add(new particles(location.x, location.y));
      myobjects.add(new particles(location.x, location.y));
      myobjects.add(new particles(location.x, location.y));
      myobjects.add(new particles(location.x, location.y));
      myobjects.add(new particles(location.x, location.y));
      myobjects.add(new particles(location.x, location.y));
      myobjects.add(new particles(location.x, location.y));
      myobjects.add(new particles(location.x, location.y));
      myobjects.add(new particles(location.x, location.y));
      myobjects.add(new particles(location.x, location.y));
    }
  }
}
