// Memory vessel project

// Colors
color ocean = #55BFFF;
color lightWave = #9FD8FA;
color darkWave = #358CC1;
color sand = #F5E09C;

int y = 100;

void setup() {
  size(1000, 1000); 
}

void draw() {
  noStroke();
  
  // Ocean
  fill(ocean);
  rect(0, 0, width, 700);
  
  // Sand
  fill(sand);
  rect(0, 700, width, 300);
  
  /*wave(50, 700, 400, 50, darkWave);
  wave(100, 800, 200, 100, lightWave);*/
  
    for (int i = 0; i <= 10; i++) {
       wave(100, 900, y, 50, darkWave);
       y += 5;
       if (y >= 700) {
          y = -100;
       }
    }
}

void wave(int startX, int endX, int y, int size, color Color) {
  for (int i = startX; i <= endX; i += size) {
    strokeWeight(10);
    stroke(Color);
    noFill();
    arc(i, y, size, size, PI, 2 * PI); 
  }
}
