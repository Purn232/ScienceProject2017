//ecco la classe Planet
//qui definisco le caratteristiche di un pianeta e come deve funzionare.

class Planet {
  float radius;
  float angle;
  float distance;
  float orbitspeed;
  int img;
  
  //Pianeta(raggio, distanza dal sole, velocità di orbita, quale immagine usare)  
  Planet(float r, float d, float o, int img_) {
    radius = r;
    distance = d;
    angle = TWO_PI;
    orbitspeed = o;
    img = img_;
  }
  
  //void show dice cosa mostrare
  void show(float angle, float o){
    pushMatrix();
    float x = sin(angle + o) * distance;
    float y = cos(angle + o) * distance;
    imageMode(CENTER);
    image(planetsImg[img], x, y, radius*2, radius*2); 
    popMatrix();
  }

}
