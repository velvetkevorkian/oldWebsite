Segment[] s;
float noiseSrc= random(1000);
int numSegs= 7;

void setup() {
  size(500, 500);
  background(234);
  s= new Segment[numSegs];
  for (int i=0; i<numSegs; i++) {
    float rad= 35*(i+1);
    s[i]= new Segment(rad, rad-15, random(TWO_PI), random(TWO_PI*0.2, TWO_PI*0.9));
  }
  noLoop();
}

void draw() {
  background(234);
  translate(width/2, height/2);
  for (int i=0; i<s.length; i++) {
    s[i].display();
    s[i].update();
  }
}

float newNoise(){
  float n= noise(noiseSrc);
  noiseSrc+= random(0.03);
  return n;
}



class Segment {
  float innerRad;
  float outerRad;
  float rot;
  float circ;
  float innerStartX;
  float innerStartY;
  float endX;
  float endY;
  float resolution;
  float rotSpeed;

  Segment(float INNERRAD, float OUTERRAD, float ROT, float CIRC) {
    innerRad= INNERRAD;
    outerRad= OUTERRAD;
    rot= ROT;
    circ= CIRC;
    rotSpeed= random(0.001, 0.01);
    if(random(1)>0.5){
      rotSpeed*=-1;
    }
    resolution= floor(circ*25);
  }

  void display() {
    rotate(rot);
    //stroke(0);
   // noFill();
   noStroke();
   fill(79);
    beginShape();
    for (int i=0; i<=resolution; i++) {
      float angle= (circ/resolution)*i;
      float xpos= cos(angle)*innerRad;
      float ypos= sin(angle)*innerRad;
      vertex(xpos, ypos);
    }

    for (int i=int(resolution); i>=0; i--) {
      float angle= (circ/resolution)*i;
      float xpos= cos(angle)*outerRad;
      float ypos= sin(angle)*outerRad;
      vertex(xpos, ypos);
    }

    float xpos= cos(0)*innerRad;
    float ypos= sin(0)*innerRad;
    vertex(xpos, ypos);

    endShape();
  }
  
  void update(){
    //rot+=map(newNoise(), 0, 1, -0.01, 0.01);
    rot+=rotSpeed;
  }
}//end of class

