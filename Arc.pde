// Curtiss Williams
// Arc class is the quarter circle drawn in each
// fibonacci square
class Arc { 
  PVector offset; // offset from the upper left corner of the square
  int angle; // starting angle
  int r; // size of circle
  PVector[] points;
  int index;
  int size;
  Arc(PVector _offset, int _angle, int _r){
    offset = _offset;
    angle = _angle;
    r = _r;
    size = 46;
    points = new PVector[size];
    index = 0;
  }
  
  boolean done(){
    return index == size; 
  }
  
  // gets the next point on the circle
  void step(){ 
    if(index < size){
      float x = r * cos(radians(angle));
      float y = r * sin(radians(angle));
      points[index] = new PVector(x,y);
      index++;
      angle -= 2;
    }
  }
  
  void show(){
    pushMatrix();
    translate(offset.x,offset.y);
    stroke(255);
    strokeWeight(2);
    beginShape();
    for(int i = 0; i < index; i++){
      vertex(points[i].x,points[i].y);
    }
    endShape();
    popMatrix();
  }
  
}
