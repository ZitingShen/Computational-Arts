int sides=6;
float r=100;
float cx=250;
float cy=250;
float angle=20;
float speed=1;

void setup() {
  size(700, 700);
  stroke(0);
  strokeWeight(5);
} //setup()

void draw() {
  background(255);
  drawPolygon(angle);
  angle+=speed;
} //draw()

void drawPolygon(float ang) {
  for (int i=0; i<sides; i++) {
    float x1=cx+r*cos(ang);
    float y1=cy+r*sin(ang);

    ang+=TWO_PI/sides;
    float x2=cx+r*cos(ang);
    float y2=cy+r*sin(ang);

    line(x1, y1, x2, y2);
  }
} //polygon()

