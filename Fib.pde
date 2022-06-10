// Curtiss Williams
// Processing sketch that draws an approximation of the golden spiral by drawing squares in a 
// counter-clockwise manner and then connecting the corners with quarter circles.

//boolean recording = true;
FibRect fr;
float scl;
void setup() {
  size(600, 600);
  rectMode(CORNER);
  colorMode(HSB, 360, 100, 100);
  fr = new FibRect(9);
  scl = 5;
}

//void mousePressed(){
//  recording = false; 
//}

void draw(){
  translate(width/2+100, height/2);
  pushMatrix();
  scale(scl);
  scl -= 0.015;
  scl = constrain(scl,1.5,5);
  background(100);
  fr.display();
  popMatrix();
  //if(recording) saveFrame("output/fib-###.png");
}
