class weapon {

  int shottimer;
  int threshold;
  int bulletspeed;


  weapon() {
    shottimer = 0;
    threshold = 30;
    bulletspeed = 5;
  }

  weapon(int thr, int bs) {
     shottimer = 0;
    threshold = thr;
    bulletspeed = bs;   
  }
  
  void update(){
   shottimer++; 
  }
  
  void shoot(){
    if(shottimer>= threshold){
      PVector aimvector = new PVector(mouseX-myhero.location.x,mouseY-myhero.location.y);
      aimvector.setMag(bulletspeed);
      myobjects.add(new bullet(aimvector,blue,10));
      shottimer=0;
      
    }
  }
}
