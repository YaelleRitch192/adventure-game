class hero extends gameobject {

  float speed;
  int roomx, roomy;

  hero() {
    super();
    speed=5;
    roomx =1;
    roomy=1;
  }

  void show() {
    fill(blue);
    stroke(black);
    strokeWeight(2);
    circle(location.x, location.y, 40);
  }
  void act() {
    super.act();

    if (wkey) velocity.y = -speed;
    if (akey) velocity.x = -speed;
    if (skey) velocity.y = speed;
    if (dkey) velocity.x = speed;
    
    if(!wkey && !skey) velocity.y=0;
    if(!akey && !dkey) velocity.x=0;
    
  }
}
