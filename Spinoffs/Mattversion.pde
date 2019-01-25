int shipX = 250;
int shotX = 250;
int shotY = 480;
int alienX = 475;
int alien2X = 425;
boolean alienInvisible = false;
boolean alien2Invisible = true;
boolean shotInvisible = true;
String alienDir = "Left";
String alien2Dir = "Left";
int alienCount = 2;

void setup() {
  size(500,500);
  background(0);
}

void keyPressed() {
  if (keyCode == LEFT) {
    shipX-=4;
  }
  else if (keyCode == RIGHT) {
    shipX+=4;
  }
  else if (key == ' ') {
    shotInvisible = false;
    shotX = shipX;
    shotY = 450;
  }
}

void draw() {
  background(0);
  fill(69, 244, 66);
  triangle(shipX-20,490,shipX+20,490,shipX,460);
  if (shotInvisible) {
    fill(0,0,255,0);
    noStroke();
    if (shotY <= 20){
      shotInvisible = true;
    }
  }
  else {
    fill(0,0,255,255);
    noStroke();
  }
  ellipse(shotX, shotY, 25, 25);
  shotY -= 10;
  fill(255,0,0);
  triangle(alienX-20, 55, alienX+20, 55, alienX, 35);
  triangle(alien2X-20, 55, alien2X+20, 55, alien2X, 35);
  if (alienDir == "Left") {
    alienX -= 2;
    if (alienX <= 25) {
      alienDir = "Right";
    }
  }
  else if (alienDir == "Right") {
    alienX += 2;
    if (alienX >= 475) {
      alienDir = "Left";
    }
  }
  if (alien2Dir == "Left") {
    alien2X -= 2;
    if (alien2X <= 25) {
      alien2Dir = "Right";
    }
  }
  else if (alien2Dir == "Right") {
    alien2X += 2;
    if (alien2X >= 475) {
      alien2Dir = "Left";
    }
  }
  if (shotInvisible == false && shotY >= 45 && shotY <= 55 && shotX >= alienX-20 && shotX <= alienX+20) {
    alienX = 100000000;
    alienCount -= 1;
  }
  if (shotInvisible == false && shotY >= 45 && shotY <= 55 && shotX >= alien2X-20 && shotX <= alien2X+20) {
    alien2X = 100000000;
    alienCount -= 1;
  }
  if (alienCount == 0) {
    println("You win!");
    exit();
  }
}
