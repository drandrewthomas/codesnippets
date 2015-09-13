%  Create a VRML sample world
%
%  VRML functions programmed by Andrew Thomas (2006-2010).
%
%  Sample world functions programmed by Andrew Thomas (2009-2010)
%  in collaboration with Andrew Foo and Alan Islas-Cital.



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  The vrdemo function (including functions b3 and b4) create a  %
%  complex 3D VRML world largely using simple 3D primitives and  %
%  extrusions. Use of a fog effect makes the scene appear to     %
%  have extra depth by reducing the visibility of objects when   %
%  viewed from a distance.                                       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function vrdemo()
  fp=vrml_newfile('vrdemo.wrl','Sample VRML World','Created April 2010');
  vrml_comment(fp,'General section');
  vrml_navinfo(fp,1);
  vrml_defview(fp,'Start','vpnt',0,0,1.7,0);
  vrml_earthsky(fp);
  vrml_fogout(fp,0.5,0.5,0.5,60);
  vrml_downlight(fp,0,0,50,1);  vrml_comment(fp,'Roads: level -0.1m');
  vrml_box(fp,0,-10,-0.1-0.25,100,10,0.5,0.2,0.2,0.2,0);
  vrml_box(fp,-40,-32.5,-0.1-0.25,10,35,0.5,0.2,0.2,0.2,0);
  vrml_box(fp,42.5,45,-0.1-0.25,5,10,0.5,0.2,0.2,0.2,0);
  vrml_box(fp,42.5,27.5,-0.1-0.25,15,25,0.5,0.2,0.2,0.2,0);
  vrml_comment(fp,'River: level -2.0m');
  vrml_box(fp,0,-32.5,-3,100,15,2,0.1,0.1,1.0,0.1);
  vrml_comment(fp,'River walls');
  vrml_box(fp,10,-25.25,-1.5,80,0.5,5,0.6,0.3,0.2,0.1);
  vrml_box(fp,10,-37.75,-2.5,80,0.5,5,0.6,0.3,0.2,0.1);
  vrml_comment(fp,'Paths: level 0.0m');
  vrml_box(fp,0,-2.5,-0.1,100,5,0.2,0.3,0.3,0.3,0);
  vrml_box(fp,-42.5,17.5,-0.1,5,35,0.2,0.3,0.3,0.3,0);
  vrml_box(fp,0,20,-0.1,30,10,0.2,0.3,0.3,0.3,0);
  vrml_box(fp,0,10,-0.1,10,10,0.2,0.3,0.3,0.3,0);
  vrml_box(fp,0,2.5,-0.1,20,5,0.2,0.3,0.3,0.3,0);
  vrml_box(fp,0,-22.5,-0.1,20,5,0.2,0.3,0.3,0.3,0);
  vrml_box(fp,10,-17.5,-0.1,80,5,0.2,0.3,0.3,0.3,0);
  vrml_box(fp,-47.5,-32.5,-0.1,5,35,0.2,0.3,0.3,0.3,0);
  vrml_box(fp,-32.5,-32.5,-0.1,5,35,0.2,0.3,0.3,0.3,0);
  vrml_box(fp,-2.5,-42.5,-0.1,55,5,0.2,0.3,0.3,0.3,0);
  vrml_box(fp,25,45,-0.1,10,10,0.2,0.3,0.3,0.3,0);
  vrml_box(fp,0,30,-0.1,10,10,0.2,0.3,0.3,0.3,0);
  vrml_comment(fp,'Grass: level 0.05m');
  vrml_box(fp,30,-22.5,0,40,5,0.1,0.0,0.9,0.1,0);
  vrml_box(fp,-20,-22.5,0,20,5,0.1,0.0,0.9,0.1,0);
  vrml_box(fp,-47.5,17.5,0,5,35,0.1,0.0,0.9,0.1,0);
  vrml_box(fp,-32.5,17.5,0,15,35,0.1,0.0,0.9,0.1,0);
  vrml_box(fp,-30,42.5,0,10,15,0.1,0.0,0.9,0.1,0);
  vrml_box(fp,-17.5,37.5,0,15,5,0.1,0.0,0.9,0.1,0);
  vrml_box(fp,5,42.5,0,30,15,0.1,0.0,0.9,0.1,0);
  vrml_box(fp,27.5,37.5,0,15,5,0.1,0.0,0.9,0.1,0);
  vrml_box(fp,35,45,0,10,10,0.1,0.0,0.9,0.1,0);
  vrml_box(fp,47.5,45,0,5,10,0.1,0.0,0.9,0.1,0);
  vrml_box(fp,30,25,0,10,20,0.1,0.0,0.9,0.1,0);
  vrml_box(fp,30,7.5,0,40,15,0.1,0.0,0.9,0.1,0);
  vrml_box(fp,-7.5,10,0,5,10,0.1,0.0,0.9,0.1,0);
  vrml_box(fp,7.5,10,0,5,10,0.1,0.0,0.9,0.1,0);
  vrml_box(fp,-17.5,7.5,0,15,15,0.1,0.0,0.9,0.1,0);
  vrml_comment(fp,'Pyramids');
  vrml_box(fp,-17.5,7.5,-0.1,5,5,0.5,0.8,0.9,0.8,0);
  vrml_box(fp,17.5,7.5,-0.1,5,5,0.5,0.8,0.9,0.8,0);
  pyramid(fp,17.5,7.5,5,5,0.9,0.2,0.2,0.4);
  vrml_sphere(fp,17.5,7.5,1,2,2,2,0,1,0,0.4);
  vrml_sphere(fp,17.5,7.5,2.5,1,1,1,0,1,0,0.4);
  pyramid(fp,-17.5,7.5,5,5,0.9,0.2,0.2,0.4);
  vrml_sphere(fp,-17.5,7.5,1,2,2,2,0,1,0,0.4);
  vrml_sphere(fp,-17.5,7.5,2.5,1,1,1,0,1,0,0.4);
  vrml_comment(fp,'Simple buildings');
  % Pyramid building
  pyramid(fp,-42.5,42.5,15,35,0.5,0.5,0.6,0);
  vrml_box(fp,-42.5,42.5,-0.5,15,15,1,0.5,0.5,0.5,0);
  vrml_sphere(fp,-42.5,42.5,20,20,20,5,0,0,1,0.5);
  vrml_sphere(fp,-42.5,42.5,20,18,18,4,1,0,0,0);
  vrml_comment(fp,'Tall pyramid building piles');
  % Building 1
  vrml_box(fp,-17.5,45,15,15,10,30,0.1,0.1,0.8,0.4);
  vrml_box(fp,-17.5,45,12.5,10,6,25,0.7,0.7,0.7,0);
  vrml_box(fp,-17.5,45,5,15,10,0.8,0.7,0.7,0.7,0);
  vrml_box(fp,-17.5,45,10,15,10,0.8,0.7,0.7,0.7,0);
  vrml_box(fp,-17.5,45,15,15,10,0.8,0.7,0.7,0.7,0);
  vrml_box(fp,-17.5,45,20,15,10,0.8,0.7,0.7,0.7,0);
  vrml_box(fp,-17.5,45,25,15,10,0.8,0.7,0.7,0.7,0);
  vrml_box(fp,-17.5,45,30,15,10,0.8,0.7,0.7,0.7,0);
  % Building 2
  vrml_box(fp,25,45,10,7,7,20,0.1,0.1,0.9,0.4);
  vrml_box(fp,21.5,41.5,10,2,2,20,0.7,0.7,0.7,0);
  vrml_box(fp,28.5,41.5,10,2,2,20,0.7,0.7,0.7,0);
  vrml_box(fp,21.5,48.5,10,2,2,20,0.7,0.7,0.7,0);
  vrml_box(fp,28.5,48.5,10,2,2,20,0.7,0.7,0.7,0);
  vrml_box(fp,25,45,4,9,9,0.8,0.7,0.7,0.7,0);
  vrml_box(fp,25,45,8,9,9,0.8,0.7,0.7,0.7,0);
  vrml_box(fp,25,45,12,9,9,0.8,0.7,0.7,0.7,0);
  vrml_box(fp,25,45,16,9,9,0.8,0.7,0.7,0.7,0);
  vrml_box(fp,25,45,20,9,9,0.8,0.7,0.7,0.7,0);
  % Building 3  - canopy
  vrml_box(fp,0,30,5.5,12,10,0.5,0.7,0.7,0.7,0);
  vrml_box(fp,0,30,8,12,10,0.5,0.7,0.7,0.7,0);
  vrml_box(fp,0,30,6.75,12,10,2.5,0.1,0.1,0.9,0.4);
  % Building 3
  b3(fp,-20,20);
  b3(fp,20,20);
  b3(fp,-20,30);
  b3(fp,20,30);
  b3(fp,-10,30);
  b3(fp,10,30);
  % Buildings across river
  b4(fp,-5,-50);
  b4(fp,30,-45);
  b3(fp,20,-47.5);
  vrml_box(fp,-20,-47.5,6,20,5,12,0.2,0.6,0.6,0);
  vrml_box(fp,7.5,-47.5,8,15,5,16,0.2,0.6,0.6,0);
  vrml_box(fp,42.5,-45,10,15,10,30,0.2,0.6,0.6,0);
  vrml_comment(fp,'Lamp posts');
  vrml_lamppost(fp,-5,5,5);
  vrml_lamppost(fp,5,5,5);
  vrml_lamppost(fp,-5,15,5);
  vrml_lamppost(fp,5,15,5);
  vrml_lamppost(fp,-10,20,5);
  vrml_lamppost(fp,10,20,5);
  vrml_lamppost(fp,0,-4.5,10);
  vrml_lamppost(fp,15,-4.5,10);
  vrml_lamppost(fp,30,-4.5,10);
  vrml_lamppost(fp,45,-4.5,10);
  vrml_lamppost(fp,-15,-4.5,10);
  vrml_lamppost(fp,-30,-4.5,10);
  vrml_lamppost(fp,-45,-4.5,10);
  vrml_lamppost(fp,0,-15.5,10);
  vrml_lamppost(fp,15,-15.5,10);
  vrml_lamppost(fp,30,-15.5,10);
  vrml_lamppost(fp,45,-15.5,10);
  vrml_lamppost(fp,-15,-15.5,10);
  vrml_lamppost(fp,-30,-15.5,10);
  vrml_lamppost(fp,35,35,10);
  vrml_lamppost(fp,35,27.5,10);
  vrml_lamppost(fp,35,20,10);
  vrml_comment(fp,'Trees');
  tree(fp,-7.5,10.25,5);
  tree(fp,7.5,10.25,5);
  tree(fp,-12.5,-22.5,3);
  tree(fp,12.5,-22.5,3);
  tree(fp,-5,45,4);
  tree(fp,5,45,3);
  tree(fp,0,45,6);
  tree(fp,30,10,6);
  tree(fp,30,25,4);
  tree(fp,-20,-22.5,5);
  tree(fp,25,-22.5,6);
  tree(fp,40,-22.5,8);
  tree(fp,35,10,8);
  tree(fp,35,20,8);
  tree(fp,35,30,8);
  tree(fp,-22.5,7.5,8);
  tree(fp,22.5,7.5,8);
  tree(fp,10,-42.5,8);
  vrml_closefile(fp);

