class grower extends enemy {

  grower(int x, int y) {
    super(grower_hp, grower_size, x, y);
  }
  void show() {
    textSize(10);
    fill(brown);
    ellipse(location.x, location.y, size, size);
    fill(white);
    text(hp, location.x, location.y);
  }

  void act() {
    super.act();
    if (size<500) {
      size++;
      if (size==500) {
        size=0;
      }
    }
  }
}
