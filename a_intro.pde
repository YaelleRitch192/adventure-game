void intro() {
  textFont(introfont);
  forest.show();
  textSize(50);
  fill(darkgreen);
  text("adventure game",width/2,200);
  
  startbutton.show();
  
    if (startbutton.clicked) {
     mode=game;
  }
  
  
}




//framework                                 done
//gif and button class                      done
//make intro screen                         done
// colour scheme                            done
//game object class                         
//hero class that extends game object
//draw room - walls and floor
//diagonal line crosses screen to make corners
//make hero move with wasd and hit walls
