PImage cog, p, fizz, topcog, smile, dogleft, dogright;  // Image file variables
float cogrot=0;       // The rotation angle of the cogs
float cogscale=0;     // The size of the bottom cog
float topcogscale=0;  // The size of the top cog
float smilescale=0;   // The size of the smily face
float dogpos=50;      // The horizontal position of the dog
float dogdir=1;       // The direction of the dog (1=right, -1=left)
float rotspeed=50;    // A variable to allow adjustment of the cog rotation speed
int fizztrans=0;      // The transparency for the 'fizz' word

void keyPressed()  // Function to handle keyboard events
{
  if(key == 'f')  // Save an image file of the program window
  {
    saveFrame("fizzpop-####.jpg");
  }
  if(key == 'r')  // Reset global variables to restart the animation
  {
    fizztrans=0;
    cogscale=0;
    topcogscale=0;
    smilescale=0;
  }
  if(keyCode == UP)  // Increase the cog rotation speed
  {
    rotspeed-=1;
    if(rotspeed<10) rotspeed=10;
  }
  if(keyCode == DOWN)  // Decrease the cog rotation speed
  {
    rotspeed+=1;
    if(rotspeed>100) rotspeed=100;
  }
  if(keyCode == LEFT)  // Force the dog to move leftwards
  {
    dogdir=-1;
  }
  if(keyCode == RIGHT)  // Force the dog to move rightwards
  {
    dogdir=1;
  }
}

void setup()  // Runs once at start only - initialisation is done here
{
  size(600,373);                       // The window size
  frameRate(20);                       // Controls how fast the animation changes
  // The code below loads the image files so that we can draw them on the main
  // window. They are GIF files for a reason: it is easy to add transparency to
  // the images rather than trying to control it in our code.
  cog=loadImage("cog.gif");            // Load the bottom cog image file
  topcog=loadImage("topcog.gif");      // Load the top cog image file
  p=loadImage("p.gif");                // Load the letter P image files
  fizz=loadImage("fizz.gif");          // Load the 'fizz' image file
  smile=loadImage("smile.gif");        // Load the smily face image file
  dogleft=loadImage("dogleft.gif");    // Load the dog left image file
  dogright=loadImage("dogright.gif");  // Load the dog right image file
}

void draw()
{
  background(168,28,35);  // Set the background colour
  imageMode(CORNER);      // Draw top/left corner at the coordinates we specify
  tint(255,fizztrans);    // Set the image transparency for 'fizz'
  image(fizz,30,25);      // Draw the 'fizz' image
  noTint();               // No transparency for the rest of the images
  if(fizztrans>250)       // Once 'fizz' is opaque we can draw other things too
  {
    imageMode(CENTER);    // Use the centre of the images for positioning which helps as we
                          // will be rotating around the cog centre
    pushMatrix();         // This allows us to play with a single object without affecting
                          // all of the other objects we are drawing
    translate(370,245);   // The position of the centre of the bottom cog
    scale(cogscale);      // The size of the bottom cog
    rotate(cogrot);       // The bottom cog rotation angle
    image(cog,0,0);       // Draw the bottom cog
    popMatrix();          // Remove the rotation, scale and position ready for the next image
    if(cogscale>=1)       // Once the bottom cog is big enough, other images can be added
    {
      image(p,225,260);   // Now we add the left 'P'
      image(p,510,225);   // Now we add the right 'P'
      if(dogdir==1)       // Is the dog moving rightwards?
      {
        image(dogright,dogpos,340);  // If so, draw the dogright image
        dogpos+=10;                  // Move the dog position to the right
        if(dogpos>=550) dogdir=-1;   // If it goes too far, turn it to face left
      }
      else                // Or, is it going leftwards?
      {
        image(dogleft,dogpos,340);   // If so, draw the dogleft image
        dogpos-=10;                  // Move the dog position to the left
        if(dogpos<=50) dogdir=1;     // If it goes too far, turn it to the right
      }
    }
    if(cogscale<1) cogscale+=0.01;   // If the cog isn't full size, let it grow
    else                             // Otherwise, start drawing the top cog
    {
      imageMode(CENTER);             // Coordinates at centre again to help rotation
      pushMatrix();                  // Again, so we can play with just one object
      translate(370-5,255-155);      // The centre of the top cog
      scale(topcogscale);            // The top cog scale
      rotate(-1*cogrot);             // The top cog rotation angle
      image(topcog,0,0);             // Draw the top cog
      popMatrix();                   // Remove the rotation, scale and position ready for the next image
      if(topcogscale<1) topcogscale+=0.01;  // If the top cog isn't full size, let it grow
    }
  }
  if(topcogscale>=1)  // If the top cog is fully grown, we can start drawing the smily face
  {
      imageMode(CENTER);           // Use the face centre for positioning, which helps keep it in one place while scaling
      pushMatrix();                // The smily face code is the same as for the cogs
      translate(370+150,255-175);
      scale(smilescale);
      image(smile,0,0);
      popMatrix();
      if(smilescale<1) smilescale+=0.01;    
  }
  stroke(255,255,255);             // Set the colour for drawing lines (white here)
  noFill();                        // Don't fill the inside of shapes like rectangles
  rect(10,10,width-20,height-20);  // Draw a boder rectangle
  rect(5,5,width-10,height-10);    // Draw another rectangle
  cogrot+=PI/rotspeed;             // Calculate how much the cogs need rotating by across frames
  if(cogrot>2*PI) cogrot-=2*PI;    // This is just to stop silly big numbers accumulating
  if(fizztrans<255) fizztrans+=5;  // If the 'fizz' image isn't opaque, make it more opaque
}


