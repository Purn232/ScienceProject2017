Planet sun;


void setup() {
  size(1280, 720);
  sun = new Planet(100, 0, 0.01);
  sun.spawnMoons(5);
}

void draw() {
  background(15);
  translate(width/2, height/2);
  sun.show();
  sun.orbit();
}