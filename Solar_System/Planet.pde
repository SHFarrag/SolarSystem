class Planet{
  float radius; 
  float distance;
  Planet[] planets;
  float angle;
  float orbitSpeed;
  PVector v;
  
  PShape globe;
  
  Planet(float r, float d, float o, PImage img ){
  v = PVector.random3D();
  radius = r;
  distance = d;
  v.mult(distance);
  angle = random(TWO_PI);
  orbitSpeed = o;
  
  noStroke();
  noFill();
  
  globe = createShape(SPHERE, radius);
  globe.setTexture(img);
  }
  
  void orbit(){
   angle = angle + orbitSpeed;
   if (planets != null){
   for (int i = 0; i <planets. length; i++){
     planets[i].orbit();
   }
   
   }
  }
  
  void spawnMoons(int total,int level){
    planets = new Planet[total];
    for (int i = 0; i < planets.length; i++){
      float r = radius/(level *4); 
      float d = random ((radius + r),(radius+r)*4);
      float o = random(-0.1, 0.1);
      int index = int(random(0,textures.length));
      planets[i] = new Planet(r, d, o, textures[index]);
      if (level < 3){
        int num = int(random(0,4));
      planets[i].spawnMoons(num, level+1);
    }
  }
  }
    void show() {
      pushMatrix();
      noStroke();
      PVector v2 = new PVector(1, 0, 1);
      PVector p = v.cross(v2);
     rotate(angle, p.x, p.y, p.z);
     stroke(255);
     //line(0, 0, 0, v.x, v.y, v.z);
     //line(0, 0, 0, p.x, p.y, p.z);
     translate(v.x,v.y,v.z);
      noStroke();
      fill(255);
      shape(globe);
      //sphere(radius);
      //ellipse(0,0,radius*2,radius*2);
      if (planets != null){
        for (int i = 0; i < planets.length;i++){
          planets[i].show();
  }
      }
  popMatrix();
  }
  }