function b3(fp,x,y)
  vrml_box(fp,x,y,4,7,7,8,0.1,0.1,0.9,0.4);
  vrml_box(fp,x+3.5,y-3.5,4,1,1,8,0.7,0.7,0.7,0);
  vrml_box(fp,x-3.5,y+3.5,4,1,1,8,0.7,0.7,0.7,0);
  vrml_box(fp,x+3.5,y+3.5,4,1,1,8,0.7,0.7,0.7,0);
  vrml_box(fp,x-3.5,y-3.5,4,1,1,8,0.7,0.7,0.7,0);
  vrml_box(fp,x,y,3,8,8,0.8,0.7,0.7,0.7,0);
  vrml_box(fp,x,y,5.5,8,8,0.8,0.7,0.7,0.7,0);
  vrml_box(fp,x,y,8,8,8,0.8,0.7,0.7,0.7,0);
  vrml_box(fp,x,y,-0.1,10,10,0.2,0.3,0.3,0.3,0);

function b4(fp,x,y)
  vrml_box(fp,x,y,4,7,7,8,0.1,0.1,0.9,0.4);
  vrml_box(fp,x+3.5,y-3.5,4,2,2,8,0.7,0.7,0.7,0);
  vrml_box(fp,x-3.5,y+3.5,4,2,2,8,0.7,0.7,0.7,0);
  vrml_box(fp,x+3.5,y+3.5,4,2,2,8,0.7,0.7,0.7,0);
  vrml_box(fp,x-3.5,y-3.5,4,2,2,8,0.7,0.7,0.7,0);
  vrml_box(fp,x,y,4,9,9,0.8,0.7,0.7,0.7,0);
  vrml_box(fp,x,y,8,9,9,0.8,0.7,0.7,0.7,0);
  vrml_box(fp,x,y,-0.1,10,10,0.2,0.3,0.3,0.3,0);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  The VRML Library Functions                                  %
