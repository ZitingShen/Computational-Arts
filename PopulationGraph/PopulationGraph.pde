//draw a diagram of the top ten countries with the largest population.
PImage globalMap;
PFont font = createFont("Rockwell Extra Bold", 40);

float timeStart = 1950, timeEnd = 2050;
float interval = 10;
float buttonLeft, buttonRight, buttonUp;
float buttonInterval, buttonWidth, buttonHeight;
float buttonColorChange = 100/interval;

FloatDict locationX = new FloatDict(), locationY = new FloatDict();
String[] locationData;
String[] populationData;

void setup() {
  //canvas
  //size(1000, 500);
  size(displayWidth, displayHeight);
  smooth();
  noStroke();

  //give values to variables
  globalMap = loadImage("Global Map1.jpg");
  buttonLeft = width * 0.02;
  buttonRight = width * 0.98;
  buttonInterval = (buttonRight - buttonLeft)/((timeEnd - timeStart) / interval +1);
  buttonWidth = buttonInterval * 0.9;
  buttonUp = height * 0.85;
  buttonHeight = height * 0.08;

  locationData = loadStrings("Location Data.txt");
  populationData = loadStrings("Population Data.txt");

  //set the center of circle for each country
  for (int i = 0; i < locationData.length; i++) {
    String[] pieces = split(locationData[i], "\t");
    locationX.set(pieces[0], float(pieces[1]));
    locationY.set(pieces[0], float(pieces[2]));
  }
} //setup()

void draw() {
  //background
  image(globalMap, 0, 0, width, height);

  //title
  fill(255, 0, 0);
  textAlign(LEFT);
  textFont(font, 50);
  text("Top 10 Countries with the Largest Populations", width * 0.07, height * 0.08);

  // draw buttons and print item names
  float x = buttonLeft;
  float buttonColor = 155;
  textAlign(CENTER);
  textSize(36);
  for (float decade = timeStart; decade <= timeEnd; decade+=interval) {
    //draw buttons
    fill(buttonColor, 0, 0, 220);
    rect(x, buttonUp, buttonWidth, buttonHeight, 10);

    //print item names
    fill(220, 255);
    text(int(decade), x + buttonWidth / 2, buttonUp + buttonHeight / 3 * 2);

    //update the button color and x
    buttonColor+=buttonColorChange;
    x+=buttonInterval;
  }

  //Print the function instructions of this program.
  fill(255, 200);
  rect(width * 0.04, height * 0.47, width * 0.22, height * 0.22, 20);
  fill(0);
  textAlign(LEFT);
  textFont(font, 20);
  text("Instructions: \nHover the mouse on the year to \ncheck the top 10 countries with \nthe largest populations then. \nPress the mouse to obtain the \ndetailed number of the \npopulations.", width * 0.05, height * 0.5); 

  //When mouse is hovered on the button, show the cirle, the country name, the number, etc.
  mouseHovered();
} //draw()

void mouseHovered() {
  //When mouse is hovered on the button, show the cirle, the country name, the number, etc.
  if ((mouseY >= buttonUp) && (mouseY <= buttonUp + buttonHeight)) {
    int counter = 0;
    for (float x = buttonLeft; x < buttonRight; x+=buttonInterval, counter++) {
      if ((mouseX >= x) && (mouseX <= x + buttonWidth)) {
        circles(counter, populationData);
        break;
      }
    }
  }
} //mouseHovered()

void circles(int counter, String[] data) {
  //get the nth group of population data. n = counter. n starts from 0.
  //draw circles of the population data in a time period
  float decade = float(data[counter * 12]);

  for (int i = counter * 12 + 1; i <= counter * 12 + 10; i++) {
    String[] pieces = split(data[i], "\t");
    String location = pieces[0];
    int population = int(pieces[1]);
    circle(locationX.get(location) * width, locationY.get(location) * height, population, decade, location);
  }

  //change the title of the graph
  fill(255, 0, 0);
  textAlign(LEFT);
  textFont(font, 50);
  text("in " + int(decade), width * 0.79, height * 0.08);
}// circles()


void circle(float x, float y, float population, float decade, String location) {
  //draw a circle based on a piece of data
  noStroke();
  fill(155 + (decade - timeStart) / interval * buttonColorChange, 0, 0, 180);
  float d = map(sqrt(population), sqrt(40000000), sqrt(1656553632), height/30, height/4);
  ellipse(x, y, d, d);

  //write the name of the country below the circle.
  fill(255);
  textAlign(CENTER);
  textFont(font, 20);
  text(location, x, y + d/4);

  //When the mouse is pressed, print the population of each country in the circle.
  textFont(font, 16);
  if (mousePressed) text(int(population), x, y);
}//circle()
