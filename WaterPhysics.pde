int amt = 1;
Mover[] mvrs = new Mover[amt];
Water substance;
PrlnNis mvmt = new PrlnNis(1, 0);
void setup() {
  size(500, 500);
  createMovers();
  substance  = new Water(0, height/2, width, height/2, 0.5);
}

void draw() {
  background(255);
  substance.display();
  substance.BKRD();
  createSimulation();
  
}

void createSimulation(){
  for (int i = 0; i < mvrs.length; i++) {
    if (substance.contains(mvrs[i])) {
      PVector dragForce = substance.drag(mvrs[i]);
      mvrs[i].applyForce(dragForce);
    }
    PVector gravity = new PVector(0, 0.1*mvrs[i].mass);
    mvrs[i].applyForce(gravity);
    
    mvrs[i].drag();
    mvrs[i].hover(mouseX, mouseY);

    mvrs[i].update();
    float sway = mvmt.sway();
    mvrs[i].display(sway);
    mvrs[i].edges();
  }
  //noise();

}

void createMovers() {
  for (int i = 0; i < mvrs.length; i++) {
    mvrs[i] = new Mover(random(1, 15), 250, 0);
    //100+(150*i)
  }
}

void noise() {
  for (int i = 0; i < mvrs.length; i++) {
    if (!substance.contains(mvrs[i])) {
      PVector wind = new PVector( 5/mvrs[i].mass, 0.0);
      mvrs[i].applyForce(wind);
    } else if (substance.contains(mvrs[i])) {
      PVector jetStream = new PVector(-8/mvrs[i].mass, 0.0);
      mvrs[i].applyForce(jetStream);
    }
  }
}

void keyPressed() {
  createMovers();
}

void mousePressed() {
  for (int i = 0; i < mvrs.length; i++) {
    mvrs[i].clicked(mouseX, mouseY);
  }
}

void mouseReleased() {
  for (int i = 0; i < mvrs.length; i++) {
    mvrs[i].stopDragging();
  }
}
