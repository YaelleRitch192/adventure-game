void game() {
  rectMode(CENTER);
  drawroom();
  drawgameobjects();
  drawlightlayer();
  drawminimap();
  //guns();
  textSize(30);
 // upgradeshop();
}





void drawroom() {
  background(darkgreen); 
  //corners
  stroke(black);
  line(0, 0, width, height);
  line (0, height, width, 0);
  //corners
  northroom=map.get(myhero.roomx, myhero.roomy-1); 
  eastroom=map.get(myhero.roomx+1, myhero.roomy);
  southroom = map.get(myhero.roomx, myhero.roomy+1);
  westroom = map.get(myhero.roomx-1, myhero.roomy);

  noStroke();
  fill(black);
  if (northroom !=#FFFFFF) {
    ellipse(width/2, height*0.1, 100, 100);
  }
  if (eastroom !=#FFFFFF) {
    ellipse(width*0.9, height/2, 100, 100);
  }
  if (southroom !=#FFFFFF) {
    ellipse(width/2, height*0.9, 100, 100);
  }
  if (westroom !=#FFFFFF) {
    ellipse(width*0.1, height/2, 100, 100);
  }
  //middle
  fill(green);
  rect(width/2, height/2, width*0.8, height*0.8);
}

void drawgameobjects() {
  int i=0;
  while ( i< myobjects.size()) {
    gameobject obj = myobjects.get(i);
    if (obj.roomx==myhero.roomx && obj.roomy==myhero.roomy) {
      obj.show();
      obj.act();
    }
    if (obj.hp<=0) {
      myobjects.remove(i);
    } else {
      i++;
    }
  }
}

void drawlightlayer() {
  noStroke();
  int i=0;
  while ( i< darkness.size()) {
    darknesscell dark = darkness.get(i);
    dark.show();
    i++;
  }
}

void drawminimap() {
  float size=10;
  int x =0;
  int y=0;
  while (y<map.height) {
    color c = map.get(x, y); 
    fill(c);
        square(x*10+50, y*10+50, size);
    if ( myhero.roomx*10+50 == x*10+50 && myhero.roomy*10+50 == y*10+50) {
      imageMode(CORNER);
      image(sprite,x*10+50, y*10+50);
      sprite.resize(10,10);
      
    }
    //    square(x*10+50, y*10+50, size);
    x=x+1;
    if (x>= map.width) {
      x=0;
      y=y+1;
    }
  }
}

void guns() {
  rectMode(CENTER);
  textSize(10);
  //machine
  if (onekey==true) {
    fill(green);
  } else {
    fill(yellow);
  }
  rect(100, 575, 50, 50);
  fill(blue);
  text("machine", 100, 575);
  //sniper
  if (twokey==true) {
    fill(green);
  } else {
    fill(yellow);
  }
  rect(200, 575, 50, 50);
  fill(blue);
  text("sniper", 200, 575);

  //shotgun
  if (threekey==true) {
    fill(green);
  } else {
    fill(yellow);
  }
  rect(300, 575, 50, 50);
  fill(blue);
  text("shotgun", 300, 575);
}

void upgradeshop(){
  upgradeshopbutton.show();
    if (upgradeshopbutton.clicked) {
mode=pause;
  }
}
