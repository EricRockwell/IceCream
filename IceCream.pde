float meridian = -71.9f;//-96;
float lower = 40.90f;
float upper = 47.39f;
FloatTable data;
//what are these points for europe?
PImage map;
String name;
float minX, minY, maxX, maxY,tempx,tempy;

void setup() {
  //558/505
  
  size(610,739);
  map = loadImage("neoutline.gif");
  data = new FloatTable("data.tsv");
  textSize(30);
  textAlign(CENTER);
  
  minX = getX(47.398157, -73.736405);
  minY = getY(47.398157, -73.736405);
  maxX = getX(40.907015, -66.92637);
  maxY = getY(40.907015, -66.92637);
}


void draw() {
  
  image(map,0,0);
  overlay();
for(int i = 0 ; i<data.getRowCount() ; i++) {
  name = data.getRowName(i);
  tempx = data.getFloat(i,0);
  tempy = data.getFloat(i,1) ;
  float x = getX(tempx,tempy);
  float y = getY(tempx,tempy);
  noStroke();
  float realX = map(x,minX,maxX,0,width);
  float realY = map(y,minY,maxY,0,height);
  
  
    if(name.equals("Ben & Jerry's")) {
  fill(0,255,0,127);
    ellipse(realX,realY,15,15);
  }
  else if(name.equals("Coldstone")) {
  fill(0,0,255,127);
    ellipse(realX,realY,15,15);
  }
  else if(name.equals("Carvel's")) {
  fill(255,0,0,127);
    ellipse(realX,realY,15,15);
  }
  else if(name.equals("Friendly's")) {
  fill(255,140,0,127);
    ellipse(realX,realY,15,15);
  }

}


}


float getX(float lat, float lon) {
  float phi0 = 0;
  float lambda0 = radians(meridian);
  float phi1 = radians(lower);
  float phi2 = radians(upper);
  
  float phi = radians(lat);
  float lambda = radians(lon);
  
  float n = 0.5f * (sin(phi1) + sin(phi2));
  float theta = n * (lambda - lambda0);
  float c = sq(cos(phi1)) + 2*n*sin(phi1);
  float rho = sqrt(c - 2*n*sin(phi)) / n;
  float rho0 = sqrt(c - 2*n*sin(phi0)) / n;
  
  return rho * sin(theta);
  
}

float getY(float lat, float lon) {
  float phi0 = 0;
  float lambda0 = radians(meridian);
  float phi1 = radians(lower);
  float phi2 = radians(upper);
  
  float phi = radians(lat);
  float lambda = radians(lon);
  
  float n = 0.5f * (sin(phi1) + sin(phi2));
  float theta = n * (lambda - lambda0);
  float c = sq(cos(phi1)) + 2*n*sin(phi1);
  float rho = sqrt(c - 2*n*sin(phi)) / n;
  float rho0 = sqrt(c - 2*n*sin(phi0)) / n;
  
  return rho0 - rho*cos(theta);
  
}
void overlay() {
fill(92,105,255,245);
rect(0,0,width, 50);
fill(255);
textAlign(CENTER); 
textSize(25);
text("New England Ice Cream",width/2,35);
fill(0);
textAlign(LEFT); 

fill(0,255,0,127);
ellipse(50,100,20,20);
textSize(15);
text("Ben & Jerry's",70,105);

fill(0,0,255,127);
ellipse(50,130,20,20);
text("Coldstone",70,135);

fill(255,0,0,127);
ellipse(50,160,20,20);
text("Carvel's",70,165);

  fill(255,140,0,127);
ellipse(50,190,20,20);
text("Friendly's",70,195);



}
