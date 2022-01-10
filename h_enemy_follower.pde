class follower extends enemy{
  gif currentaction;
  
  
 follower(int x, int y){
 super(follower_hp, follower_size,x,y);
     currentaction=zombiedown;
 }
   void show() {
    fill(yellow);
    fill(white);
    textSize(15);
    text(hp, location.x, location.y-40);
    currentaction.show(location.x,location.y,size/1.5,size);
  }
  
  void act(){
   super.act();
   velocity=new PVector(myhero.location.x-location.x,myhero.location.y-location.y);
   velocity.setMag(1);
  }
}
