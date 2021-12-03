class lurker extends enemy{
  
 lurker(int x, int y){
 super(lurker_hp,lurker_size,x,y);
 
 }
   void show() {
    fill(white);
    ellipse(location.x, location.y, size, size);
    fill(white);
    text(hp, location.x, location.y);
  }
  
  void act(){
   super.act();
   if (dist(location.x, location.y, myhero.location.x, myhero.location.y)<= 300){
   velocity=new PVector(myhero.location.x-location.x,myhero.location.y-location.y);
   velocity.setMag(1);
   } else {
     velocity=new PVector(0,0);
   }
  }
}
