//draw a zoog

//background
background(61,147,242);
size(400,400);

//body
rectMode(CENTER);
noStroke();
fill(250,245,184);
rect(200,250,80,180);

//head
strokeWeight(5);
stroke(170);
ellipse(200,120,240,120);

//eyes
strokeWeight(10);
stroke(0);
fill(0);
ellipse(162,70,16,32);
ellipse(238,70,16,32);

//feet
line(160,340,80,160);
line(240,340,320,160);
