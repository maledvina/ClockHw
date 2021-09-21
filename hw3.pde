import processing.sound.*;
SoundFile file;
float Pa, Ma, Pb, Mb;
int cx, cy;
int x=-100;
int speed=1;
int num = 6;
float test, w, a;
PVector[] inkArray = new PVector[num];
PVector prevPos = new PVector(0,0);
float[] maxSize = new float[num];

float x1 = constrain (100,0,width); 
float y1 = constrain (100,0,height);
float r = 20;
float dis = 80;
char xy;
int name;
float secondsRadius;
float minutesRadius;
float hoursRadius;
float clockDiameter;

void setup() {
  size(1100, 700);
  background(255);
  name = 0;
   cx = width/2;
  cy = height/2;
  frameRate(56);
  
  int radius = min(width, height) / 2;
  secondsRadius = radius * 0.72-140;
  minutesRadius = radius * 0.60-140;
  hoursRadius = radius * 0.50-140;
  clockDiameter = radius * 1.8-140;
  
  for(int i=0; i<num; i++) {
    inkArray[i] = new PVector(random(-900, 800) + cx, 0);
    maxSize[i] = random(height+3);
  }
  textAlign(CENTER, CENTER);
  
   file = new SoundFile(this, "clock.mp3");
  //file.play();
}
    
void draw() {
   
  if (file.isPlaying()) {
   
  
    
  float a = map(mouseX, 0, width, 0.01, 1.0);
  file.amp(a);
  if (x1<950){
      x1 = x1+random(25,40);
      y1 = y1+random(-15,15);
  }
  else{
        x1=100;
        y1=y1+100;
 
  }
  fill(0);
  textSize(random(33,39));
  String str = "Listen to the Clock. To its rhythmical sound. It's not Tick-Tock. It's not Tick-Tock. It's A-Live. It's A-Live. The more you Listen. The More A-Live it is";//poema preciós d'Enric Casasses
  if (name < str.length()){
    char xy = str.charAt(name);
    text(xy, x1, y1);
    name++;

  }else {
      
    for(int i=0; i<num; i++) {
    prevPos.x = inkArray[i].x;
    prevPos.y = inkArray[i].y;
    inkArray[i].x += random(-0.5, 0.5);
    inkArray[i].y += random(3);
    w = abs(maxSize[i] / (inkArray[i].y + 25));
    a = map(inkArray[i].y, maxSize[i], -12, 0, 200);
    strokeWeight(w+8);
    stroke(255, 0, 0, a);
    if (inkArray[i].y < maxSize[i]) {
      line(prevPos.x, prevPos.y, inkArray[i].x, inkArray[i].y);
    } else {
      inkArray[i] = new PVector(random(-100, 100) + cx, 0); 
      maxSize[i] = random(height+3);
    }
  }
   
 // fill(255);
 // noStroke();
  //ellipse(cx, cy, clockDiameter-40, clockDiameter-40);

  
  float s = map(second(), 0, 60, 0, TWO_PI) - HALF_PI;
  float m = map(minute() + norm(second(), 0, 60), 0, 60, 0, TWO_PI) - HALF_PI; 
  float h = map(hour() + norm(minute(), 0, 60), 0, 24, 0, TWO_PI * 2) - HALF_PI;
  
  // Draw the hands of the clock
  stroke(255);
  strokeWeight(1);
  line(cx, cy, cx + cos(s) * secondsRadius, cy + sin(s) * secondsRadius);
  strokeWeight(4);
  line(cx, cy, cx + cos(m) * minutesRadius, cy + sin(m) * minutesRadius);
  strokeWeight(7);
  line(cx, cy, cx + cos(h) * hoursRadius, cy + sin(h) * hoursRadius);
  
  

}
} else{
  background(0);
   fill(224,245,0,80);
  ellipse (mouseX,mouseY,100,100);
  ellipse (mouseX,mouseY,200,200);
  ellipse (mouseX,mouseY,300,300);
 stroke(5);
  fill(5);
  strokeWeight(5500);
  noFill();
  ellipse(mouseX,mouseY,5700,5700);
        
    if(mousePressed){
      noStroke();
      noFill();
      background(5);
      fill(255,0,0);
      textSize (80);
      x=x+speed;

text("WHY WON'T YOU LISTEN? WHY WON'T YOU LISTEN? WHY WON'T YOU LISTEN? WHY WON'T YOU LISTEN?",x-100, random(0,height));
text("WHY WON'T YOU LISTEN? WHY WON'T YOU LISTEN? WHY WON'T YOU LISTEN? WHY WON'T YOU LISTEN?",x-345,random(0, height));
text("WHY WON'T YOU LISTEN? WHY WON'T YOU LISTEN? WHY WON'T YOU LISTEN? WHY WON'T YOU LISTEN?",x-235,random(0, height));
text("WHY WON'T YOU LISTEN? WHY WON'T YOU LISTEN? WHY WON'T YOU LISTEN? WHY WON'T YOU LISTEN?",x-631,random(0, height));


text("PLEASE COME BACK PLEASE COME BACK PLEASE COME BACK PLEASE COME BACK PLEASE COME BACK PLEASE COME BACK ",x-631,random(0, height));
text("PLEASE COME BACK PLEASE COME BACK PLEASE COME BACK PLEASE COME BACK PLEASE COME BACK PLEASE COME BACK ",x-531,random(0, height));
text("PLEASE COME BACK PLEASE COME BACK PLEASE COME BACK PLEASE COME BACK PLEASE COME BACK PLEASE COME BACK ",x-831,random(0, height));
text("PLEASE COME BACK PLEASE COME BACK PLEASE COME BACK PLEASE COME BACK PLEASE COME BACK PLEASE COME BACK ",x-341,random(0, height));
                 
    }
      
    
    }
  }
      
   
     
