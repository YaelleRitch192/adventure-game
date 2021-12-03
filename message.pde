class message extends gameobject{
  
  
  message(float x, float y,int rx, int ry){
    hp=1;
    location.x=x;
    location.y=y;
    roomy=ry;
    roomx=rx;
    
  }
  
  void show(){
    textSize(30);
    location.y=location.y-5;
    text("+10 hp",location.x,location.y);
    
  }
  
  void act(){
    
  }
}
