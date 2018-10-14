/*
    PROGRAMMA SISTEMA SOLARE 2.0
    (già avevamo altre versioni ma non erano accettabili)

  //questi "slash" si chiamano commenti e ciò che viene
    scritto dopo non influisce nel codice

    ho seguito un tutorial su internet, e dato che non ero contento dei risultati
    ho creato un programma da me, ma alcuni concetti sono stati utili


    Il linguaggio usato in questo programma è un dialetto di java.
    (non ho idea di come si usi java, per quello c'è un'altra persona in classe)

    Per chi fosse "curioso" ho inserito annotazioni in giro(un po' come fa Gabe Newell)  
    (si, lo so, il programma poteva essere più compatto, ma non avevo tempo, ho la verifica di matematica, la interrogazione di scienze e quella di fisica nello stesso giorno)
*/



//una libreria scaricata per poter aggiungere le animazione, quelle belle.
import de.looksgood.ani.*;



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

//definisco i pianeti(il nome(classe) Planet non è nel programma, lo ho creato io)
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
//vel = velocità aggiuntiva di orbita
float vel;
//Switch: cambiare modalità
int switch_ = 0;

//le diverse velocità d'orbita per i pianeti
float a = 0.01;
float b = 0.04787;
float c = 0.03502;
float d = 0.02870;
float e =0.027077;
float f = 0.01307;
float g = 0.00969;
float h = 0.00681;
float i = 0.00543;





//nel void setup di processing si inializzano tutto quel che deve essere definito una volta e sola
void setup() {
  //con size() posso scegliere la grandezza della finestra, ma ho preferito fullscreen
  //size(1366, 768, P3D);
  fullScreen(P3D);
  //something = new MouseOver(0, 0, 100);
  
  //definisco i valori dei pianeti
  sun = new Planet(48, 1, 0.01, 8);
  mercurio = new Planet(25, 64, 0.04787, 0);
  venere = new Planet(35, 120, 0.03502, 1);
  terra = new Planet(35, 175, 0.02870, 2);
  marte = new Planet(20, 227.9, 0.027077, 3);
  giove = new Planet(80, 300, 0.01307, 4);
  saturno = new Planet(75, 460, 0.00969, 5);
  urano = new Planet(50, 600, 0.00681, 6);
  nettuno = new Planet(45, 680, 0.00543, 7);
  
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
void draw() {

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

void change() {
  if (switch_ == 1) {
    angle =  HALF_PI;
    Ani.to(this, 1, "angle0", HALF_PI, Ani.ELASTIC_OUT);
    Ani.to(this, 1.5, "angle1", HALF_PI, Ani.ELASTIC_OUT);
    Ani.to(this, 2, "angle2", HALF_PI, Ani.ELASTIC_OUT);
    Ani.to(this, 2.5, "angle3", HALF_PI, Ani.ELASTIC_OUT);
    Ani.to(this, 3, "angle4", HALF_PI, Ani.ELASTIC_OUT);
    Ani.to(this, 3.5, "angle5", HALF_PI, Ani.ELASTIC_OUT);
    Ani.to(this, 4, "angle6", HALF_PI, Ani.ELASTIC_OUT);
    Ani.to(this, 4.5, "angle7", HALF_PI, Ani.ELASTIC_OUT);
  } else if (switch_ == -1) {
    Ani.to(this, 0.5, "angle0", mouseX/41);
    Ani.to(this, 0.5, "angle1", mouseX/41*2);
    Ani.to(this, 0.5, "angle2", mouseX/41*3);
    Ani.to(this, 0.5, "angle3", mouseX/41*4);
    Ani.to(this, 0.5, "angle4", mouseX/41*5);
    Ani.to(this, 0.5, "angle5", mouseX/41*6);
    Ani.to(this, 0.5, "angle6", mouseX/41*7);
    Ani.to(this, 0.5, "angle7", mouseX/41*8);
  }
}


//per avviare i programmi:
void keyPressed() {
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

//per cambiare modalità(su e giù) o aumentare o diminuire la velocità(destra e sinitra)  
  if (key == CODED) {
    if (keyCode == RIGHT) {
      vel = vel + 0.01;
    } else if (keyCode == LEFT) {
      vel = vel - 0.01;
    } 
    if (keyCode == UP) {
      switch_ += 1;
      print(switch_);
    } else if (keyCode == DOWN) {
      switch_ -= 1;
    }
  }
    
  
}