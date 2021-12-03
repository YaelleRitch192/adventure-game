class upgradeshop extends gameobject {
  
  
  upgradeshop(int x, int y){
    roomx=x;
    roomy=y;
  }
  
  void show(){
    imageMode(CENTER);
    image(shop,width/2,100);
        upgradeshopbutton.show();

  }
  void act(){
        if (upgradeshopbutton.clicked) {
mode=pause;
  }
  }
  
  
}
