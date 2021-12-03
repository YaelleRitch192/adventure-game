class machinegun extends weapon {
   
  machinegun() {
    super(machinegun_threshold, macheinegun_bulletspeed);
  }
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

class sniper extends weapon {
   
  sniper() {
    super(sniper_threshold, snipern_bulletspeed);   
  }
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

class shotgun extends weapon {

  shotgun() {
    super(shotgun_threshold, shotgun_bulletspeed);
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
      myobjects.add(new bullet(aimvector, blue, bulletsize));
      myobjects.add(new bullet(aimvectorone, blue, bulletsize));
      myobjects.add(new bullet(aimvectortwo, blue, bulletsize));
      myobjects.add(new bullet(aimvectorthree, blue, bulletsize));
      shottimer=0;
    }
  }
}
