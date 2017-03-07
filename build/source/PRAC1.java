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

public class PRAC1 extends PApplet {

// Step 1. Declare an object.
Missatge textMostrar;
Fons fons;
Contador contadorTransicio;


public void setup(){
  
  frameRate(25);

  // Step 2. Initialize object.
  textMostrar = new Missatge("Hola", color(0xffD81AFF), color(0xffFFEA00));

  fons = new Fons(color(0xff000000), color(0xffFFEA00), color(0xffD81AFF));

  contadorTransicio = new Contador(200);
}


public void draw(){

  fons.setColor(contadorTransicio.getFraccion());
  fons.display();

  textMostrar.setColor(contadorTransicio.getFraccion());
  textMostrar.display();

  contadorTransicio.updateContador();
}


class TransicioColor{
  int colorInicial;
  int colorFinal;
  int colorActual;

  public void setColor(float transcioColor){
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
  Missatge(String m, int c1,int c2){
    textMissatge = m;
    colorInicial = c1;
    colorFinal = c2;
    colorActual = colorInicial;
  }

  // getter
  // mostra el text
  public void display(){
    textSize(16);
    textAlign(CENTER);
    fill(colorActual);
    text(textMissatge, width/2, height/2);
  }

}



class Fons extends TransicioColor{

  // atributs
  int colorFons;

  // constructor
  Fons(int f, int c1, int c2){
    colorFons = f;
    colorInicial = c1;
    colorFinal = c2;
    colorActual = colorInicial;
  }

  // getter
  // mostra el text
  public void display(){
    background(colorFons);
    fill(colorActual);
    rect(20, 20, width-40, height-40, 30);
  }
}


class Contador{
  // Quantitat de
  int numFrames;

  float frameActual = 0.0f;

  boolean state = true;

  // constructor
  Contador(int nF){
    numFrames = nF;
  }

  public void updateContador(){

    // depenent la variable estat
    // conta de 0 a numFrames o de NumFrames a 0
    if (state){
      frameActual++;
    } else {
      frameActual--;
    }

    // cada vegada que els frames totals s\u00f3n divisibles per el
    if(frameCount % numFrames == 0){
      state = !state;
    }

  }

  public float getFraccion(){
    return frameActual / PApplet.parseFloat(numFrames);
  }


}
  public void settings() {  size(400,400); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "PRAC1" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
