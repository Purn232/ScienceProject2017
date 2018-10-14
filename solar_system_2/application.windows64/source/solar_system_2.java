import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import de.looksgood.ani.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class solar_system_2 extends PApplet {

/*
    PROGRAMMA SISTEMA SOLARE 2.0
    (gi\u00e0 avevamo altre versioni ma non erano accettabili)

  //questi "slash" si chiamano commenti e ci\u00f2 che viene
    scritto dopo non influisce nel codice

    ho seguito un tutorial su internet, e dato che non ero contento dei risultati
    ho creato un programma da me, ma alcuni concetti sono stati utili


    Il linguaggio usato in questo programma \u00e8 un dialetto di java.
    (non ho idea di come si usi java, per quello c'\u00e8 un'altra persona in classe)

    Per chi fosse "curioso" ho inserito annotazioni in giro(un po' come fa Gabe Newell)  
    (si, lo so, il programma poteva essere pi\u00f9 compatto, ma non avevo tempo, ho la verifica di matematica, la interrogazione di scienze e quella di fisica nello stesso giorno)
*/



//una libreria scaricata per poter aggiungere le animazione, quelle belle.




//neanchio mi ricordo a cosa servano questi angle...

PImage[] planetsImg = new PImage[9];
float angle0;
float angle1;
float angle2;
float angle3;
float angle4;
float angle5;
float angle6;
float angle7;

//definisco i pianeti(il nome(classe) Planet non \u00e8 nel programma, lo ho creato io)
Planet sun;
Planet mercurio;
Planet venere;
Planet terra;
Planet marte;
Planet giove;
Planet saturno;
Planet urano;
Planet nettuno;
//MouseOver something;

float x;
float y;
float angle;
float asl;
//vel = velocit\u00e0 aggiuntiva di orbita
float vel;
//Switch: cambiare modalit\u00e0
int switch_ = 0;

//le diverse velocit\u00e0 d'orbita per i pianeti
float a = 0.01f;
float b = 0.04787f;
float c = 0.03502f;
float d = 0.02870f;
float e =0.027077f;
float f = 0.01307f;
float g = 0.00969f;
float h = 0.00681f;
float i = 0.00543f;





//nel void setup di processing si inializzano tutto quel che deve essere definito una volta e sola
public void setup() {
  //con size() posso scegliere la grandezza della finestra, ma ho preferito fullscreen
  //size(1366, 768, P3D);
  
  //something = new MouseOver(0, 0, 100);
  
  //definisco i valori dei pianeti
  sun = new Planet(48, 1, 0.01f, 8);
  mercurio = new Planet(25, 64, 0.04787f, 0);
  venere = new Planet(35, 120, 0.03502f, 1);
  terra = new Planet(35, 175, 0.02870f, 2);
  marte = new Planet(20, 227.9f, 0.027077f, 3);
  giove = new Planet(80, 300, 0.01307f, 4);
  saturno = new Planet(75, 460, 0.00969f, 5);
  urano = new Planet(50, 600, 0.00681f, 6);
  nettuno = new Planet(45, 680, 0.00543f, 7);
  
  //Loading delle immagini prima di usarle
  planetsImg[0] = loadImage("00.png");
  planetsImg[1] = loadImage("01.png");
  planetsImg[2] = loadImage("02.png");
  planetsImg[3] = loadImage("03.png");
  planetsImg[4] = loadImage("04.png");
  planetsImg[5] = loadImage("05.png");
  planetsImg[6] = loadImage("06.png");
  planetsImg[7] = loadImage("07.png");
  planetsImg[8] = loadImage("sole.png");
  
  //questo serve per qualche motivo per avere le animazioni belle, ma l'autore non ha mai spiegato il motivo.
  Ani.init(this);
}

//nel void fraw invece avvengono le azioni che vengono eseguite ogni frame
public void draw() {

  background(15);
  
  //appunti... bozzi... di trigonometria, ci ho messo tanto tempo a causa di questo.
  //float x = sin(angle + o) * distance;
  //float y = cos(angle + o) * distance;

  translate(width/2 + mouseX/40, height/2 + mouseY/40 );

  sun.show(angle, TWO_PI);
  mercurio.show(angle0, 0);
  venere.show(angle1, 0);
  terra.show(angle2, 0);
  marte.show(angle3, 0);
  giove.show(angle4, 0);
  saturno.show(angle5, 0);
  urano.show(angle6, 0);
  nettuno.show(angle7, 0);

  if (switch_ == 0) {
    angle += a + vel;
    angle0 += b + vel;
    angle1 += c + vel;
    angle2+= d + vel;
    angle3 += e+ vel;
    angle4 += f+ vel;
    angle5 += g+ vel;
    angle6 += h+ vel;
    angle7 += i + vel;
  }
  change();
}

public void change() {
  if (switch_ == 1) {
    angle =  HALF_PI;
    Ani.to(this, 1, "angle0", HALF_PI, Ani.ELASTIC_OUT);
    Ani.to(this, 1.5f, "angle1", HALF_PI, Ani.ELASTIC_OUT);
    Ani.to(this, 2, "angle2", HALF_PI, Ani.ELASTIC_OUT);
    Ani.to(this, 2.5f, "angle3", HALF_PI, Ani.ELASTIC_OUT);
    Ani.to(this, 3, "angle4", HALF_PI, Ani.ELASTIC_OUT);
    Ani.to(this, 3.5f, "angle5", HALF_PI, Ani.ELASTIC_OUT);
    Ani.to(this, 4, "angle6", HALF_PI, Ani.ELASTIC_OUT);
    Ani.to(this, 4.5f, "angle7", HALF_PI, Ani.ELASTIC_OUT);
  } else if (switch_ == -1) {
    Ani.to(this, 0.5f, "angle0", mouseX/41);
    Ani.to(this, 0.5f, "angle1", mouseX/41*2);
    Ani.to(this, 0.5f, "angle2", mouseX/41*3);
    Ani.to(this, 0.5f, "angle3", mouseX/41*4);
    Ani.to(this, 0.5f, "angle4", mouseX/41*5);
    Ani.to(this, 0.5f, "angle5", mouseX/41*6);
    Ani.to(this, 0.5f, "angle6", mouseX/41*7);
    Ani.to(this, 0.5f, "angle7", mouseX/41*8);
  }
}


//per avviare i programmi:
public void keyPressed() {
  //System.getProperty("user.name") serve per ottenere il nome dell'utente che sta usando il pc, non sono informazioni 
  //sensibili come tanti penserebbero.
  
  if(key == '1'){launch("C:/Users/"+ System.getProperty("user.name") +"/Downloads/1.exe");}
  if(key == '2'){launch("C:/Users/"+ System.getProperty("user.name") +"/Downloads/2.exe");}
  if(key == '3'){launch("C:/Users/"+ System.getProperty("user.name") +"/Downloads/3.exe");}
  if(key == '4'){launch("C:/Users/"+ System.getProperty("user.name") +"/Downloads/4.exe");}
  if(key == '5'){launch("C:/Users/"+ System.getProperty("user.name") +"/Downloads/5.exe");}
  if(key == '6'){launch("C:/Users/"+ System.getProperty("user.name") +"/Downloads/6.exe");}
  if(key == '7'){launch("C:/Users/"+ System.getProperty("user.name") +"/Downloads/7.exe");}
  if(key == '8'){launch("C:/Users/"+ System.getProperty("user.name") +"/Downloads/8.exe");}
  if(key == '9'){launch("C:/Users/"+ System.getProperty("user.name") +"/Downloads/9.exe");}
  if(key == 'c'){launch("C:/Users/"+ System.getProperty("user.name") +"/Downloads/crediti.png");}
  if(key == 'x'){Ani.to(this, 5, "vel", 0);}

//per cambiare modalit\u00e0(su e gi\u00f9) o aumentare o diminuire la velocit\u00e0(destra e sinitra)  
  if (key == CODED) {
    if (keyCode == RIGHT) {
      vel = vel + 0.01f;
    } else if (keyCode == LEFT) {
      vel = vel - 0.01f;
    } 
    if (keyCode == UP) {
      switch_ += 1;
      print(switch_);
    } else if (keyCode == DOWN) {
      switch_ -= 1;
    }
  }
    
  
}
//ecco la classe Planet
//qui definisco le caratteristiche di un pianeta e come deve funzionare.

class Planet {
  float radius;
  float angle;
  float distance;
  float orbitspeed;
  int img;
  
  //Pianeta(raggio, distanza dal sole, velocit\u00e0 di orbita, quale immagine usare)  
  Planet(float r, float d, float o, int img_) {
    radius = r;
    distance = d;
    angle = TWO_PI;
    orbitspeed = o;
    img = img_;
  }
  
  //void show dice cosa mostrare
  public void show(float angle, float o){
    //le matrici non le abbiamo fatte e non capisco a cosa servano nel programma, me lo ha consigliato un buon uomo su internet, perch\u00e8 prima le distanza e i movimenti erano strani.
    pushMatrix();
    //ecco qua... trigonometria... sono le formule per tracciare la posizione x e y, avrei voluto farle ellittiche, ma non avevo tempo.
    float x = sin(angle + o) * distance;
    float y = cos(angle + o) * distance;
    imageMode(CENTER);
    image(planetsImg[img], x, y, radius*2, radius*2); 
    popMatrix();
  }

}
//mousehover abortito, non avevo tempo

//class MouseOver{
//  float x_;
//  float y_;
//  float r_;
  
//  MouseOver(float x, float y, float r) {
//    x_ = x;
//    y_ = y;
//    r_ = r;
//  }




//}
  public void settings() {  fullScreen(P3D); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--present", "--window-color=#666666", "--stop-color=#cccccc", "solar_system_2" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
