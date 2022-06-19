
PImage bg;
color[] cols = {#E3E3E3, #255D6E, #5A707E, #D3A9AB, #E4CED0};


float noiseScale = 2000, noiseStrength = 400;

int margin = 50;
int min, max;
int count = 20;



int area = count * count;
float cellw, cellh;

PVector[] pos = new PVector[area];
Agent[] agents = new Agent[area];

void setup() {
  size(1080, 1080);
  background(255);
 
 
  noFill();
  frameRate(30);
 
  String lines[] = loadStrings("S001.txt");
  int signals[] = new int[lines.length];
  for (int s = 0; s<lines.length; s++) {
    signals[s] = Integer.parseInt(lines[s]);  
    if (s==0) {
        max = signals[0];
        min = signals[0];
    }
    else {
        if (signals[s]>max) {
          max = signals[s];
        }
        else if (signals[s]<min) {
          min = signals[s];
        }
    }

  }

  
  
 bg = loadImage("white.jpg");
 bg.resize(width, height);
  
  
  cellw = (width-(margin*2))/(float)count;
  cellh = (height-(margin*2))/(float)count;
  
  initGrid();
  
  for (int i =0; i< agents.length; i++) {
    
    agents[i] = new Agent(pos[i].x, pos[i].y, cellw, cellh, max, min, signals[i], i);
  }

}

void draw() {
  image(bg, 0, 0);
  push();
  blendMode(MULTIPLY);
  stroke(cols[0], 50);
  //guides(count*4, count*4);
  
  stroke(cols[1], 50);
  //guides(count, count);
  
  pop();
  
  for (Agent agent: agents) {
    agent.display(800);
    
  }
  saveFrame("output/agent_####.png");
}

void initGrid() {
  for (int n = 0; n < area; n++) {
     int i = n%count;
     int j = n/count;
     pos[n] = new PVector((i*cellw) + margin, (j*cellh) + margin);    
  }
}

void guides(int xcount, int ycount) {
  int area = xcount * ycount;
  float cellw = (width - margin * 2)/(float)xcount;
  float cellh = (height - margin * 2)/(float)ycount;
  
   for (int n = 0; n < area; n++) {
     int i = n%xcount;
     int j = n/xcount;
     rect((i*cellw) + margin, (j*cellh) + margin, cellw, cellh);    
  }
}
