// Step 1. Declare an object.
Missatge textMostrar;
Fons fons;
Contador contadorTransicio;


void setup(){
  size(400,400, P2D);
  frameRate(25);

  // Step 2. Initialize object.
  textMostrar = new Missatge("Hola", color(#D81AFF), color(#FFEA00));

  fons = new Fons(color(#000000), color(#FFEA00), color(#D81AFF));

  contadorTransicio = new Contador(200);
}


void draw(){

  fons.setColor(contadorTransicio.getFraccion());
  fons.display();

  textMostrar.setColor(contadorTransicio.getFraccion());
  textMostrar.display();

  contadorTransicio.updateContador();
}


class TransicioColor{
  color colorInicial;
  color colorFinal;
  color colorActual;

  void setColor(float transcioColor){
    colorActual = lerpColor(colorInicial, colorFinal, transcioColor);
  }
}

// Allows a new class to inherit the methods and data fields
// (variables and constants) from an existing class.
class Missatge extends TransicioColor{

  //PFont font;

  // atributs
  String textMissatge;

  // constructor
  Missatge(String m, color c1,color c2){
    textMissatge = m;
    colorInicial = c1;
    colorFinal = c2;
    colorActual = colorInicial;
  }

  // getter
  // mostra el text
  void display(){
    textSize(16);
    textAlign(CENTER);
    fill(colorActual);
    text(textMissatge, width/2, height/2);
  }

}



class Fons extends TransicioColor{

  // atributs
  color colorFons;

  // constructor
  Fons(color f, color c1, color c2){
    colorFons = f;
    colorInicial = c1;
    colorFinal = c2;
    colorActual = colorInicial;
  }

  // getter
  // mostra el text
  void display(){
    fill(colorActual);
    rect(20, 20, width-40, height-40, 30);
  }
}


class Contador{
  int numFrames;

  float frameActual = 0.0;
  float fraccion = 0.0;

  boolean state = true;

  // constructor
  Contador(int nF){
    numFrames = nF;
  }

  void updateContador(){

    if (state){
      frameActual++;
    } else {
      frameActual--;
    }

    if(frameCount % numFrames == 0){
      state = !state;
    }

    fraccion = frameActual / numFrames;
  }

  float getFraccion(){
    return fraccion;
  }


}
