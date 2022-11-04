Particle [] boom = new Particle[2500];
void setup(){
  size(1000,1000);
  for(int i = 0; i < boom.length; i++){
    boom[i]  = new Particle();
  }
  boom[0] = new OddballParticle();
}
void draw()
{
  background(0);
  for(int i = 0; i < boom.length; i++){
    boom[i].move();
    boom[i].show();
  }
}
class Particle
{
  double myX, myY, myAngle;
  int mySpeed, myColor; 
  
  Particle(){
    myX = 500;
    myY = 500;
    myAngle = Math.random() * 2 * Math.PI;
    mySpeed = (int)(Math.random()*4) + 3 ;
    myColor = color(255,255,255);
  }
  
  void move(){
    myAngle += 0.01;
    myX += Math.cos(myAngle) * mySpeed;
    myY += Math.sin(myAngle) * mySpeed;
    if(myX > 1000 || myY > 1000 || myX < 0 || myY < 0){
      myX = 500;
      myY = 500;
    }
  }
  
  void show(){
    fill(myColor);
    ellipse((float)myX, (float)myY, 15, 15);
  }
}

class OddballParticle extends Particle{
  int myColor1, myColor2, myColor3, realColor;
  OddballParticle(){
    myX = 500;
    myY = 500;
    myAngle = Math.random() * 2 * Math.PI;
    mySpeed = 25;
    myColor1 = (int)(Math.random()*255) + 1;
    myColor2 = (int)(Math.random()*255) + 1;
    myColor3 = (int)(Math.random()*255) + 1;
    realColor = color(myColor1, myColor2, myColor3);
  }
  
  void move(){
   myAngle += 0.01;
    myX += Math.cos(myAngle) * mySpeed;
    myY += Math.sin(myAngle) * mySpeed;
    if(myX > 1000 || myY > 1000 || myX < 0 || myY < 0){
      myX = 500;
      myY = 500;
      myColor1 = (int)(Math.random()*255) + 1;
      myColor2 = (int)(Math.random()*255) + 1;
      myColor3 = (int)(Math.random()*255) + 1;
      realColor = color(myColor1, myColor2, myColor3);
    }
  }
  
  void show(){
    fill(realColor);
    ellipse((float)myX, (float)myY, 25, 25);
  }
}
