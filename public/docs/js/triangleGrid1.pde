float t= random(1000);
void setup() {
  size(750, 300);
  background(234);
}

void draw() {
  float tinc= 0.0002;
  float cellWidth= 25;
  float cellHeight= 25;
  float noiseScale= 12.75;
  //background(234);
  noFill();
  fill(234, 22);
  stroke(79, 10);
  for (int i=0; i<height; i+=cellHeight) {
    beginShape(TRIANGLE_STRIP);
    for (int j=0; j<width; j+=cellWidth) {
      
      float xJitter= (noise(t, j)-0.5)*noiseScale;
      float yJitter= (noise(i, t)-0.5)*noiseScale;
      
      vertex(j+xJitter, i+cellHeight+ yJitter);

      t+=random(tinc);
      
      xJitter= (noise(t, j)-0.5)*noiseScale;
      yJitter= (noise(i, t)-0.5)*noiseScale;
      
      vertex(j+cellWidth+xJitter, i+yJitter);
    }
    endShape();
  }

  t+=random(tinc);
}



