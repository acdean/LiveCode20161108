final int SZ = 20;
final int FADE = 100;

boolean[][] maze;
PGraphics[] images = new PGraphics[2];
int foreground = 0;

void setup() {
  size(640, 360);
  initMaze(0);
  initMaze(1);
  foreground = 0;
}

void initMaze(int i) {
  images[i] = createGraphics(width, height);
  images[i].beginDraw();
  color fg = color(random(128, 192), random(128, 192), random(128, 192));
  color bg = color(random(64), random(64), random(64));
  images[i].background(bg);
  images[i].stroke(fg);
  images[i].strokeWeight(random(1, 5));
  maze = new boolean[width / SZ][height / SZ];
  for (int y = 0; y < height / SZ; y++) {
    for (int x = 0; x < width / SZ; x++) {
      if (random(100) < 50) {
        images[i].line(x * SZ, y * SZ, (x + 1) * SZ, (y + 1) * SZ);
      } else {
        images[i].line(x * SZ, (y + 1) * SZ, (x + 1) * SZ, y * SZ);
      }
    }
  }
  images[i].endDraw();
}

// old draw flips screens but the rendering with SUBTRACT is nice
void oldDraw() {
  
  image(images[foreground], 0, 0);
  blendMode(SUBTRACT);
  image(images[(foreground + 1) % 2], 0, 0);
  
  if ((frameCount % FADE) == 0) {
    int background = (foreground + 1) % 2;
    initMaze(background);
    foreground = background;
  }
}

// this fades between screens, which is what i wanted. bit pedestrian though.
void draw() {
  
  int fade = (frameCount % FADE);
  float fadeOut = map(fade, 0, FADE, 0, 255);
  float fadeIn = map(fade, 0, FADE, 255, 0);

  if ((fade) == 0) {
    int background = (foreground + 1) % 2;
    initMaze(background);
    foreground = background;
  }

  tint(255, fadeOut);
  image(images[foreground], 0, 0);
  tint(255, fadeIn);
  image(images[(foreground + 1) % 2], 0, 0);
  
}

void keyPressed() {
  if (key == 's') {
    saveFrame("snapshot####.png");
  }
}