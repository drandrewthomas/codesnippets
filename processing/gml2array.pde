/************************************/
/* Conversion of Graffiti GML files */
/* to arrays for use on mobile web  */
/* pages with processing.js and     */
/* HTML5 canvases.                  */
/* Andrew Thomas, October 2010.     */
/************************************/

/*************************************************/
/* This program is free software: you can        */
/* redistribute it and/or modify it under the    */
/* terms of the GNU General Public License       */
/* as published by the Free Software Foundation, */
/* either version 3 of the License, or (at your  */
/* option) any later version.                    */
/*                                               */
/* This program is distributed in the hope that  */
/* it will be useful, but WITHOUT ANY            */
/* WARRANTY; without even the implied            */
/* warranty of MERCHANTABILITY or FITNESS        */
/* FOR A PARTICULAR PURPOSE.  See the            */
/* GNU General Public License for more details.  */
/*                                               */
/* See http://www.gnu.org/licenses/ for full     */
/* details of licenses.                          */
/*************************************************/

Boolean started=false;
int gmllength;
int numpoints=0;
String gmlfile;
String lines[];
float xmin=999999;
float ymin=999999;
float xmax=-999999;
float ymax=-999999;
float[] x=new float[10000];
float[] y=new float[10000];
float[] z=new float[10000];
float[] t=new float[10000];

void arrayfile()
{
  int index;
  String[] p;
  gmlfile = selectInput();
  if (gmlfile != null)
  {
    lines=loadStrings(gmlfile);
    gmllength=lines.length;
    for(index=0;index<gmllength;index++)
    {
      if(started==true)
      {
        if(match(trim(lines[index].toLowerCase()),"</stroke>")!=null)
        {
          if(numpoints>0)
          {
            x[numpoints]=999999;
            y[numpoints]=999999;
            z[numpoints]=999999;
            t[numpoints]=999999;
            numpoints++;
          }
        }
        if(match(trim(lines[index].toLowerCase()),"<x>")!=null)
        {
          p=splitTokens(trim(lines[index]),"<>");
          x[numpoints]=float(p[1]);
        }
        if(match(trim(lines[index].toLowerCase()),"<y>")!=null)
        {
          p=splitTokens(trim(lines[index]),"<>");
          y[numpoints]=float(p[1]);
        }
        if(match(trim(lines[index].toLowerCase()),"<z>")!=null)
        {
          p=splitTokens(trim(lines[index]),"<>");
          z[numpoints]=float(p[1]);
        }
        if(match(trim(lines[index].toLowerCase()),"<time>")!=null)
        {
          p=splitTokens(trim(lines[index]),"<>");
          t[numpoints]=float(p[1]);
          numpoints++;
        }
      }
      else
      {
        if(match(trim(lines[index].toLowerCase()),"<stroke>")!=null)
          started=true;
      }
    }
    while(x[numpoints-1]==999999 && numpoints>0) numpoints--;
    for(index=0;index<numpoints;index++)
    {
      if(x[index]!=999999)
      {
        if(x[index]<xmin) xmin=x[index];
        if(y[index]<ymin) ymin=y[index];
        if(x[index]>xmax) xmax=x[index];
        if(y[index]>ymax) ymax=y[index];
      }
    }
    for(index=0;index<numpoints;index++)
    {
      if(x[index]!=999999)
      {
        x[index]=map(x[index],xmin,xmax,0,0.9)+0.05;
        y[index]=map(y[index],ymin,ymax,0,0.9)+0.05;
      }
    }
    print("float x[]={");
    for(index=0;index<numpoints-1;index++)
    {
      print(x[index]+",");
    }
    println(x[index+1]+"};");
    print("float y[]={");
    for(index=0;index<numpoints-1;index++)
    {
      print(y[index]+",");
    }
    println(y[index+1]+"};");
    print("float z[]={");
    for(index=0;index<numpoints-1;index++)
    {
      print(z[index]+",");
    }
    println(z[index+1]+"};");
    print("float t[]={");
    for(index=0;index<numpoints-1;index++)
    {
      print(t[index]+",");
    }
    println(t[index+1]+"};");
  }
}

void setup()
{
  size(512,200,P2D);
  arrayfile();
  exit();
}

void draw()
{
}


