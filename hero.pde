class hero extends gameobject {

  float speed;
  machinegun mymachinegun;
  sniper mysniper;
  shotgun myshotgun;
  hero() {
    super();
    speed=5;
    roomx =1;
    roomy=1;
    size=40;
    mymachinegun = new machinegun();
    mysniper = new sniper();
    myshotgun = new shotgun();
  }

  void show() {
    fill(blue);
    stroke(black);
    strokeWeight(2);
    circle(location.x, location.y, size);
  }
  void act() {
    super.act();

    if (wkey) velocity.y = -speed;
    if (akey) velocity.x = -speed;
    if (skey) velocity.y = speed;
    if (dkey) velocity.x = speed;

    if (!wkey && !skey) velocity.y=0;
    if (!akey && !dkey) velocity.x=0;


    if (northroom !=#FFFFFF && location.y == height*0.1 && location.x>= width/2-50 && location.x <= width/2+50) {
      roomy--;
      location = new PVector(width/2, height*0.9-10);
    }

    if (eastroom !=#FFFFFF && location.x == width*0.9 && location.y>= height/2-50 && location.y <= height/2+50) {
      roomx++;
      location = new PVector(width*0.1+10, height/2);
    }
    if (southroom !=#FFFFFF && location.y == height*0.9 && location.x>= width/2-50 && location.x <= width/2+50) {
      roomy++;
      location = new PVector(width/2, height*0.1+10);
    }
    if (westroom !=#FFFFFF && location.x == width*0.1 && location.y>= height/2-50 && location.y <= height/2+50) {
      roomx--;
      location = new PVector(width*0.9-10, height/2);
    }

    mymachinegun.update();
    if (onekey) mymachinegun.shoot();
    mysniper.update();
    if (twokey) mysniper.shoot();
    myshotgun.update();
    if (threekey) myshotgun.shoot();
  }
}
