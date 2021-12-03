class particles extends gameobject {
  int t;
  PVector direction;
  int i;


  particles(float x, float y, int rx, int ry) {
    //////////////////////////////////////need a roomx and roomy
    hp=1;
    size=5;
    t=255;
    roomx=rx;
    roomy=ry;
    location=new PVector(x, y);
    velocity=new PVector (int(random(1, 5)), int(random(1, 5)));
    velocity.rotate(radians(random(0, 360)));
    velocity.setMag(5);
  }
  void show() {
    noStroke();
    fill(random(200,255), 0, 0, t);
    square(location.x, location.y, size);
  }

  void act() {
    super.act();
    t=t-20;
    if (t<=0)hp=0;
  }
}
