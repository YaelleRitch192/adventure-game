class gif {

  //instance varibles
  PImage []gif;
  int numframes;
  int currentframe;
  int rate;



  //constructor
  gif(int f, String pre, String post ) {
    numframes=f;
    gif=new PImage[numframes];
    int i = 0;
    while (i<numframes) {
      gif[i] = loadImage (pre+i+post);
      i=i+1;
    }
  }
  
  gif(int f, int r, String pre, String post ){
  numframes=f;
  rate=r;
  gif=new PImage[numframes]; 
  currentframe=0;
  int i=0;
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
  
  void show(float x, float y, float w, float h){
          if (currentframe>=numframes) currentframe=0;
              image(gif[currentframe], x, y, w, h); 
      if(frameCount % rate ==0) currentframe++;


  }
}
