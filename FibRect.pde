class FibRect {
  int w, h, x, y;
  ArrayList<PVector> squares;
  ArrayList<Arc> arcs;
  int[] fibs;
  int index, step, len, scale, curSquare;
  FibRect(int _len) {
    x = y = step = curSquare = 0;
    index = 2;
    scale = 10;
    squares = new ArrayList<PVector>();
    arcs = new ArrayList<Arc>();
    len = _len;
    // generates the first len-1 numbers in the fibonacci sequences
    fibs = new int[len];
    fibs[0] = 0;
    fibs[1] = 1;
    for (int n = 2; n < len; n++) {
      fibs[n] = fibs[n-1] + fibs[n-2];
    }
    println(fibs);
    squares.add(new PVector(0, 0, scale)); // push starting square
    arcs.add(new Arc(new PVector(scale, 0), 180, scale)); // push starting arc
    w = h = scale;
  }
  
  // creates next fibonacci square
  void generate() { // right -> up -> left -> down , counter clockwise
    if (index != len) {
      int n = fibs[index]*scale;
      switch(step % 4) {
      case 0: // right
        squares.add(new PVector(x+w, y, n));
        arcs.add(new Arc(new PVector(x+w, y), 90, n));
        w += n;
        break;
      case 1: // up
        y -= n;
        h += n;
        squares.add(new PVector(x, y, n));
        arcs.add(new Arc(new PVector(x, y+n), 360, n));
        break;
      case 2: // left
        x -= n;
        w += n;
        squares.add(new PVector(x, y, n));
        arcs.add(new Arc(new PVector(x+n, y+n), 270, n));
        break;
      case 3: // down
        squares.add(new PVector(x, y+h, n));
        arcs.add(new Arc(new PVector(x+n, y+h), 180, n));
        h += n;
        break;
      }
      step++;
      index++;
    }
  }

  void display() {
    stroke(255);
    Arc a = arcs.get(0); // just to suppress uninitialized warning
    for(int i = 0; i <= curSquare; i++){
       PVector s = squares.get(i);
       float h = map(s.z,scale,fibs[len-1]*scale,0,360);
       fill(h,100,100);
       a = arcs.get(i);
       strokeWeight(1);
       square(s.x,s.y,s.z);
       a.show();
    }
    
    if(!a.done()){
      a.step();
    } else {
      generate();
      curSquare++;
      curSquare = constrain(curSquare, 0, len-2);
    }
  }
}
