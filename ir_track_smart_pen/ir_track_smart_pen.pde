// Example by Tom Igoe
// Modified for http://www.DFRobot.com by Lumi, Jan. CR14

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
int count=0;
int CR=50;

float theta;
float pX,pY;

int xx,yy;
int[] x = new int[4];
int[] y = new int[4];


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
  
  try{
  // List all the available serial ports
  //println(Serial.list());
  // Open the port you are using at the rate you want:
  myPort = new Serial(this, Serial.list()[0], 19200);
  myPort.clear();
  // Throw out the first reading, in case we started reading 
  // in the middle of a string from the sender.
  myString = myPort.readStringUntil(lf);
  myString = null;}
 
 catch(Exception e){
  println("sorry ! No Serial port available");
 exit();
 }
  
  
 fullScreen();
 


}

void draw() {

      myString = myPort.readStringUntil(lf);
    if (myString != null) {
                      int[] output = int (split(myString, ','));
                
                    //  println(myString); // display the incoming string
                         
                      xx = output[0];
                      yy = output[1];
                      
                      if(count<4){
                              background(77);
                              getCoordinates();
                      
                      }
                      else if(count==4){
                      background(77);
                      getCoordinates();
                      theta=atan((y[3]-y[0])/(x[3]-x[0]));
                      float mX=(y[3]-y[0])/(x[3]-x[0]);
                      float mY=(y[1]-y[0])/(x[1]-x[0]);
                        
                       pX=abs(y[0]-mX*x[0])/sqrt(mX*mX+1);
                       pY=abs(y[0]-mY*x[0])/sqrt(mY*mY+1);
                       
                       ++count;
                      
                                   
                      }
                      else{

                        
                       float xnew_=xx*cos(theta)-yy*sin(theta)-pX;
                       float ynew_=yy*cos(theta)+xx*sin(theta)+pY;
                        
                       int xnew=int((xnew_)*1920/800);
                       int ynew=int((ynew_)*1080/800);
                       
                       
                        
                        
                        if(xx!=1023 & yy!=1023)
                         {println(y[3]+" "+y[0]+" "+theta+" "+pX+" "+pY+" "+xnew+" "+ynew);
                          m.mouseMove(1920-xnew,ynew);}
                      }
                      

    }

  
 
}


void mousePressed(){
  if(xx!=1023 && yy!=1023){
      if(count<4 ){
        x[count]=xx;
        y[count]=yy;
        ++count; 
      }
  }
 
}




void getCoordinates(){
  
             
                           
                           if(count<1){
                                       
                                      ellipseMode(RADIUS);  // Set ellipseMode to RADIUS
                                      noFill();
                                      ellipse(0,0, CR, CR);
                                     }
                           else
                                   {
                                       ellipseMode(RADIUS);  // Set ellipseMode to RADIUS
                                       fill(255, 0, 0);  // Set fill to white
                                      ellipse(0,0, CR, CR);
                                      
                                     }
                           
                           if(count<2){
                             
                                    ellipseMode(RADIUS);  // Set ellipseMode to RADIUS
                                    noFill();
                                    ellipse(0, height, CR, CR);
                                   }
                           else{
                                     ellipseMode(RADIUS);  // Set ellipseMode to RADIUS
                                    fill(255, 0, 0);  // Set fill to white
                                    ellipse(0, height, CR, CR);
                                   }
                                 
                          if(count<3){
                                     
                                    ellipseMode(RADIUS);  // Set ellipseMode to RADIUS
                                    noFill();
                                    ellipse(width,height, CR, CR);
                                   }
                           else{
                                     ellipseMode(RADIUS);  // Set ellipseMode to RADIUS
                                    fill(255, 0, 0);  // Set fill to white
                                     ellipse(width,height, CR, CR);
                                   }
                          if(count<4){
                             
                                    ellipseMode(RADIUS);  // Set ellipseMode to RADIUS
                                    noFill();
                                    ellipse(width,0, CR, CR);
                                   }
                          else{
                                   ellipseMode(RADIUS);  // Set ellipseMode to RADIUS
                                  fill(255, 0, 0);  // Set fill to white
                                  ellipse(width,0, CR, CR);
                                 }
                                 
                                 
                        textSize(32);
                      text(char(48+count), 10, 30); 
             
           
                  
}
