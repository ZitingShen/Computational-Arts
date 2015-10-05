//rows and columns
int row = 2;
int col = 3;

//store stats related to patterns in the list
FloatList stat = new FloatList();

//index = where the set of stats for one pattern starts
//the meaning of each stat in the set
//float angle1 = random(0, TWO_PI); //index
//float angle2 = random(0, TWO_PI); //index + 1
//float angle3 = random(0, TWO_PI); //index + 2
//float change1 = random(-radians(1), radians(1)); //index + 3
//float change2 = random(-radians(1), radians(1)); //radians //index + 4
//float change3 = random(-radians(1), radians(1)); //radians //index + 5

//float r1 = random(60, 120); //index + 6
//float r2Noise = random(10); //index + 7
//float r3Noise = random(10);//index + 8

//stroke color
float strokeColor = 50;
float strokeDelta = 0.5;

float minLineLength;
float maxLineLength;

void setup() {
  //set the canvas and the speed
  size(displayWidth, displayHeight);
  //size(700, 700);
  background(50);
  strokeWeight(0.8);

  minLineLength = min(width/col, height/row)/8;
  maxLineLength = min(width/col, height/row)/5;

  //store stats in the floatlist
  for (int i = 0; i < row*col; i++) {
    stat.append(random(0, TWO_PI));
    stat.append(random(0, TWO_PI));
    stat.append(random(0, TWO_PI));
    stat.append(random(-radians(3), radians(3)));
    stat.append(random(-radians(3), radians(3)));
    stat.append(random(-radians(3), radians(3)));
    stat.append(random(minLineLength, maxLineLength));
    stat.append(random(10));  
    stat.append(random(10));
  }
} //setup()

void draw() {
  //loop to show rows and columns
  for (int i = 1; i <= row; i++) {
    for (int j = 1; j <= col; j++) {

      //index to show the start of each set of stats
      int index = ((i - 1)*col + (j - 1))*9;

      //stroke color
      stroke(strokeColor, 100);

      //draw lines
      spinLines(width/col/2*(2*j - 1), height/row/2*(2*i - 1), stat.get(index + 6), map(noise(stat.get(index + 7)), 0, 1, minLineLength, maxLineLength), map(noise(stat.get(index + 8)), 0, 1, minLineLength, maxLineLength), stat.get(index), stat.get(index + 1), stat.get(index + 2));

      //update
      stat.add(index, stat.get(index + 3));
      stat.add(index + 1, stat.get(index + 4));
      stat.add(index + 2, stat.get(index + 5));

      if (strokeColor > 255 || strokeColor <50) {
        strokeDelta *= -1;
      }
      strokeColor += strokeDelta;

      stat.add(index + 7, 0.005);
      stat.add(index + 8, 0.005);
    }
  }
} //draw()

void spinLines(float cx1, float cy1, float r1, float r2, float r3, float angle1, float angle2, float angle3) {
  //coordinates of points on the zigzags
  float cx2 = cx1 + r1*cos(angle1);
  float cy2 = cy1 + r1*sin(angle1);
  float cx3 = cx2 + r2*cos(angle2);
  float cy3 = cy2 + r2*sin(angle2);
  float cx4 = cx3 + r3*cos(angle3);
  float cy4 = cy3 + r3*sin(angle3);

  //decide which lines/points will be shown in the screen
  //line(cx1, cy1, cx2, cy2);
  //line(cx2, cy2, cx3, cy3);
  line(cx3, cy3, cx4, cy4);
  //point(cx4, cy4);
} //spinLines()

