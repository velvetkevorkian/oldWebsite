int steps= 25;
float radius_1 = 100;
float radius_2 = 0;
float maxRadius;
int blades=5;
boolean isChanging= true;

float[] colorArray;

Blade[] bladeArray;
float rot=0;

void setup() {
  size(500, 500);
  smooth();
  maxRadius=height/2;
  background(234);

  bladeArray= new Blade[blades];
  for (int i=0; i<blades; i++) {
    bladeArray[i]= new Blade();
  }

  colorArray= new float[steps];
  for (int i=0; i<steps; i++) {
    colorArray[i]= map(i, 0, steps, 30, 234);
  }
}


void draw() {
  background(234);
  pushMatrix();
  translate(height/2, height/2);

  rotate(rot);

  for (int j=0; j<blades; j++) {
    pushMatrix();
    rotate(TWO_PI/blades*j);
    bladeArray[j].drawBlade();
    popMatrix();
  }
  popMatrix();

  rot+=0.005;
  for (int i=0; i<blades; i++) {
    bladeArray[i].updateBlade();
  }
}

void keyPressed(){
  //isChanging= !isChanging;
}


class Blade {
  float circ;
  float circInc;
  Blade() {
    circ= random(-TWO_PI, TWO_PI);
    circInc= random(0.001, 0.003);
  }

  void drawBlade() {
    beginShape(TRIANGLE_STRIP);
    for (int i=0; i<steps; i++) {
      float currentRadius= map(i, 0, steps, radius_1, maxRadius);
      float xpos= cos(((noise(circ)-0.5)*TWO_PI/steps)*i)*currentRadius;
      float ypos= sin(((noise(circ)-0.5)*TWO_PI/steps)*i)*currentRadius;
      noStroke();
      stroke(colorArray[i]);
      fill(colorArray[i]);

      vertex(xpos, ypos);

      currentRadius= map(i, 0, steps, radius_2, maxRadius);
      xpos= cos(((noise(circ)-0.5)*TWO_PI/steps)*i)*currentRadius;
      ypos= sin(((noise(circ)-0.5)*TWO_PI/steps)*i)*currentRadius;
      stroke(colorArray[i]);
      fill(colorArray[i]);


      vertex(xpos, ypos);
    }
    endShape();
  }

  void updateBlade() {
    if(isChanging){
    circ+=circInc;
    }
  }
}//end of class