%                                                              %
%  The following functions are part of a simple VRML library   %
%  designed for creating static worlds with elements that can  %
%  be animated and controlled by external programs.            %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function vrml_comment(fp,comment)
  fprintf(fp,'# %s\n\n',comment);

function r=vrml_newfile(filename,title,info)
  r=fopen(filename,'wt');
  fprintf(r,'#VRML V2.0 utf8\n\n');
  fprintf(r,'WorldInfo {\n');
  fprintf(r,'  title "%s"\n',title);
  fprintf(r,'  info ["%s"]\n',info);
  fprintf(r,'}\n\n');

function vrml_closefile(fp)
  fclose(fp);

function vrml_navinfo(fp,hl)
  fprintf(fp,'NavigationInfo {\n');
  if hl==0
    fprintf(fp,'  headlight FALSE\n');
  else
    fprintf(fp,'  headlight TRUE\n');
  end
  fprintf(fp,'}\n\n');

function tree(fp,x,y,h)
  vrml_pipeout(fp,0.2,0.05,8,0.9,0.5,0.5,[x,y,0;x,y,h*0.7]);
  vrml_sphere(fp,x,y,h*0.75,h/3,h/3,h/2,0.1,1,0.2,0);
function vrml_box(fp,x,y,z,wid,len,dep,R,G,B,T)
  fprintf(fp,'Transform {\n');
  fprintf(fp,'  scale %f %f %f\n',wid/2,dep/2,len/2);
  fprintf(fp,'  translation  %.3f %.3f %.3f\n',x,z,y);
  fprintf(fp,'  children [\n');
  fprintf(fp,'    Shape {\n');
  fprintf(fp,'      appearance Appearance {\n');
  fprintf(fp,'        material Material {\n');
  fprintf(fp,'          diffuseColor %.2f %.2f %.2f\n',R,G,B);
  fprintf(fp,'          transparency %.2f\n',T);
  fprintf(fp,'        }\n');
  fprintf(fp,'      }\n');
  fprintf(fp,'      geometry Box {\n');
  fprintf(fp,'      }\n');
  fprintf(fp,'    }\n');
  fprintf(fp,'  ]\n');
  fprintf(fp,'}\n\n');

