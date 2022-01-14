class enemy extends gameobject {

gif currentaction;
  enemy() {
    roomx=1;
    roomy=1;
    location=new PVector(width/2-100, height/2-100);
    velocity= new PVector(0, 0);
    hp=100;
    size=30;
  }

  enemy(int x, int y) {
    currentaction=slimezero;
    roomx=x;
    roomy=y;
    location=new PVector(random(200,600), random(200,400));
    velocity= new PVector(0, 0);
    hp=40;
    size=80;
  }

  enemy(int hp_, int s, int x, int y) {
    location=new PVector(width/2 + random(-100, 100), height/2 + random(-100, 100));
    velocity= new PVector(0, 0);
    roomx=x;
    roomy=y;
    size=s;
    hp=hp_;
  }
  void show() {
    textSize(10);
    fill(brown);
    currentaction.show(location.x,location.y,size/1.5,size);
    fill(white);
    text(hp, location.x, location.y-30);
  }

  void act() {
    super.act();
    int i =0;
    while (i<myobjects.size()) {
      gameobject obj=myobjects.get(i);
      if (obj instanceof bullet && iscollidingwith(obj)) {
        hp=hp-(int(obj.velocity.mag())+extradamage);
        obj.hp=0;
        if (hp<=0) { 
          myobjects.add (new message(location.x, location.y, roomx,roomy));
          xp=xp+10;
          explode(30);
          int r=int(random(0, 3));
          if (r==0) 
            myobjects.add(new droppedgun(location.x, location.y, roomx, roomy));
          if (r==1) 
            myobjects.add(new droppedhealth(location.x, location.y, roomx, roomy));
        }
      }

      i++;
    }
  }
}
