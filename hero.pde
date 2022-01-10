class hero extends gameobject {

  float speed;
  int healthtimer, healththreshold;
  int maxhp;
  gif currentaction;
  weapon myweapon;
  hero() {
    super();
        location = new PVector (150, 150);
    hp= 50;
    maxhp=100;
    speed=5;
    roomx =1;
    roomy=1;
    size=40;
    healthtimer=0;
    healththreshold=100;
    myweapon = new weapon();
    currentaction=mandown;
  }

  void show() {
    fill(blue);
    stroke(black);
    strokeWeight(2);
    fill(white);
    textSize(15);
    text(hp, location.x, location.y-40);
    imageMode(CENTER);
    currentaction.show(location.x, location.y, size/1.5, size);
  }
  void act() {
    super.act();
    if (hp>maxhp)hp=maxhp;
    if (wkey) velocity.y = -speed;
    if (akey) velocity.x = -speed;
    if (skey) velocity.y = speed;
    if (dkey) velocity.x = speed;

    if (!wkey && !skey) velocity.y=0;
    if (!akey && !dkey) velocity.x=0;


    if (abs(velocity.y)>abs(velocity.x)) {
      if (velocity.y>=0) currentaction=mandown;
      else currentaction=manup;
    } else {
      if (velocity.x>0) currentaction=manright;
      else currentaction=manleft;
    }
    if (velocity.y==0 && velocity.x==0) currentaction=mandown;

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


    myweapon.update();
    if (space)myweapon.shoot();



    int i =0;
    while (i<myobjects.size()) {
      gameobject obj=myobjects.get(i);
      if (obj instanceof enemybullet && iscollidingwith(obj)) {
        hp=hp-int(obj.velocity.mag());
        obj.hp=0;
      }
      if (obj instanceof droppedgun && iscollidingwith(obj)) {
        droppedgun gun = (droppedgun) obj;
        myweapon=gun.w;  
        gun.hp=0;
      }
      if (obj instanceof droppedhealth && iscollidingwith(obj)) {
        droppedhealth health = (droppedhealth) obj;
        hp=hp+10;
        health.hp=0;
      }

      if (healthtimer>healththreshold) {
        if (obj instanceof enemy && iscollidingwith(obj)) {
          hp=hp-1;
          healthtimer=0;
        }
      } else { 
        healthtimer++;
      }
      i++;
    }
    if (hp==0) {
      mode=gameover;
    }
  }
}
