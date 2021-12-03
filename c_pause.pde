void pause() {
  background(green);
  fill(0);
  textSize(30);
  text("upgrades", width/2, 100);
  text("XP:"+xp, 250, 155);
  hpbutton();
  speedbutton();
  damagebutton();
  upgradeshopreturn();
  extralight();
}

void hpbutton() {
  hpbutton.show();
  if (xp>=5 && hpbutton.clicked) {
    myhero.hp=myhero.hp+5;
    xp=xp-5;
  }
  fill(0);
  textSize(30);
  text("hp:"+myhero.hp, 275, 245);
}

void speedbutton() {
  text("speed:"+myhero.speed, 300, 345);
  speedbutton.show();
  if (xp>=5 && speedbutton.clicked) {
    myhero.speed=myhero.speed+5;
    xp=xp-5;
  }
}

void damagebutton() {
  fill(0);
  textSize(30);
  text("damage:"+extradamage, 317, 445);
  damagebutton.show();
  if (xp>=5 && damagebutton.clicked) {
    extradamage=extradamage+5;
    xp=xp-5;
  }
}

void upgradeshopreturn(){
  upgradeshopbutton.show();
    if (upgradeshopbutton.clicked) {
mode=game;
  }
}

void extralight() {
  fill(0);
  textSize(30);
  text("brighness:"+extralight, 317, 545);
  extralightbutton.show();
  if (xp>=5 && extralightbutton.clicked) {
    extralight=extralight+40;
    xp=xp-5;
  }
}
