class Mover {
 
  PVector location;
  PVector velocity;
  PVector acceleration;

  float mass;
  float diameter = 10;

  boolean dragging = false; 
  boolean rollover = false; 
  PVector dragOffset;  

  Mover(float m, float x, float y) {
    mass = m;
    location = new PVector(x, y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    dragOffset = new PVector(0.0, 0.0);
  }

  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }

  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }

  void display(float sway) {
    stroke(0);
    strokeWeight(5);
    if (dragging) fill (50);
    else if (rollover) fill(100);
    else fill(175, 200);
    rectMode(CENTER);
    rect(location.x+sway, location.y+sway, mass*diameter, mass*diameter);
    rectMode(CORNER);
    //ellipse(location.x+sway, location.y+sway, mass*diameter, mass*diameter);
  }

  void edges() {
    float gravDecrease = map(mass, 0, 100, 0.80, 0.20); 
    if (location.x > width - (diameter*mass/2)) {
      location.x = width- (diameter*mass/2);
      velocity.x *= -gravDecrease;
    }
    if (location.x < 0 + (diameter*mass/2)) {
      location.x = 0+ (diameter*mass/2);
      velocity.x *= -gravDecrease;
    }

    if (location.y > height - (diameter*mass/2)) {
      location.y = height- (diameter*mass/2);
      velocity.y *= -gravDecrease;
    }
    if (location.y < 0 + (diameter*mass/2)) {
      location.y = 0+ (diameter*mass/2);
      velocity.y *= -gravDecrease;
    }
  }

  /////////////////// ///////////////////////////////////////////////////////// 
  void clicked(int mx, int my) {
    float d = dist(mx, my, location.x, location.y);
    if (d < (mass*diameter)/2) {
      dragging = true;
      dragOffset.x = location.x-mx;
      dragOffset.y = location.y-my;
    }
  }

  void hover(int mx, int my) {
    float d = dist(mx, my, location.x, location.y);
    if (d < (mass*diameter)/2) {
      rollover = true;
    } else {
      rollover = false;
    }
  }

  void stopDragging() {
    dragging = false;
  }

  void drag() {
    if (dragging) {
      location.x = mouseX + dragOffset.x;
      location.y = mouseY + dragOffset.y;
    }
  }
}
