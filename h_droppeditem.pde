class droppeditem extends gameobject {
  
  int type;
  color droppeditemcolour;
  weapon w;

  
  droppeditem(){
    hp=1;
    velocity = new PVector (0,0);
  }
  
  
  void show(){
    stroke(black);
    strokeWeight(2);
    fill(c);
    circle(location.x,location.y,size);
  }
   
  void act(){
    
  }
  
  
}
