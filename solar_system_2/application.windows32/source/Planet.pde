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
    //le matrici non le abbiamo fatte e non capisco a cosa servano nel programma, me lo ha consigliato un buon uomo su internet, perchè prima le distanza e i movimenti erano strani.
    pushMatrix();
    //ecco qua... trigonometria... sono le formule per tracciare la posizione x e y, avrei voluto farle ellittiche, ma non avevo tempo.
    float x = sin(angle + o) * distance;
    float y = cos(angle + o) * distance;
    imageMode(CENTER);
    image(planetsImg[img], x, y, radius*2, radius*2); 
    popMatrix();
  }

}