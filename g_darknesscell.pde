class darknesscell {
  float opacity;
  float x, y;

  darknesscell(float _x, float _y, float s) {
    size=s;
    x=_x;
    y=_y;
    opacity=0;
  }

  void show() {
    fill(0,opacity);
    rectMode(CORNER);
   float d =  dist(myhero.location.x, myhero.location.y,x,y);
    opacity=map(d, 0, 400, 0, 255);
      square(x, y, size);
  }

  void act() {
  }
}
