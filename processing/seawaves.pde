// Sea Waves 3D Applet in Processing
// Copyright Andrew Thomas, March 2010
// See www.geocomputing.co.uk for details
//
// You may use this code freely if, wherever it is published,
// you cite the copyright owner, provide a link to the
// geocomputing website, and you use it at your own risk.
//
// I can't be held responsible if you drown using it or
// get sea sick ;-)


float sealength=2500;
float seawidth=1000;
float wavelength;
float waveheight=8;
float initialphase=0;
float xincrements=10;
float wavespeed;
float boatangle=0;
float boatvelocity=2;
float boatx=100;
float boaty=+100;

void setup()
{
  size(500, 400, P3D);
//  size(1000, 500, P3D);
  wavelength=1000-waveheight*20;
  wavespeed=(1/waveheight)*70;
}

void boat(float xboat, float yboat)
{
  float xphase;
  float boatheight;
  xphase=((xboat/wavelength)*2*PI)+initialphase;
  boatheight=sin(xphase+PI)*waveheight;
  pushMatrix();
  scale(0.75);
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
  float xphase;
  float xheight;
  background(84,169,224);
  boatx=boatx-boatvelocity*sin(boatangle+PI/2);
  if (boatx<-400) boatx=-400;
  if (boatx>400) boatx=+400;
  boaty=boaty-boatvelocity*cos(boatangle+PI/2);
  if (boaty<-500) boaty=-500;
  if (boaty>550) boaty=550;
  noStroke();
  directionalLight(255,255,255,1,1,0);
  rotateX(-PI/4);
  translate(width/2,height/2-50,0);
  scale(0.75);
  bouy(sealength/2,seawidth/2+50);
  bouy((sealength/2)-200,(seawidth/2)-200);
  bouy((sealength/2)+200,(seawidth/2)+300);
  bouy((sealength/2)-200,(seawidth/2)+300);
  bouy((sealength/2)+200,(seawidth/2)-200);
  boat(boatx,boaty);
  fill(2,161,216);
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

void keyPressed()
{
  if (key == CODED)
  {
    if (keyCode == UP)
    {
      waveheight+=1;
      if(waveheight>12) waveheight=12;
      wavelength=1000-waveheight*20;
      wavespeed=(1/waveheight)*70;
    }
    else if (keyCode == DOWN)
    {
      waveheight-=1;
      if(waveheight<0) waveheight=0;
      wavelength=1000-waveheight*20;
      wavespeed=(1/waveheight)*70;
    } 
    else if (keyCode == LEFT)
    {
      boatangle+=PI/40;
      if(boatangle>2*PI) boatangle-=2*PI;
    } 
    else if (keyCode == RIGHT)
    {
      boatangle-=PI/40;
      if(boatangle<0) boatangle+=2*PI;
    } 
  }
  if (key == '0')
  {
    boatvelocity=0;
  } 
  else if (key == '1')
  {
    boatvelocity=2;
  } 
  else if (key == '2')
  {
    boatvelocity=4;
  } 
  else if (key == '3')
  {
    boatvelocity=6;
  } 
  else if (key == '4')
  {
    boatvelocity=8;
  } 
  else if (key == '5')
  {
    boatvelocity=10;
  } 
  else if (key == '6')
  {
    boatvelocity=12;
  } 
  else if (key == '7')
  {
    boatvelocity=14;
  } 
  else if (key == '8')
  {
    boatvelocity=16;
  } 
  else if (key == '9')
  {
    boatvelocity=18;
  } 
}

