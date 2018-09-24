class PrlnNis {
  float t = 0;
  PrlnNis(float _average, float _yInt) {

    
  }
  float sway() {
  float x = noise(t);
  x = map(x,0,1,-10,10);
  t+= 0.01;
    return x;
    
  }
}
