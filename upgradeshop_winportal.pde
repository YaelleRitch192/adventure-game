class upgradeshop extends gameobject {
  
  upgradeshop(int x, int y){
    roomx=x;
    roomy=y;
  }  
  void show(){
    imageMode(CENTER);
    image(shop,width/2,height/2);
  }
  void act(){
  }   
}

class winportal extends gameobject {
  
  winportal(int x, int y){
    roomx=x;
    roomy=y;
  }  
  void show(){
    imageMode(CENTER);
    image(winportal,width/2,height/2);
  }
  void act(){
    if(myhero.location.x>width/2-40 && myhero.location.x< width/2+40 && myhero.location.y> height/2-80 && myhero.location.y<height/2+80) mode=gameover;
  }   
}
