class shotgun extends weapon {

  shotgun() {
    super(50, 6);
  }
  void shoot() {
    if (shottimer>= threshold) {
      PVector aimvector = new PVector(mouseX +random(-60, 60)-myhero.location.x, mouseY+random(-60, 60)-myhero.location.y);
      PVector aimvectorone = new PVector(mouseX +random(-60, 60)-myhero.location.x, mouseY+random(-60, 60)-myhero.location.y);
      PVector aimvectortwo = new PVector(mouseX +random(-60, 60)-myhero.location.x, mouseY+random(-60, 60)-myhero.location.y);
      PVector aimvectorthree = new PVector(mouseX +random(-60, 60)-myhero.location.x, mouseY+random(-60, 60)-myhero.location.y);
      aimvector.setMag(bulletspeed);
      aimvectorone.setMag(bulletspeed);
      aimvectortwo.setMag(bulletspeed);
      aimvectorthree.setMag(bulletspeed);
      myobjects.add(new bullet(aimvector, blue, 10));
      myobjects.add(new bullet(aimvectorone, blue, 10));
      myobjects.add(new bullet(aimvectortwo, blue, 10));
      myobjects.add(new bullet(aimvectorthree, blue, 10));
      shottimer=0;
    }
  }
}
