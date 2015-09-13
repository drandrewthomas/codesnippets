int linefeed=10;
float xrot=0;
float xang=0;
float gravity=9.8;
float upaccel=0;
float groundPos=1.5;
float upPos=1.5;
float xoffset=0;
float yoffset=0;
float assembled=1;
float fps=20;
float zoom=75;

void setup()
{
  size(300,300,P3D);
  frameRate(fps);
  noStroke();
  fill(204, 204);
}

void keyPressed()
{
  if(key == 'd' && upPos==groundPos)
  {
    xrot=0;
    xang=0;
    gravity=9.8;
    upaccel=0;
    upPos=1.5;
    xoffset=0;
    yoffset=0;
    assembled=1;
    zoom=75;
  }
  if(key == 'j' && upPos==groundPos)
  {
    upaccel=15;
  }
  if(key == 'i')
  {
    zoom+=5;
    if(zoom>150) zoom=150;
  }
  if(key == 'o')
  {
    zoom-=5;
    if(zoom<30) zoom=30;
  }
  if(key == 'a')
  {
    assembled+=0.1;
    if(assembled>3) assembled=3;
  }
  if(key == 's')
  {
    assembled-=0.1;
    if(assembled<0) assembled=0;
  }
  if(key == '.')
  {
    xrot+=0.1;
    if(xrot>1) xrot=1;
  }
  if(key == ',')
  {
    xrot-=0.1;
    if(xrot<-1) xrot=-1;
  }
  if(keyCode == UP)
  {
    yoffset-=5;
    if(yoffset<-300) yoffset=-300;
  }
  if(keyCode == DOWN)
  {
    yoffset+=5;
    if(yoffset>300) yoffset=300;
  }
  if(keyCode == LEFT)
  {
    xoffset-=5;
    if(xoffset<-300) xoffset=-300;
  }
  if(keyCode == RIGHT)
  {
    xoffset+=5;
    if(xoffset>300) xoffset=300;
  }
}

void puppet()
{
  pushMatrix();
  translate(0*assembled,(-1.594*assembled)+upPos,-0.050);
  fill(255,200,100);
  scale(0.0744,0.1063,0.0744);
  sphere(1);
  popMatrix();
  pushMatrix();
  translate(0*assembled,(-1.456*assembled)+upPos,-0.050);
  fill(255,200,100);
  scale(2,2,2);
  box(0.0638,0.0319,0.0414);
  popMatrix();
  pushMatrix();
  translate(-0.159*assembled,(-1.349*assembled)+upPos,-0.064);
  fill(255,0,0);
  scale(2,2,2);
  box(0.0638,0.0744,0.0638);
  popMatrix();
  pushMatrix();
  translate(0.159*assembled,(-1.349*assembled)+upPos,-0.064);
  fill(255,0,0);
  scale(2,2,2);
  box(0.0638,0.0744,0.0638);
  popMatrix();
  pushMatrix();
  translate(0*assembled,(-1.243*assembled)+upPos,-0.050);
  fill(255,0,0);
  scale(2,2,2);
  box(0.1275,0.1806,0.0829);
  popMatrix();
  pushMatrix();
  translate(0*assembled,(-0.956*assembled)+upPos,-0.050);
  fill(0,0,255);
  scale(2,2,2);
  box(0.1275,0.1063,0.0829);
  popMatrix();
  pushMatrix();
  translate(-0.181*assembled,(-1.169*assembled)+upPos,-0.064);
  fill(255,0,0);
  scale(2,2,2);
  box(0.0425,0.1063,0.0425);
  popMatrix();
  pushMatrix();
  translate(0.181*assembled,(-1.169*assembled)+upPos,-0.064);
  fill(255,0,0);
  scale(2,2,2);
  box(0.0425,0.1063,0.0425);
  popMatrix();
  pushMatrix();
  translate(-0.191*assembled,(-0.956*assembled)+upPos,-0.064);
  fill(255,200,100);
  scale(2,2,2);
  box(0.0319,0.1063,0.0319);
  popMatrix();
  pushMatrix();
  translate(0.191*assembled,(-0.956*assembled)+upPos,-0.064);
  fill(255,200,100);
  scale(2,2,2);
  box(0.0319,0.1063,0.0319);
  popMatrix();
  pushMatrix();
  translate(-0.064*assembled,(-0.637*assembled)+upPos,-0.064);
  fill(0,0,255);
  scale(2,2,2);
  box(0.0531,0.2125,0.0531);
  popMatrix();
  pushMatrix();
  translate(0.064*assembled,(-0.637*assembled)+upPos,-0.064);
  fill(0,0,255);
  scale(2,2,2);
  box(0.0531,0.2125,0.0531);
  popMatrix();
  pushMatrix();
  translate(-0.064*assembled,(-0.234*assembled)+upPos,-0.064);
  fill(255,200,100);
  scale(2,2,2);
  box(0.0425,0.1913,0.0425);
  popMatrix();
  pushMatrix();
  translate(0.064*assembled,(-0.234*assembled)+upPos,-0.064);
  fill(255,200,100);
  scale(2,2,2);
  box(0.0425,0.1913,0.0425);
  popMatrix();
  pushMatrix();
  translate(-0.064*assembled,(-0.021*assembled)+upPos,0);
  fill(255,0,0);
  scale(2,2,2);
  box(0.0531,0.0531,0.1063);
  popMatrix();
  pushMatrix();
  translate(0.064*assembled,(-0.021*assembled)+upPos,0);
  fill(255,0,0);
  scale(2,2,2);
  box(0.0531,0.0531,0.1063);
  popMatrix();
  pushMatrix();
  translate(-0.191*assembled,(-0.744*assembled)+upPos,-0.064);
  fill(255,200,100);
  scale(0.0106,0.1063,0.0319);
  sphere(1);
  popMatrix();
  pushMatrix();
  translate(0.191*assembled,(-0.744*assembled)+upPos,-0.064);
  fill(255,200,100);
  scale(0.0106,0.1063,0.0319);
  sphere(1);
  popMatrix();
}

void draw()
{
  lights();
  background(0);
  xang=xang+xrot;
  if(xang>PI*2) xang=xang-PI*2;
  if(xang<0) xang=PI*2-xang;
  upPos=upPos-(upaccel/fps)+(gravity/fps);
  if(upPos>groundPos) upPos=groundPos;
  upaccel=upaccel-(gravity/fps);
  if(upaccel<0.1) upaccel=0;
  translate((width/2)+xoffset,height/2,yoffset);
  rotateY(xang);
  scale(zoom);
  puppet();
}


