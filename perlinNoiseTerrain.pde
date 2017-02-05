int cols,rows;
int scl = 20;
int w=1600;
int h=2600;

float fly = 0;
float[][] terrain;

void setup() {
  size(600,600 , P3D);
  colorMode(HSB);
  cols = w/scl;
  rows = h/scl;
  terrain = new float[cols][rows];
}

void draw() {
  fly-=0.05;
  float yoff=fly;
  for(int y=0; y<rows; y++){
    float xoff=0;
    for(int x=0; x<cols; x++){
      terrain[x][y] = noise(xoff,yoff);
      terrain[x][y] = map(terrain[x][y],0,1,-80,80);
      xoff += 0.1;
    }
    yoff += 0.1;
  }

  background(0);
  stroke(255);
  noFill();
  translate(width/2,height/2);

  rotateX(PI/3);

  translate(-w/2,-h/2+50);
  for(int y=0; y<rows-1; y++){
    beginShape(TRIANGLE_STRIP);
    for(int x=0; x<cols; x++){
      stroke(map(terrain[x][y],-80,80,0,360),300,300);
      vertex(x*scl,y*scl, terrain[x][y]);
      stroke(map(terrain[x][y+1],-80,80,0,360),300,300);
      vertex(x*scl,(y+1)*scl,terrain[x][y+1]);
    }
    endShape();
  }
}
