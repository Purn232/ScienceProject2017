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
    fill(255);
    ellipse(0, 0, radius*2, radius*2);


    if (planets != null) {
      for (int i = 0; i < planets.length; i++) {
        planets[0].show();
        planets[1].show();
        planets[2].show();
        planets[3].show();
        planets[4].show();
        planets[5].show();
        planets[6].show();
        planets[7].show();
      }
    }
    popMatrix();
  }

  void orbit() {
    angle = angle + orbitspeed;
    if (planets != null) {
      for (int i = 0; i < planets.length; i++) {
        planets[i].orbit();
      }
    }
  }
  void spawnMoons(int total) {

    
    planets = new Planet [total];
    planets[0] = new Planet(5, 57.91, 0.04787); //mercurio
    planets[1] = new Planet(10, 108.2, 0.03502); //venere
    planets[2] = new Planet(10, 149.6, 0.02870); //terra
    planets[3] = new Planet(7, 227.9, 0.027077); //marte
    planets[4] = new Planet(20, 300, 0.01307); //giove
    planets[5] = new Planet(19, 337, 0.00969); //saturno
    planets[6] = new Planet(13, 350, 0.00681); // urano
    planets[7] = new Planet(13, 375, 0.00543); // nettuno
    //planets[n] = new Planet(raggio, distanza, velocità di orbita);
    
    
  }

}