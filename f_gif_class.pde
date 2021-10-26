class gif {

  //instance varibles
  PImage []gif;
  int numframes;
  int currentframe;


  //constructor
  gif(int f, String pre, String post ) {
    numframes=f;
    gif=new PImage[numframes];
    int i = 0;
    pre= "frame_";
    post= "_delay-0.03s.gif";
    while (i<numframes) {
      gif[i] = loadImage (pre+i+post);
      i=i+1;
    }
  }

  void show() {
    image(gif[currentframe], width/2, height/2, width, height);
    currentframe=currentframe+1;
    if (currentframe==numframes) currentframe=0;
  }
}
