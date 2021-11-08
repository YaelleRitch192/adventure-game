class enemy extends gameobject{
  
    
  enemy(){
    roomx=1;
    roomy=1;
    location=new PVector(width/2, height/2);
    velocity= new PVector(0,0);
    hp=100;
    size=30;   
  }
  
  void show(){
    fill(brown);
    ellipse(location.x, location.y, size, size);
    fill(255);
    text(hp,location.x,location.y);
  
  }
  
  void act(){
    super.act();
    int i =0;
    while(i<myobjects.size()){
      gameobject obj=myobjects.get(i);
      if(obj instanceof bullet){
       float d = dist(obj.location.x,obj.location.y,location.x,location.y);
       if (d<= size/2+obj.size/2){
         hp=hp-int(obj.velocity.mag());
         obj.hp=0;
       }
      }
      
      i++;
    }
    
  }
  
}
