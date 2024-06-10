import peasy.*;

//SHF - 11/10/23
//Creative Coding CRCP6310
//For Modules 10 - 12 
//this covers OOP & P3D
//following the tutorial; Coding Train: Solar System
//textures: https://planetpixelemporium.com/

Planet sun; 

PeasyCam cam;

PImage sunTexture;
PImage[] textures = new PImage[9];
PImage bg;


void setup (){
  size(800,800,P3D);
  bg = loadImage("orionnebula.jpg");

  sunTexture = loadImage("sun.jpg");
  textures[0] = loadImage("mercury.jpg");
  textures[1] = loadImage("venus.jpg");
  textures[2] = loadImage("earth.jpg");
  textures[3] = loadImage("mars.jpg");
  textures[4] = loadImage("jupiter.jpg");
  textures[5] = loadImage("venus.jpg");
  textures[6] = loadImage("saturn.jpg");
  textures[7] = loadImage("uranus.jpg");
  textures[8] = loadImage("neptune.jpg");

  cam = new PeasyCam(this, 500);
  sun = new Planet(50, 0, 0, sunTexture);
  sun.spawnMoons(9, 1);
}

void draw(){
 background(0);
 lights();
 
 sun.show();
 sun.orbit();
}
