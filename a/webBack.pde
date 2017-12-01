int ballCount = 50;
float speed = 1.2;
float [] ballSize = new float[ballCount];
float [] xPosition = new float[ballCount];
float [] yPosition = new float[ballCount];
float [] xSpeed = new float[ballCount];
float [] ySpeed = new float[ballCount];
float [] colorR = new float[ballCount];
float [] colorG = new float[ballCount];
float [] colorB = new float[ballCount];
int [] weight = new float[ballCount];
float [] opac = new float[ballCount];
boolean [] dying = new boolean[ballCount];
void setup() {
  size(window.innerWidth,window.innerHeight);
  //size(screen.width,screen.height);
  //size(800,800);
  for (int i=0; i<ballCount; i++) {
    ballSize[i] = random(45, 90);
    xPosition[i] = random(width);
    yPosition[i] = random(height);
    xSpeed[i] = random(-speed, speed);
    ySpeed[i] = random(-speed, speed);
    colorR[i] = random(40);
    colorG[i] = random(80, 100);
    colorB[i] = random(120, 180);
    weight[i] = int(random(1, 4));
    opac[i] = 0;
    dying[i]= false;
  }
}

void draw() {
  background(#18445A);
  for (int i=0; i<ballCount; i++) {
    if (opac[i] < 0){
      xPosition[i] = random(width);
      yPosition[i] = random(height);
      opac[i]=0;
      dying[i] = false;
    }
    if (dying[i] == true){
      opac[i]-=15;
    }else{
      if (opac[i]<200) {
        opac[i]+=3;
      }
    }
    if (abs(xPosition[i] - mouseX)<ballSize[i] && abs(yPosition[i] - mouseY)<ballSize[i]){
      dying[i] = true;
    }
    if (dying[i] == false){
    xPosition[i] += xSpeed[i];
    yPosition[i] += ySpeed[i];
    }
    stroke(colorR[i], colorG[i], colorB[i], opac[i]);
    strokeWeight(weight[i]);
    fill(colorR[i], colorG[i], colorB[i], opac[i]-20);
    ellipse(xPosition[i], yPosition[i], ballSize[i], ballSize[i]);

    if (xPosition[i] < ballSize[i]*-2) {
      xPosition[i] = random(width);
      yPosition[i] = random(height);
      opac[i]=0;
    }
    if (xPosition[i] > width+ballSize[i]*2) {
      xPosition[i] = random(width);
      yPosition[i] = random(height);
      opac[i]=0;
    }
    if (yPosition[i] < ballSize[i]*-2) {
      xPosition[i] = random(width);
      yPosition[i] = random(height);
      opac[i]=0;
    }
    if (yPosition[i] > height+ballSize[i]*2) {
      xPosition[i] = random(width);
      yPosition[i] = random(height);
      opac[i]=0;
    }
  }
}


