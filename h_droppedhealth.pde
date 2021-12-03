class droppedhealth extends droppeditem {
  

  droppedhealth(float x, float y, int rx, int ry){
    super();
    type=health;
    location = new PVector (x,y);
    size = 20;
    roomx= rx;
    roomy = ry;
    c=red;
  }
  
  void show(){
   image(healthpotion,location.x,location.y,20,20); 
  }
  
}
