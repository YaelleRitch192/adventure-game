void gameover(){
  background(darkgreen); 
  if (myhero.hp==0){
  background(darkgreen);
  fill(green);
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