function vrml_sphere(fp,x,y,z,wid,len,dep,R,G,B,T)
  fprintf(fp,'Transform {\n');
  fprintf(fp,'  scale %f %f %f\n',wid/2,dep/2,len/2);
  fprintf(fp,'  translation  %.3f %.3f %.3f\n',x,z,y);
  fprintf(fp,'  children [\n');
  fprintf(fp,'    Shape {\n');
  fprintf(fp,'      appearance Appearance {\n');
  fprintf(fp,'        material Material {\n');
  fprintf(fp,'          diffuseColor %.2f %.2f %.2f\n',R,G,B);
  fprintf(fp,'          transparency %.2f\n',T);
  fprintf(fp,'        }\n');
  fprintf(fp,'      }\n');
  fprintf(fp,'      geometry Sphere {\n');
  fprintf(fp,'      }\n');
  fprintf(fp,'    }\n');
  fprintf(fp,'  ]\n');
  fprintf(fp,'}\n\n');

function pyramid(fp,x,y,w,h,r,g,b,t)
  V=[1,2,3;1,3,4;1,4,5;1,5,2];
  P=[x,y,h;x-(0.5*w),y-(0.5*w),0;x+(0.5*w),y-(0.5*w),0;x+(0.5*w),y+(0.5*w),0;x-(0.5*w),y+(0.5*w),0;];
  vrml_triface(fp,P,V,r,g,b,t);
  V=[1,3,2;1,4,3;1,5,4;1,2,5];
  vrml_triface(fp,P,V,r,g,b,t);
