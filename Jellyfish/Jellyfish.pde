ZShenThingy ZSFish;    // An instance of DKumarThingy will be called DKFish
float SIZE;        // The SIZE of the instance that will be created

void setup() {
  size(800, 600);
  //size(1200, 900);

  smooth();
  SIZE =15;
  ZSFish = new ZShenThingy(SIZE);  // Create an instance with size, SIZE
} // end of setup

void draw() {

  // the creature moves
  ZSFish.move();

  // display the creature
  ZSFish.display();
} // end of draw


class ZShenThingy {  // Definition of the creature DKumarThingy
  float rBell;
  float lTentacle;
  float x, y;
  float startAngle, endAngle;
  float interval;
  FloatList lTentacles = new FloatList();
  int xMove = 1, yMove = 1;
  float lightNoise = 5;

  ZShenThingy(float _size) {
    rBell = _size * 5;
    lTentacle = _size * 20;
    x = random(rBell, width - rBell);
    y = random(rBell, height - lTentacle);
    startAngle = PI * 8 / 10;
    endAngle = PI * 22 / 10;
    interval = rBell / 8;
    for (float i = x + cos (startAngle) * rBell * 0.6; 
    i <= x + cos(endAngle) * rBell * 0.6; i += interval) {
      lTentacles.append(random(lTentacle * 0.5, lTentacle));
    }
  }

  void display() {
    background(#4592F5);
    noStroke();
    fill(#96D6B7, 100);
    arc(x, y, 2 * rBell, 2 * rBell, startAngle, endAngle, CHORD);

    stroke(#96D6B7, 100);
    strokeWeight(SIZE * 0.3);
    int counter = 0;
    for (float i = x + cos (startAngle) * rBell * 0.6; 
    i <= x + cos(endAngle) * rBell * 0.6; i += interval, counter++) {
      line(i, y, i, y + lTentacles.get(counter));
    } // for

      lighting();
  } // display()

  void move() {
    if (x >= width - rBell || x <= rBell) xMove*=-1;
    if (y >= height - lTentacles.max() || y <= rBell) yMove*=-1;
    x += xMove;
    y += yMove;
  }// move()

  void lighting() {
    noStroke();
    fill(255, map(noise(lightNoise), 0, 1, 30, 150));
    ellipse(x, y, rBell * 1.5, rBell * 1);

    lightNoise += 0.005;
  } // lighting()
}// end of class ZShenThingy

