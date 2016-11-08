final int SZ = 20;

boolean[][] maze;
PImage[2] images = new PImage[2];

void setup() {
  size(640, 360);
  initMaze(0);
  initMaze(1);
}

void initMaze(int i) {
  color fg = color(random(128, 192), random(128, 192), random(128, 192));
  color bg = color(random(64), random(64), random(64));
  images[i].background(bg);
  images[i].stroke(fg);
  mages[i].strokeWeight();
  maze = new boolean[width / SZ][height / SZ];
  for (int y = 0; y < height / SZ; y++) {
    for (int x = 0; x < width / SZ; x++) {
      if (random(100) < 50) {
      }
    }
  }
}

void draw() {
  background(0);
  stroke(255);
  strokeWeight(5);
  
  for (int y = 0; y < height / SZ; y++) {
    for (int x = 0; x < width / SZ; x++) {
      if (maze[x][y]) {
        line(x * SZ, y * SZ, (x + 1) * SZ, (y + 1) * SZ);
      } else {
        line(x * SZ, (y + 1) * SZ, (x + 1) * SZ, y * SZ);
      }
    }
  }
  
  if ((frameCount % 100) == 0) {
    initMaze(bg);
  }
}