function vrml_pipeout(fp,D,W,N,R,G,B,P)
  fprintf(fp,'Shape {\n');
  fprintf(fp,'  appearance Appearance {\n');
  fprintf(fp,'    material Material {\n');
  fprintf(fp,'      diffuseColor %.2f %.2f %.2f\n',R,G,B);
  fprintf(fp,'      transparency 0\n');
  fprintf(fp,'    }\n');
  fprintf(fp,'  }\n');
  fprintf(fp,'  geometry Extrusion {\n');
  fprintf(fp,'    crossSection [\n');
  r1=D/2;
  r2=r1-W;
  a=0:(2*pi())/N:2*pi();
  x1=r1*sin(a);
  y1=r1*cos(a);
  x2=r2*sin(a);
  y2=r2*cos(a);
  s=size(a);
  x1=floor(x1*1000)/1000;
  y1=floor(y1*1000)/1000;
  x2=floor(x2*1000)/1000;
  y2=floor(y2*1000)/1000;
  for c=1:1:s(2)
    fprintf(fp,'      %.3f %.3f\n',x1(c),y1(c));
  end
  for c=s(2):-1:1
    fprintf(fp,'      %.3f %.3f\n',x2(c),y2(c));
  end
  fprintf(fp,'      %.3f %.3f\n',0,r1);
  fprintf(fp,'    ]\n');
  fprintf(fp,'    spine [\n');
  % Y & Z swapped to account for VRML axis Y up
  s=size(P);
  for c=1:1:s(1)
    fprintf(fp,'      %f %f %f\n',P(c,1),P(c,3),P(c,2));
  end
  fprintf(fp,'    ]\n');
  fprintf(fp,'  }\n');
  fprintf(fp,'}\n');

function vrml_triface(fp,P,V,R,G,B,T)
  fprintf(fp,'Shape {\n');
  fprintf(fp,'  appearance Appearance {\n');
  fprintf(fp,'    material Material {\n');
  fprintf(fp,'      diffuseColor %.2f %.2f %.2f\n',R,G,B);
  fprintf(fp,'      transparency %.2f\n',T);
  fprintf(fp,'    }\n');
  fprintf(fp,'  }\n');
  fprintf(fp,'  geometry IndexedFaceSet {\n');
  fprintf(fp,'    solid TRUE\n');
  fprintf(fp,'    coord Coordinate {\n');
  fprintf(fp,'      point [\n'); % 3D vertices
  for c=1:1:length(P)
    % Y & Z swapped to account for VRML axis Y up
    fprintf(fp,'        %.3f %.3f %.3f\n',P(c,1),P(c,3),P(c,2));
  end
  fprintf(fp,'      ]\n');
  fprintf(fp,'    }\n');
  fprintf(fp,'    coordIndex [\n'); % vertices to join
  s=size(P);
  for c=1:1:length(V)-1
    fprintf(fp,'      %d %d %d -1\n',V(c,1)-1,V(c,2)-1,V(c,3)-1);
  end
  fprintf(fp,'      %d %d %d\n',V(c+1,1)-1,V(c+1,2)-1,V(c+1,3)-1);
  fprintf(fp,'    ]\n');
  fprintf(fp,'  }\n');
  fprintf(fp,'}\n\n');

function vrml_earthsky(fp)
  fprintf(fp,'Background {\n');
  fprintf(fp,'  skyColor [0 0 0.3 , 0 0.73 0.67]\n');
  fprintf(fp,'  skyAngle 1.571\n');
  fprintf(fp,'  groundColor [0.7 0.2 0.2 , 0.75 0.6 0]\n');
  fprintf(fp,'  groundAngle 1.571\n');
  fprintf(fp,'}\n\n');

function vrml_fogout(fp,r,g,b,v)
  fprintf(fp,'Fog {\n');
  fprintf(fp,'  color %.2f %.2f %.2f\n',r,g,b);
  fprintf(fp,'  visibilityRange %.2f\n',v);
  fprintf(fp,'}\n\n');

