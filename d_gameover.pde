void gameover(){
  background(darkgreen);
    fill(green);
  if (myhero.hp==0){
  background(darkgreen);
  text("you lost", width/2, 200);
  } else {
   text("you won", width/2, 200);  
  }
  
  restartbutton.show();


  if (restartbutton.clicked) {
    setup();
    mode=intro;
  }
}
