float radius=200;
float r=1;
int inc=5;
int getDigitAt(int x,int p){
  //p from right
  String s=str(x);
 
  char c=s.charAt(s.length()-p);
    
  return int(c)-48;
  
  
}
int getInterTwinOf(int x,int y){
  int lenX=getlength(x);
  int lenY=getlength(y);
if(lenY>lenX){
            int temp=x;
            x=y;
            y=temp;
        }
        int k=lenX*2-1;
        
        int newNumber=0;
        int p=lenX;
   
       
        while(k>=0 ){
          newNumber=newNumber+int(pow(10,k)*(getDigitAt(x,p)));
          k=k-1;
          if(p<=lenY)
            newNumber=newNumber+int(pow(10,k)*(getDigitAt(y,p)));
     
          k=k-1;
          p=p-1;
        
        }
        return newNumber;
 
}
int getlength(int number) {
    String s=str(number);
    
    return s.length();
}
void setup(){
  size(800,800);
  background(0);
}
void draw(){
  scale(1, -1);
  translate(width/2, -height/2);
  
 
  fill(255,0,0);
  stroke(255,0,0);
  line(-width/2, 0,width/2, 0);
   line(0,-height/2,0, height/2);
  
 int x,y;
 float z;


 //first quad
 for(x=0;x<radius;x=x+inc){
   for(y=0;y<radius;y=y+inc){
   z=sqrt(radius*radius-x*x-y*y);
  
   //float theta =map(getInterTwinOf(x,y),0,radius*radius,0,PI);
   float theta = getInterTwinOf(x,y);
   //println(theta);
   ellipse(z*cos(theta),z*sin(theta),2*r,2*r);
   
 
   }
 }
  
}