function vrml_lamppost(fp,x,y,h)
  fprintf(fp,'Transform {\n');
  fprintf(fp,'  scale 0.1 %.3f 0.1\n',h/2);
  fprintf(fp,'  translation  %.3f %.3f %.3f\n',x,h/2,y);
  fprintf(fp,'  children [\n');
  fprintf(fp,'    Shape {\n');
  fprintf(fp,'      appearance Appearance {\n');
  fprintf(fp,'        material Material {\n');
  fprintf(fp,'          diffuseColor 0.3 0.3 0.3\n');
  fprintf(fp,'          transparency 0\n');
  fprintf(fp,'        }\n');
  fprintf(fp,'      }\n');
  fprintf(fp,'      geometry Cylinder {\n');
  fprintf(fp,'      }\n');
  fprintf(fp,'    }\n');
  fprintf(fp,'  ]\n');
  fprintf(fp,'}\n\n');
  fprintf(fp,'Transform {\n');
  fprintf(fp,'  scale 0.2 0.5 0.2\n');
  fprintf(fp,'  translation  %.3f %.3f %.3f\n',x,-0.5,y);
  fprintf(fp,'  children [\n');
  fprintf(fp,'    Shape {\n');
  fprintf(fp,'      appearance Appearance {\n');
  fprintf(fp,'        material Material {\n');
  fprintf(fp,'          diffuseColor 0.2 0.2 0.2\n');
  fprintf(fp,'          transparency 0\n');
  fprintf(fp,'        }\n');
  fprintf(fp,'      }\n');
  fprintf(fp,'      geometry Cylinder {\n');
  fprintf(fp,'      }\n');
  fprintf(fp,'    }\n');
  fprintf(fp,'  ]\n');
  fprintf(fp,'}\n\n');
  fprintf(fp,'Transform {\n');
  fprintf(fp,'  scale 0.3 0.2 0.3\n');
  fprintf(fp,'  translation  %.3f %.3f %.3f\n',x,h+0.2,y);
  fprintf(fp,'  children [\n');
  fprintf(fp,'    Shape {\n');
  fprintf(fp,'      appearance Appearance {\n');
  fprintf(fp,'        material Material {\n');
  fprintf(fp,'          diffuseColor 1 1 1\n');
  fprintf(fp,'          transparency 0.1\n');
  fprintf(fp,'        }\n');
  fprintf(fp,'      }\n');
  fprintf(fp,'      geometry Sphere {\n');
  fprintf(fp,'      }\n');
  fprintf(fp,'    }\n');
  fprintf(fp,'  ]\n');
  fprintf(fp,'}\n\n');
  fprintf(fp,'SpotLight {\n');
  fprintf(fp,'  location %.3f %.3f %.3f\n',x,h+0.2,y);
  fprintf(fp,'  direction 0 -1.57 0\n');
  fprintf(fp,'  beamWidth 0.01\n');
  fprintf(fp,'  cutOffAngle 1.5708\n');
  fprintf(fp,'  intensity 0.0\n');
  fprintf(fp,'}\n\n');

function vrml_view(fp,name,x,y,z,planangle)
  fprintf(fp,'Viewpoint {\n');
  fprintf(fp,'  position %f,%f,%f\n',x,z,y);
  fprintf(fp,'  orientation 0 1 0 %f\n',planangle); % angle in radians
  fprintf(fp,'  description "%s"\n',name);
  fprintf(fp,'  fieldOfView 0.785398\n'); % in radians
  fprintf(fp,'}\n\n');

function vrml_defview(fp,name,def,x,y,z,planangle)
  fprintf(fp,'DEF %s Viewpoint {\n',def);
  fprintf(fp,'  position %f,%f,%f\n',x,z,y);
  fprintf(fp,'  orientation 0 1 0 %f\n',planangle); % angle in radians
  fprintf(fp,'  description "%s"\n',name);
  fprintf(fp,'  fieldOfView 0.785398\n'); % in radians
  fprintf(fp,'}\n\n');

function vrml_spotlight(fp,lx,ly,lz,dx,dy,dz,i,bw,defn)
  if length(defn)==0
    fprintf(fp,'SpotLight {\n');
  else
    fprintf(fp,'DEF %s SpotLight {\n',defn);
  end
  fprintf(fp,'  location %.3f %.3f %.3f\n',lx,lz,ly);
  fprintf(fp,'  direction %.3f %.3f %.3f\n',dx,dz,dy);
  fprintf(fp,'  beamWidth %.3f\n',bw);
  fprintf(fp,'  cutOffAngle %.3f\n',bw*0.7);
  fprintf(fp,'  intensity %.3f\n',i);
  fprintf(fp,'  on TRUE\n');
  fprintf(fp,'}\n\n');

function vrml_downlight(fp,x,y,z,i)
  vrml_spotlight(fp,x,y,z,0,0,-1,i,1.5,'')

