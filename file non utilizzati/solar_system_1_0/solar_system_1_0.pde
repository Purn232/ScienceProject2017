Planet sun;
int s = 31;
int c = 15;

void setup() {
  size(1280, 720);
  sun = new Planet(40, 0, 0.01);
  sun.spawnMoons(8);
  print("hullo");
}

void draw() {
  background(c);
  
  translate(width/2 + mouseX/40, height/2 + mouseY/40);
  sun.show();
  sun.orbit();
  
  frameRate(s);
  
  if(s < 10){s = 11;}
  
  textSize(32);
  text("velocità: " + ((s - 1)/10), -630 - mouseX/100, -340 - mouseY/100); 
  fill(0, 102, 153);
  

}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == RIGHT) {
      s = s + 10;
    } else if (keyCode == LEFT) {
      s = s - 10;
    } 
    if (keyCode == UP) {
      c = c + 5;
    } else if (keyCode == DOWN) {
      c = c - 5;
    } 
  } else {
    s = 31;
    c = 15;
  }
}