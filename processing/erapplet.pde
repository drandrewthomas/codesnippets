// Java Applet written in Processing
// Copyright Andrew Thomas, March 2010
// See www.geocomputing.co.uk for details
//
// You may use this applet freely if, wherever it is published,
// you provide a link to the geocomputing website and you use
// it at your own risk.
//
// Many thanks to Robert for showing that the most recent
// versions of processing require this first line:
import java.awt.*;

private Button calc_button;
private Label lab1,velocity;
private TextField Er_input;
private double c, Er, vel;

private double dec3Places(double val)
{
  val=val*1000;
  val=(int)val;
  val=val/1000;
  return val;
}

private void calcVals()
{
  double p=1,x=1,y=1,z=1;
  Er=getDouble(Er_input.getText());
  if(Er<1)
  {
    Er_input.setText("Error - Must be >= 1!");
    velocity.setText("Error!");
    return;
  }
  vel=(c/Math.sqrt(Er));
  if(vel>c) vel=c; // Remove rounding errors
  vel=vel/1000000; // x 10^-6
  vel=dec3Places(vel);
  velocity.setText(String.valueOf(vel));
}

private double getDouble(String text)
{
  double returnValue = -1;
  try
  {
    returnValue = Float.valueOf(text).floatValue();
  }
  catch (ArithmeticException e)
  {
    returnValue = -999;
  }
  catch (Exception e)
  {
    returnValue = -999;
  }
  return returnValue;
}

void setup()
{
  int a;
  size(350,100);
  background(255,255,255);
// If your labels have a grey background, try this line instead:
//  background(225,225,225);
  c=299700000;
  this.setLayout(new  GridLayout(3,1,10,5));
  lab1=new Label("Apparent permittivity (Er):");
  this.add(lab1);
  Er_input = new TextField("1");
  this.add(Er_input);
  lab1=new Label("Velocity (m/s x 10^6):");
  this.add(lab1);
  velocity = new Label("");
  this.add(velocity);
  lab1=new Label("Accuracy: 3 DP");
  this.add(lab1);
  calc_button=new Button("Recalculate");
  this.add(calc_button);
  calcVals();
}

public boolean action(Event event, Object arg)
{
  if(event.target==calc_button)
  {
    calcVals();
    return true;
  }
  else return super.action(event, arg);
}

