/**
 *
 * @title of a work   :
 * @author            : 撫なずな titter --> @nade_nazuna (https://twitter.com/nade_nazuna), insta --> nade_nazuna
 * @date              :
 *
 **/
/*This template was created in 20220816.*/
import java.util.Calendar;
float x=0,
  y=1,
  z=0,
  a=10,
  b=28,
  c=8/3,
  dt=0.002,
  r=1  ;
float _x, _y, _z, _a, _b, _c, _dt, _r;

float n=15;
float i=0;

void setup() {
  size(1800, 1200, P3D);
  colorMode(HSB, 360, 100, 100);
  _x=x;
  _y=y;
  _z=z;
  _a=a;
  _b=b;
  _c=c;
  _dt=dt;
  _r=r;

  stroke(255);
  background(0);
}

void draw() {

  translate(width / 2, height / 2, -50);
  for (int j=0; j<10; j++) {
    drawLorenzAttractor();
    stroke(100, 100*sin(i*0.01+PI/2), 100);
    i+=0.5;
  }
  //saveFrame("frames/####.tif");
}

void drawLorenzAttractor() {
  float dx = _a * (_y - _x);
  float dy = _x * (_b - _z) - _y;
  float dz = _x * _y - _c * _z;
  _x += dx * _dt;
  _y += dy * _dt;
  _z += dz * _dt;
  pushMatrix();
  translate(n*_x, n*_y, n*_z);
  sphere(_r);
  popMatrix();
}

void savePng() {
  saveFrame(timestamp()+".png");
}

String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty_%1$tm_%1$td_%1$tH_%1$tM_%1$tS", now);
}

void keyPressed() {
  if (keyCode==CONTROL) {
    savePng();
  }
}

//void resetLorenz() {
//  _x=x;
//  _y=y;
//  _z=z;
//  _a=a;
//  _b=b;
//  _c=c;
//  _dt=dt;
//  _r=r;
//  background(0);
//}

//void setLorenz(){
//    _x=x;
//  _y=y;
//  _dt=dt;
//  background(0);
//}

//void keyPressed(){
//  if(keyCode==UP){_c+=0.1;}
//  if(keyCode==DOWN){_c-=0.1;}
//  if(key=='r'){resetLorenz();}

//}
