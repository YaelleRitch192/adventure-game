class gameobject {

  PVector location;
  PVector velocity;
  int hp;
  int roomx;
  int roomy;
  int size;
  color c;
 

  gameobject() {
    location = new PVector (width/2, height/2);
    velocity = new PVector (0, 0);
    hp=1;
  }

  void show() {
  }

  boolean inroomwith(gameobject myobj) {
    if (roomx==myobj.roomx && roomy==myobj.roomy)
      return true;
    else
      return false;
  }

  boolean iscollidingwith(gameobject obj) {
    float d = dist(obj.location.x, obj.location.y, location.x, location.y); 
    if (inroomwith(obj) && d<size/2+obj.size/2)
      return true;
    else
      return false;
  }

  void explode(int n) {
    int i=0;
    while (i<n) {
      myobjects.add(new particles(location.x, location.y,roomx,roomy));
      i++;
    }
  }

  void act() {
    location.add(velocity);

    if (location.x<width*0.1) location.x=width*0.1;
    if (location.x> width*0.9) location.x=width*0.9;
    if (location.y<height*0.1) location.y=height*0.1;
    if (location.y>height*0.9) location.y=height*0.9;
  }
}
