import lll.wrj4P5.*;
import lll.Loc.*;

Wrj4P5 wii;

float sealength=2500;
float seawidth=1500;
float wavelength;
float waveheight=5;
float initialphase=0;
float xincrements=10;
float wavespeed;
float boatangle=PI;
float boatvelocity=0;
float boatdrift;
float boatx=10;
float boaty=250;
boolean buttonApressed=false;
boolean buttonBpressed=false;
PImage b;

void setup()
{
  b = loadImage("beach.jpg");
  b.resize(width, height);
  size(1000, 760, P3D);
  wavelength=1000-waveheight*20;
  wavespeed=(1/waveheight)*70;
  boatdrift=waveheight/5;
  wii=new Wrj4P5(this);
  wii.connect();
}

void boat(float xboat, float yboat)
{
  float xphase;
  float boatheight;
  xphase=((xboat/wavelength)*2*PI)+initialphase;
  boatheight=sin(xphase+PI)*waveheight;
  pushMatrix();
  translate(xboat,boatheight,yboat);
  rotateY(boatangle);
  beginShape(TRIANGLES);
  fill(200,200,200);
  vertex(-50,boatheight-25,0);
  vertex(-10,boatheight-25,-25);
  vertex(-10,boatheight-25,25);
  vertex(-10,boatheight-25,-25);
  vertex(50,boatheight-25,-25);
  vertex(50,boatheight-25,25);
  vertex(-10,boatheight-25,25);
  vertex(-10,boatheight-25,-25);
  vertex(50,boatheight-25,25);
  fill(20,255,20);
  vertex(-10,boatheight+15,0);
  vertex(-10,boatheight-25,25);
  vertex(-50,boatheight-25,0);
  vertex(-50,boatheight-25,0);
  vertex(-10,boatheight-25,-25);
  vertex(-10,boatheight+15,0);  
  vertex(-10,boatheight-25,25);
  vertex(50,boatheight-25,25);
  vertex(-10,boatheight+15,0);
  vertex(50,boatheight-25,25);
  vertex(50,boatheight+15,0);
  vertex(-10,boatheight+15,0);
  vertex(-10,boatheight+15,0);
  vertex(50,boatheight-25,-25);
  vertex(-10,boatheight-25,-25);
  vertex(50,boatheight-25,-25);
  vertex(-10,boatheight+15,0);
  vertex(50,boatheight+15,0);
  vertex(50,boatheight-25,25);
  vertex(50,boatheight-25,-25);
  vertex(50,boatheight+15,0);
  endShape();
  beginShape(TRIANGLES);
  fill(255,255,255);
  vertex(5,boatheight-25-60,-30);
  vertex(5,boatheight-25-60,30);
  vertex(5,boatheight-25-20,-30);
  vertex(5,boatheight-25-60,30);
  vertex(5,boatheight-25-20,30);
  vertex(5,boatheight-25-20,-30);
  endShape();
  fill(255,255,255);  
  translate(10,boatheight-60,0);
  box(5,70,5);
  popMatrix();  
}

void bouy(float xpos, float ypos)
{
  float xphase;
  float xheight;
  pushMatrix();
  xphase=((xpos/wavelength)*2*PI)+initialphase+(PI/20);
  xheight=sin(xphase)*waveheight;
  translate(xpos-sealength/2,xheight,ypos-seawidth/2);
  fill(255,0,0);
  scale(15/2,20/2,15/2);
  sphere(1);
  popMatrix();
  pushMatrix();
  xphase=((xpos/wavelength)*2*PI)+initialphase+(PI/20);
  xheight=sin(xphase)*waveheight;
  translate(xpos-sealength/2,xheight,ypos-seawidth/2);
  fill(255,255,255);
  scale(16/2,10/2,16/2);
  sphere(1);
  popMatrix();
}

void draw()
{
  background(b);
  float xphase;
  float xheight;
  float bang;
  float xmax;
  bang=wii.rimokon.senced.x;
  boatangle=boatangle+map(bang,-1,1,PI/50,-PI/50);
  if(buttonBpressed)
  {
    boatvelocity+=0.3;
    if(boatvelocity>30) boatvelocity=30;
  }    
  if(buttonApressed)
  {
    boatvelocity-=0.3;
    if(boatvelocity<-30) boatvelocity=-30;
  }    
  boatvelocity*=0.98;
  boaty=boaty-boatvelocity*cos(boatangle+PI/2);
  if (boaty<-550) boaty=-550;
  if (boaty>550) boaty=550;
  boatx=boatx-boatvelocity*sin(boatangle+PI/2)-boatdrift;
  xmax=map(boaty,-550,550,980,230);
  if (boatx<-xmax) boatx=-xmax;
  if (boatx>xmax) boatx=+xmax;
  noStroke();
  directionalLight(255,255,255,1,1,0);
  rotateX(-PI/8);
  translate(width/2,height/2,0);
  bouy(sealength/2,(seawidth/2)+50);
  bouy((sealength/2)-500,(seawidth/2)-300);
  bouy((sealength/2)+250,(seawidth/2)+400);
  bouy((sealength/2)-250,(seawidth/2)+400);
  bouy((sealength/2)+500,(seawidth/2)-300);
  boat(boatx,boaty);
  fill(191,239,255);
  beginShape(QUAD_STRIP);
  for(int x = 0; x <= sealength; x+=xincrements)
  {
    xphase=((x/wavelength)*2*PI)+initialphase;
    xheight=sin(xphase)*waveheight;
    vertex(x-sealength/2,xheight,-seawidth/2);
    vertex(x-sealength/2,xheight,seawidth/2);
  }
  endShape();
  initialphase+=PI/wavespeed;
  if(initialphase>=2*PI)
  {
    initialphase-=2*PI;
  }
}

void buttonPressed(RimokonEvent evt, int rid)
{
  if (evt.wasPressed(RimokonEvent.A)) buttonApressed=true;
  if (evt.wasPressed(RimokonEvent.B)) buttonBpressed=true;
  if (evt.wasPressed(RimokonEvent.PLUS))
  {
    waveheight+=1;
    if(waveheight>15) waveheight=15;
    wavelength=1000-waveheight*20;
    wavespeed=(1/waveheight)*70;
    boatdrift=waveheight/5;
  }
  if (evt.wasPressed(RimokonEvent.MINUS))
  {
    waveheight-=1;
    if(waveheight<0) waveheight=0;
    wavelength=1000-waveheight*20;
    wavespeed=(1/waveheight)*70;
    boatdrift=waveheight/5;
  }
  if (evt.wasPressed(RimokonEvent.HOME))
  {
    waveheight=5;
    boatangle=PI;
    boatvelocity=0;
    boatx=10;
    boaty=250;
    wavelength=1000-waveheight*20;
    wavespeed=(1/waveheight)*70;
    boatdrift=waveheight/5;
  }
}

void buttonReleased(RimokonEvent evt, int rid)
{
  if (evt.wasReleased(RimokonEvent.A)) buttonApressed=false;
  if (evt.wasReleased(RimokonEvent.B)) buttonBpressed=false;
}
