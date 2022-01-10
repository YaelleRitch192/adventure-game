class droppedgun extends droppeditem {


  droppedgun(float x, float y, int rx, int ry) {
    super();
    type=gun;
    int r=int(random(0, 3));
    if (r==0) {
      w= new shotgun();
   //   shotgun=true;
      shotgununlocked=true;
    }
    if (r==1) {
      w= new  machinegun();
      shotgun=false;
      machinegun=true;
      sniper=false;
      machinegununlocked=true;
    }
    if (r==2) {
      w= new  sniper();
      shotgun=false;
      machinegun=false;
      sniper=true;
      sniperunlocked=true;
    }
    location = new PVector (x, y);
    size = 20;
    roomx= rx;
    roomy = ry;
    c=yellow;
  }

  void show() {
    image(droppedgun, location.x, location.y, 20, 20);
  }
}
