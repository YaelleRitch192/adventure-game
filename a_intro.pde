void intro() {
  textFont(introfont);
  imageMode(CENTER);
  
  xp=0;
  extradamage=0;
  shotgun=true;
  forest.show();
  textSize(50);
  fill(darkgreen);
  text("adventure game", width/2, 200);
  startbutton.show();
  instructionsbutton.show();

  if (startbutton.clicked) {
    mode=game;
  }
   if (instructionsbutton.clicked) {
     mode=instructions;
   }
  
} 
