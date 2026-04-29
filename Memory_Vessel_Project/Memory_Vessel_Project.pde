// Memory vessel project
float a = 0;

// Colors
color ocean = #55BFFF;
color lightWave = #9FD8FA;
color darkWave = #358CC1;
color sand = #F5E09C;
color seagullBeak = #FFD900;

int[] y = {100, 200, 300, 400, 500, 600, 700, 800};


int seagullX = 1100;
int seagullY = 300;

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

    color waveColor = darkWave;

    if (i % 2 == 0) {
      waveColor = darkWave;
    } else {
      waveColor = lightWave;
    }

    wave(0, 1000, y[i], 50, waveColor);

    float vy = 5;
    //vy = map(y[i], 0, 800, 10, 30);
    y[i] += vy;

    if (y[i] >= 800) {
      y[i] = 0;
      
    }
  }
  
  for (int i = 50; i < 700; i += 300) {
    seagull(seagullX, i + sin(a)*50);
    a = a + radians(30);
    seagullX -= 5;
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

void seagull(int x, float y) {
  strokeWeight(2);
  stroke(0);
  fill(255);
  
  // tail
  quad(x + 50, y - 10, x + 50, y + 10, x + 90, y + 20, x + 90, y);
  
  // body
  ellipse(x, y, 120, 50);

  // front wing
  quad(x, y - 15, x + 25, y - 15, x + 35, y - 40, x + 10, y - 40);
  quad(x + 10, y - 40, x + 35, y - 40, x + 75, y - 65, x + 50, y - 65);
  
  // back wing
  quad(x, y - 25, x - 25, y - 25, x - 35, y - 50, x - 10, y - 50);
  quad(x - 10, y - 50, x - 35, y - 50, x - 75, y - 75, x - 50, y - 75);
  
  // beak
  fill(seagullBeak);
  triangle(x - 75, y, x - 60, y - 5, x - 60,  y + 5); 
  
  // eye
  fill(0);
  circle(x - 40, y - 5, 3);
  
}
