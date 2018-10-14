class Planet {
  float radius;
  float angle;
  float distance;
  Planet[] planets;
  float orbitspeed;
  
  Planet(float r, float d, float o) {
    radius = r;
    distance = d;
    angle = random(TWO_PI);
    orbitspeed = o;
  }
  
  void show() {
    pushMatrix();
    rotate(angle);
    translate(distance, 0);
    noStroke();
    fill(255, 100);
    ellipse(0, 0, radius*2, radius*2);
    printArray(planets);
    
    
    if (planets != null) {
      for (int i = 0; i < planets.length; i++) {
        planets[i].show();
      }
    }
    popMatrix();
  }
  
  void orbit(){
    angle = angle + orbitspeed;
    if (planets != null) {
      for (int i = 0; i < planets.length; i++) {
        planets[i].orbit();
      }
    }
  }

  void spawnMoons(int total) {
  
    planets = new Planet [total];
    for (int i = 0; i < planets.length; i++) {
      float r = radius*0.3;
      float d = random(150, 360);
      float o = random(0.02, 0.1);
      planets[i] = new Planet(r, d, o);
  
    }
  }




}