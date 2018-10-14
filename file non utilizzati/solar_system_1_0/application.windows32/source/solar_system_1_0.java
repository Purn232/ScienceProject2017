import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class solar_system_1_0 extends PApplet {

Planet sun;


public void setup() {
  
  sun = new Planet(100, 0, 0.01f);
  sun.spawnMoons(5);
}

public void draw() {
  background(15);
  translate(width/2, height/2);
  sun.show();
  sun.orbit();
}
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
  
  public void show() {
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
  
  public void orbit(){
    angle = angle + orbitspeed;
    if (planets != null) {
      for (int i = 0; i < planets.length; i++) {
        planets[i].orbit();
      }
    }
  }

  public void spawnMoons(int total) {
  
    planets = new Planet [total];
    for (int i = 0; i < planets.length; i++) {
      float r = radius*0.3f;
      float d = random(150, 360);
      float o = random(0.02f, 0.1f);
      planets[i] = new Planet(r, d, o);
  
    }
  }




}
  public void settings() {  size(1280, 720); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "solar_system_1_0" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
