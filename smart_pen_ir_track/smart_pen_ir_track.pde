// Example by Tom Igoe
// Modified for http://www.DFRobot.com by Lumi, Jan. 2014

/*
   This code should show one colored blob for each detected IR source (max four) at the relative position to the camera.
*/
import java.awt.AWTException;
import java.awt.Robot;
import processing.serial.*;

int lf = 10;    // Linefeed in ASCII
String myString = null;
Serial myPort;  // The serial port
Robot m;

void setup() {

    try
  {
    m = new Robot();
  }
  catch (AWTException e)
  {
    println("Robot class not supported by your system!");
    exit();
  }
  // List all the available serial ports
  println(Serial.list());
  // Open the port you are using at the rate you want:
  myPort = new Serial(this, Serial.list()[0], 19200);
  myPort.clear();
  // Throw out the first reading, in case we started reading 
  // in the middle of a string from the sender.
  myString = myPort.readStringUntil(lf);
  myString = null;
  size(800,800);
  //frameRate(30);
}

void draw() {
  
  background(77);
  //while (myPort.available() > 0) {
    myString = myPort.readStringUntil(lf);
    if (myString != null) {
      int[] output = int (split(myString, ','));

      println(myString); // display the incoming string
         
      int xx = output[0];
      int yy = output[1];
      
      int ww = output[2];
      int zz = output[3];
      
      int xxx = output[4];
      int yyy = output[5];
      
      int www = output[6];
      int zzz = output[7];
      
     // m.mouseMove(xx,yy);

      ellipseMode(RADIUS);  // Set ellipseMode to RADIUS
      fill(255, 0, 0);  // Set fill to white
      ellipse(xx, yy, 20, 20);
      ellipseMode(RADIUS);  // Set ellipseMode to RADIUS
      fill(0, 255, 0);  // Set fill to white
      ellipse(ww, zz, 20, 20);
      
      ellipseMode(RADIUS);  // Set ellipseMode to RADIUS
      fill(0, 0, 255);  // Set fill to white
      ellipse(xxx, yyy, 20, 20);
      ellipseMode(RADIUS);  // Set ellipseMode to RADIUS
      fill(255);  // Set fill to white
      ellipse(www, zzz, 20, 20);

    }
}
