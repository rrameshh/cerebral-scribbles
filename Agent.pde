class Agent {
  float x, y, z;
  float size, speed;
  
  float cellx, celly;
  float cellw, cellh;
  int max, min, currentsig, num;
  
  float rand;
  color col;
  
  
  Agent(float _x, float _y, float _cellw, float _cellh, int _max, int _min, int _currentnum, int _num) {
    x = _x;
    y = _y; 
    cellx = x;
    celly = y;
    cellw = x + _cellw;
    cellh = y + _cellh;
    max = _max;
    min = _min;
    currentsig = _currentnum;
    num = _num;
 
    z = (0.06*(currentsig-min))/(max-min)+0.02;

    size = random(0.5, 3);
    speed = random(1, 5);
    
    rand = random(1);
    col = cols[(int)random(cols.length)];
    
    
  }
  
  void style() {
    strokeWeight(size);
 
    if (num>42&&num<240) {    
          stroke(col);
    }
    else if ((num>248&&num<258)||(num>268&&num<278))
      stroke(col);
    else if ((num>291&&num<298) || (num>332&&num<336) || (num>312&&num<316))
      stroke(col);
    else
      noStroke();
  }
  
  void display(int count) {
    push();
    style();
    beginShape();
    for (int i = 0; i<count; i++) {
      update();
    }
    endShape();
    
    
    pop();
  }
  
  void update() {
    float angle = noise(x/noiseScale, y/noiseScale, z) * noiseStrength;
    x += cos(angle) * speed;
    y += sin(angle) * speed;
    bounds();
    z += 0.008;
    
    vertex(x, y);
    
  
  }
  
  void bounds() {
    x = constrain(x, cellx, cellw);
    y = constrain(y, celly, cellh);
    
   
  }
}
