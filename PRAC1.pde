/**
 * 
 * @file descripción corta de la tarea del módulo
 * @author David Vinagre Cerezo
 * @date 
 * @brief descripción corta de la tarea del módulo
 */


/* http://www.disca.upv.es/aperles/mola_doxygen/mola_doxygen.html
/* http://booleanbite.com/web/doxygen-una-herramienta-para-documentar-codigo/

/** 
 *  Declaració d'objectes i variables utilitzades
 */

Missatge textMostrar; //
Fons fons; //
Contador contadorTransicio; //


/** 
 *  Declaració d'objectes i variables utilitzades
 */

void setup(){
  size(400,400);
  surface.setResizable(true);
  frameRate(25);

  // Inicializamos objetos
  textMostrar = new Missatge("Hola mon!", color(#D81AFF), color(#FFEA00));
  fons = new Fons(color(#000000), color(#FFEA00), color(#D81AFF));
  contadorTransicio = new Contador(200);
}


/** 
 *  Declaració d'objectes i variables utilitzades
 */

void draw(){

  fons.setColor(contadorTransicio.getFraccion());
  fons.display();

  textMostrar.setColor(contadorTransicio.getFraccion());
  textMostrar.display();

  contadorTransicio.updateContador();
}



/**
*   @class TransicioColor
*   @brief
*
*   serveix de plantilla per la creació d'objectes segons un model definit
*/

class TransicioColor{

  // propietats
  // variables on es guarden els valors dels objectes
  color colorInicial;
  color colorFinal;
  color colorActual;


  /**
  *   @brief setters
  *
  *   funcions que permeten canviar els valors de les propietats de l'objecte
  *   modifica el valor de colorActual a partir de dos colors (colorInicial i colorFinal)
  *   i un valor entre 0.0 i 1.0 (parametre transicioColor)
  *
  *   @param transicioColor valor decimal entre 0.0 i 1.0
  */

  void setColor(float transcioColor){

    // lerpColor(c1, c2, amt) calcula un color o colors entre dos colors en un increment específic.
    colorActual = lerpColor(colorInicial, colorFinal, transcioColor);
  
  }

}


/*
  extends permet a una nova classe heretar els mètodes i propietats 
  (variablesi constans) a partir d'una classe exitent

  la clase Missatge hereda els métodes i propietats de la clase TransicioColor
*/

class Missatge extends TransicioColor{

  // propietats
  // objecte String on es guarda el text que es mostrara
  String textMissatge;

  // constructor
  // funcio que té la funció d'inicialitzar un objecte
  // en el constructor s'asignen els valors inicials de l'objecte
  Missatge(String m, color c1,color c2){
    textMissatge = m;
    colorInicial = c1;
    colorFinal = c2;
    colorActual = colorInicial;
  }

  // getter
  // mostra el text
  void display(){
    textSize(22);
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
    background(colorFons);
    fill(colorActual);
    rect(20, 20, width-40, height-40, 30);
  }
}


class Contador{
  // Quantitat de
  int numFrames;
  float frameActual = 0.0;
  boolean state = true;

  // constructor
  Contador(int nF){
    numFrames = nF;
  }

  void updateContador(){

    // depenent la variable estat
    // conta de 0 a numFrames o de NumFrames a 0
    if (state){
      frameActual++;
    } else {
      frameActual--;
    }

    // cada vegada que els frames totals són divisibles per el
    if(frameCount % numFrames == 0){
      state = !state;
    }

  }

  float getFraccion(){
    return frameActual / float(numFrames);
  }


}