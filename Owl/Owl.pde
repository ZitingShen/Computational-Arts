PFont f;

void setup() {
  //Canvas
  size(1000, 1000);
  smooth();
  background(190);
  f = createFont("French Script MT",16,true);
} //setup()

void draw() {
  //Write the words
  textFont(f,135);
  fill(mouseX*255/1000,mouseY*255/1000,random(255));
  text("The Bryn Mawr Owl",50,500);
} //draw()

void mousePressed(){
  //Create Owls
  drawOwl(mouseX,mouseY,100,150);
} //mousePressed()

void drawOwl(float x, float y, float w, float h) {
  //Draw Owl (of width w, height h) with its center at <x, y>
  
  //Body
  strokeWeight(0);
  fill(#BC9667, 200);
  ellipse(x,y+h*2/3,w*3/2,h*6/5);
  
  //Head
  noStroke();
  quad(x-w*3/4,y-h/2,x+w*3/4,y-h/2,x+w/2,y+h/2,x-w/2,y+h/2);
  
  //Hair
  stroke(#867259);
  strokeWeight(20);
  line(x,y,x,y-h/4);
  line(x,y-h/4,x-w*3/4,y-h/2);
  line(x,y-h/4,x+w*3/4,y-h/2);
  
  //Eyes
  stroke(0);
  strokeWeight(10);
  ellipse(x-w/3,y-h/8,h/4,h/4);
  ellipse(x+w/3,y-h/8,h/4,h/4);
  noStroke();
  fill(mouseX*255/1000,mouseY*255/1000,random(255));
  ellipse(x-w/3,y-h/8,h/8,h/8);
  ellipse(x+w/3,y-h/8,h/8,h/8);
  
  //Mouse
  noStroke();
  fill(0);
  triangle(x-w/12,y+h/12,x+w/12,y+h/12,x,y+h/6);
  
  //Claws
  strokeWeight(10);
  stroke(0);
  line(x-w/4,y+h*5/6,x-w/4,y+h);
  line(x-w/4,y+h*5/6,x-w/3,y+h);
  line(x-w/4,y+h*5/6,x-w/6,y+h);
  line(x+w/4,y+h*5/6,x+w/4,y+h);
  line(x+w/4,y+h*5/6,x+w/3,y+h);
  line(x+w/4,y+h*5/6,x+w/6,y+h);

}// drawOwl()

