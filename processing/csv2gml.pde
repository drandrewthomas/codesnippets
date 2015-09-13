/**********************************/
/* Conversion of CSV GPS data to  */
/* GML graffiti markup files.     */
/* Andrew Thomas, October 2010.   */
/**********************************/

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

PrintWriter output;
XMLElement graf;
String lines[];
String csvFile="test.csv";
String gmlFile;
int numLines;
float minLong=999999;
float maxLong=-999999;
float minLat=999999;
float maxLat=-999999;
float minTime=999999;
float maxTime=-999999;
float minAlt=999999;
float maxAlt=-999999;
float duration=10;  // Duration of playback in seconds

void preProcessLines()
{
  float[] p;
  numLines=0;
  lines=loadStrings(csvFile);
  for(int c=1;c<lines.length-1;c++)
  {
    if(match(lines[c],"END")!=null) break;
    if(match(lines[c],"PAUSE")==null)
    {
      numLines++;
      p=float(split(trim(lines[c]),","));
      if(p[0]<minTime) minTime=p[0];
      if(p[0]>maxTime) maxTime=p[0];
      if(p[1]<minLong) minLong=p[1];
      if(p[1]>maxLong) maxLong=p[1];
      if(p[2]<minLat) minLat=p[2];
      if(p[2]>maxLat) maxLat=p[2];
      if(p[3]<minAlt) minAlt=p[3];
      if(p[3]>maxAlt) maxAlt=p[3];
    }
  }
}

void convertCSV()
{
  int startLine=0;
  float t,lon,lat,alt;
  float[] p;
  output.println("<GML spec=\"0.1b\">");
  output.println("  <tag>");
  output.println("    <header>");
  output.println("      <client>");
  output.println("        <name>Name here</name>");
  output.println("        <version>Version here</version>");
  output.println("        <username>Username here</username>");
  output.println("        <keywords>Keywords, here</keywords>");
  output.println("        <uniqueKey>Unique here</uniqueKey>");
  output.println("      </client>");
  output.println("    </header>");
  output.println("    <drawing>");
  output.println("      <stroke>");
  lines=loadStrings(csvFile);
  for(int c=1;c<lines.length-1;c++)
  {
    print(".");
    if(match(lines[c],"END")!=null) break;
    if(match(lines[c],"PAUSE")!=null)
    {
      output.println("      </stroke>");
      output.println("      <stroke>");
    }
    else
    {
      p=float(split(trim(lines[c]),","));
      t=map(p[0],minTime,maxTime,0,duration);
      lon=map(p[1],minLong,maxLong,0,1);
      lat=map(p[2],minLat,maxLat,0,1);
      alt=map(p[3],minAlt,maxAlt,0,1);
      output.println("        <pt>");
      output.println("          <x>" + lon + "</x>");
      output.println("          <y>" + lat + "</y>");
      output.println("          <z>" + alt + "</z>");
      output.println("          <time>" + t + "</time>");
      output.println("        </pt>");
    }
  }
  output.println("      </stroke>");
  output.println("    </drawing>");
  output.println("  </tag>");
  output.println("</GML>");
}

void setup()
{
  size(512,200,P2D);
  gmlFile=csvFile+".gml";
  output=createWriter(gmlFile);
  print("Converting "+csvFile+" to "+gmlFile+" ");
  preProcessLines();
  convertCSV();
  println();
  println("Conversion finished!");
  output.flush();
  output.close();
  exit();
}

void draw()
{
}


