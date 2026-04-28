// Memory vessel project

// Colors
color ocean = #55BFFF;
color lightWave = #9FD8FA;
color darkWave = #358CC1;
color sand = #F5E09C;

int[] y = {100, 200, 300, 400, 500, 600, 700};
int[] x1 = {100, 200, 300, 400};
int[] x2 = {500, 600, 700, 800, 900};

void setup() {
  size(1000, 1000, P2D);
}

void draw() {
  noStroke();

  // Ocean
  fill(ocean);
  rect(0, 0, width, 700);

  // Sand
  fill(sand);
  rect(0, 700, width, 300);

  for (int i = 0; i < y.length; i ++) {

    int colorNum = int(random(0, 2));
    color waveColor = darkWave;

    if (colorNum == 1) {
      waveColor = darkWave;
    } else {
      waveColor = lightWave;
    }
    wave(100, 900, y[i], 50, darkWave);

    /*if (y[i] < 200) {
      y[i] += 3;
    } else if (y[i] < 400) {
      y[i] += 5; 
    } else if (y[i] < 700) {
      y[i] += 10; 
    }*/

    float vy;
    
    if (y[i] >= 0 && y[i] <= 700) {
      vy = map(y[i], 0, 700, 5, 20);
    } else{
      vy = -1;
    }
    
    if (y[i] < 700 && vy < 0) {
      y[i] = 100;
    }
    
    y[i] += vy;
  }
}

void wave(int startX, int endX, int y, int size, color Color) {
  for (int i = startX; i <= endX; i += size) {
    strokeWeight(10);
    float transparency = map(y, 0, 800, 255, 0);
    stroke(Color, transparency);
    noFill();
    arc(i, y, size, size, PI, 2 * PI);
  }
}
