class Water {
  float x, y, w, h;
  float c;
  Water(float x_, float y_, float w_, float h_, float c_) {
    x = x_;
    y = y_;
    w = w_;
    h = h_;
    c = c_;
  }
  boolean contains(Mover m) {
    PVector l = m.location;
    if (l.x > x && l.x < x + w && l.y > y && l.y < y + h) {
      return true;
    } else {
      return false;
    }
  }

  PVector drag(Mover m) {
    float speed = m.velocity.mag();
    
    float dragMagnitude = c * speed * speed ;
    
  
    PVector dragForce = m.velocity.get();
    dragForce.mult(-1);

    dragForce.normalize();
    dragForce.mult(dragMagnitude);
    return dragForce;
  }
  void display() {
    noStroke();
    fill(#539AFA);
    rect(x, y, w, h);
  }
  void BKRD() {
    stroke(0);
    strokeWeight(10);
    line(0, 0, 0, height);
    line(0, 0, width, 0);
    line(width, height, width, 0);
    line(0, height, width, height);
  }
}
