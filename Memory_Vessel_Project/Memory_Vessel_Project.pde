// Memory vessel project

// Colors
color ocean = #55BFFF;
color lightWave = #9FD8FA;
color darkWave = #358CC1;
color sand = #F5E09C;

int[] y = {100, 200, 300, 400, 500, 600, 700};

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
    wave(int(random(100, 401)), int(random(50, 901)), y[i], 50, waveColor);
    
    y[i] += 10;

    if (y[i] >= 700) {
      y[i] = 0;
    }
  }
  
}

void wave(int startX, int endX, int y, int size, color Color) {
  for (int i = startX; i <= endX; i += size) {
    strokeWeight(10);
    //a = map (y, ....);
    stroke(Color);
    noFill();
    arc(i, y, size, size, PI, 2 * PI);
  }
}
