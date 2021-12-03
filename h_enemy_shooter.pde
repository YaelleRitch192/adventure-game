class shooter extends enemy {
  int shottimer;
  int threshold;

  shooter(int x, int y) {
    super(shooter_hp, shoooter_size, x, y);
    shottimer=0;
    threshold=60;
  }
  void show() {
    fill(black);
    ellipse(location.x, location.y, size, size);
    fill(white);
    text(hp, location.x, location.y);
  }

  void act() {
    super.act();
    if (shottimer>= threshold) { 
      PVector aimvector=new PVector (myhero.location.x-location.x, myhero.location.y-location.y);
      myobjects.add(new enemybullet(aimvector, location.x, location.y, blue, enemybullet_size));
      shottimer=0;
    } else {
      shottimer++;
    }
  }
}
