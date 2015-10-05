//draw a portrait

void setup(){
  //canvas
  size(500,700);
  background(200);
}

void draw(){
  //T-shirt
  noStroke();
  fill(227,73,104);
  rect(0,450,500,250);
 
 //neck
 fill(225,206,158);
 ellipse(200,450,250,180);
 
 //left hair
 fill(0);
 beginShape();
 curveVertex(0,650);
 curveVertex(0,650);
 curveVertex(80,470);
 curveVertex(150,400);
 curveVertex(200,350);
 curveVertex(100,100);
 curveVertex(0,200);
 curveVertex(0,200);
 endShape();
 
 //back hair
 triangle(550,450,350,320,300,450);
 
 //right hair
 beginShape();
 curveVertex(280,370);
 curveVertex(280,370);
 curveVertex(270,450);
 curveVertex(280,590); 
 curveVertex(200,700);
 curveVertex(300,700);
 curveVertex(380,550);
 curveVertex(350,450);
 curveVertex(350,450);
 endShape();
 
 beginShape();
 curveVertex(370,500);
 curveVertex(370,500);
 curveVertex(450,150);
 curveVertex(370,120);
 curveVertex(280,370);
 curveVertex(280,370);
 endShape();
 
 //middle hair
 smooth();
 ellipse(260,100,360,180);
 
 //face
 fill(245,226,178);
 beginShape();
 curveVertex(270,90);
 curveVertex(270,90);
 curveVertex(200,100);
 curveVertex(160,120);
 curveVertex(130,170);
 curveVertex(110,350);
 curveVertex(200,450);
 curveVertex(330,360);
 curveVertex(380,200);
 curveVertex(350,120);
 curveVertex(270,90);
 curveVertex(270,90);
 endShape();
 
 //mouse
 fill(255,204,204);
 beginShape();
 curveVertex(180,405);
 curveVertex(180,405);
 curveVertex(150,365);
 curveVertex(200,395);
 curveVertex(270,385);
 curveVertex(210,415);
 curveVertex(180,405);
 curveVertex(180,405);
 endShape();
 
 beginShape();
 curveVertex(200,390);
 curveVertex(200,390);
 curveVertex(150,365);
 curveVertex(210,375);
 curveVertex(270,385);
 curveVertex(200,390);
 curveVertex(200,390);
 endShape();
 
 //nose
 strokeWeight(4);
 stroke(50);
 noFill();
 beginShape();
 curveVertex(200,295);
 curveVertex(200,295);
 curveVertex(185,310);
 curveVertex(180,330);
 curveVertex(200,340);
 curveVertex(220,355);
 curveVertex(240,345);
 curveVertex(260,340);
 curveVertex(265,320);
 curveVertex(255,300);
 curveVertex(255,300);
 endShape();
 
 //eyes
 strokeWeight(10);
 arc(180,290,150,150,radians(240),radians(310));
 arc(310,300,150,150,radians(240),radians(310));
 
 save("Self Portrait.jpg");
 
 noLoop();
}

