void game() {
  drawroom();
  drawgameobjects();
  myhero.show();
  myhero.act();
}





void drawroom() {
  background(darkgreen); 
  line(0, 0, width, height);
  line (0, height, width, 0);
  fill(green);
  rect(width/2, height/2, width*0.8, height*0.8);
}

void drawgameobjects() {
  int i=0;
  while ( i< myobjects.size()) {
    gameobject obj = myobjects.get(i);
    obj.show();
    obj.act();
    if (obj.hp<=0) {
      myobjects.remove(i);
    } else {
      i++;
    }
  }
}
