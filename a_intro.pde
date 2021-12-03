void intro() {
  textFont(introfont);
  xp=0;
  extradamage=0;
  forest.show();
  textSize(50);
  fill(darkgreen);
  text("adventure game", width/2, 200);
  startbutton.show();


  if (startbutton.clicked) {
    mode=game;
  }
}
