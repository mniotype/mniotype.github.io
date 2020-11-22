// for puff head
float headX;
float headY;
float speedX = .7;
float speedY = .9;
PImage bg;
int a; 

int mx = 0;
int my = 0;
int easing = 0.05;
int esize = 25.0;
int box = 30;

// for puff body
int cells = 1000;
float[]px= new float[cells];
float[]py= new float[cells];
float[]radiiX = new float[cells];
float[]radiiY = new float[cells];
float[]angle = new float[cells];
float[]frequency = new float[cells];
float[]cellRadius = new float[cells];

void setup(){
  
  size(500, 500);
  // begin in the center
  headX = width/2;
  headY = height/2;

  ellipseMode(CENTER_RADIUS);  

  //fill body arrays
  for (int i=0; i< cells; i++){
    radiiX[i] = random(-7, 7); 
    radiiY[i] = random(-4, 4);
    frequency[i]= random(-9, 9);
    cellRadius[i] = random(16, 30);
  }
  frameRate(30);
  bg = loadImage("data/milan_rubbish.jpg");
}

void draw(){

  background(51);

  a = (a + 1)%(width+132);
  stroke(26, 224, 10);


  line(0, a, width+392, a-61);
  line(0, a-6, width, a-2);
  line(41, a-62, width, a);
 line(0, a-random(1,3), width, a-random(1,23));
 line(41, a-62, width, a-random(1,1442)); line(41, a-62, width, a-random(101,142));
 line(141, a-62, width, a-random(-1,-16442));
line(141, a-62, width, a-random(-1,-16442));
line(random(0,500), a-random(-500,500), width, a-random(0,360));
line(random(0,500), a-random(-500,1500), width, a-random(0,360));
line(random(0,500), a-random(-500,1500), width, a-random(0,360));
line(random(0,500), a-random(-500,1500), width, a-random(0,360));
line(random(0,500), a-random(-500,1500), width, a-random(0,360));
line(random(0,500), a-random(-500,1500), 10, a-random(0,360));line(random(0,500), a-random(-500,1500), 10, a-random(0,360));line(random(0,500), a-random(-500,1500), 10, a-random(0,360));line(random(0,500), a-random(-500,1500), 10, a-random(0,360));line(random(0,500), a-random(-500,1500), 10, a-random(0,360));line(random(0,500), a-random(-500,1500), 10, a-random(0,360));line(random(0,500), a-random(-500,1500), 10, a-random(0,360));line(random(0,500), a-random(-500,1500), 10, a-random(0,360));line(random(0,500), a-random(-500,1500), 10, a-random(0,360));line(random(0,500), a-random(-500,1500), 10, a-random(0,360));line(random(0,500), a-random(-500,1500), 10, a-random(0,360));line(random(0,500), a-random(-500,1500), 10, a-random(0,360));line(random(0,500), a-random(-500,1500), 10, a-random(0,360));line(random(0,500), a-random(-500,1500), 10, a-random(0,360));line(random(0,500), a-random(-500,1500), 10, a-random(0,360));line(random(0,500), a-random(-500,1500), 10, a-random(0,360));line(random(0,500), a-random(-500,1500), 10, a-random(0,360));line(random(0,500), a-random(-500,1500), 10, a-random(0,360));line(random(0,500), a-random(-500,1500), 10, a-random(0,360));line(random(0,500), a-random(-500,1500), 10, a-random(0,360));line(random(0,500), a-random(-500,1500), 10, a-random(0,360));line(random(0,500), a-random(-500,1500), 10, a-random(0,360));line(random(0,500), a-random(-500,1500), 10, a-random(0,360));line(random(0,500), a-random(-500,1500), 10, a-random(0,360));line(random(0,500), a-random(-500,1500), 10, a-random(0,360));line(random(0,500), a-random(-500,1500), 10, a-random(0,360));line(random(0,500), a-random(-500,1500), 10, a-random(0,360));line(random(0,500), a-random(-500,1500), 10, a-random(0,360));line(random(0,500), a-random(-500,1500), 10, a-random(0,360));line(random(0,500), a-random(-500,1500), 10, a-random(0,360));line(random(0,500), a-random(-500,1500), 10, a-random(0,360));line(random(0,500), a-random(-500,1500), 10, a-random(0,360));line(random(0,500), a-random(-500,1500), 10, a-random(0,360));line(random(0,500), a-random(-500,1500), 10, a-random(0,360));line(random(0,500), a-random(-500,1500), 10, a-random(0,360));line(random(0,500), a-random(-500,1500), 10, a-random(0,360));line(random(0,500), a-random(-500,1500), 10, a-random(0,360));line(random(0,500), a-random(-500,1500), 10, a-random(0,360));line(random(0,500), a-random(-500,1500), 10, a-random(0,360));line(random(0,500), a-random(-500,1500), 10, a-random(0,360));line(random(0,500), a-random(-500,1500), 10, a-random(0,360));


 if(abs(mouseX - mx) > 1) {
    mx = mx + (mouseX - mx) * easing;
  }
  if(abs(mouseY - my) > 1) {
    my = my + (mouseY- my) * easing;
  }
  
  int distance = esize * 2;
  mx = constrain(mx, box+distance, width-box-distance);
  my = constrain(my, box+distance, height-box-distance);
  fill(76);
  rect(box+esize, box+esize, box*3, box*3);
  fill(255);  
  ellipse(mx, my, esize, esize);

 

  noStroke();
  fill(25, 25, 255, 5);

  //follow the leader
  for (int i =0; i< cells; i++){
    if (i==0){
      px[i] = headX+sin(radians(angle[i]))*radiiX[i];
      py[i] = headY+cos(radians(angle[i*2]))*radiiY[i];
    } 
    else{
      px[i] = px[i-1]+cos(radians(angle[i]))*radiiX[i];
      py[i] = py[i-1]+sin(radians(angle[i]))*radiiY[i];

      //check collision of body
      if (px[i] >= width-cellRadius[i]/2 || px[i] <= cellRadius[i]/2){
        radiiX[i]*=-1;
        cellRadius[i] = random(1, 140);
        frequency[i]= random(-13, 13);
      }
      if (py[i] >= height-cellRadius[i]/2 || py[i] <= cellRadius[i]/2){
        radiiY[i]*=-1;
        cellRadius[i] = random(1, 40);
        frequency[i]= random(-9, 9);
      }
    }
    // draw puff
    ellipse(px[i*2],  py[i],  cellRadius[i],  cellRadius[i]);
    // set speed of body
    angle[i]+=frequency[i];
  }

  // set velocity of head
  headX+=speedX;
  headY+=speedY;

  //check boundary collision of head
  if (headX >= width-cellRadius[0]/2 || headX <=cellRadius[0]/2){
    speedX*=-1;
  }
  if (headY >= height-cellRadius[0]/2 || headY <= cellRadius[0]/2){
    speedY*=-1;
  }
}