void setup(){
  size(500, 500); // Set the size of the window
  // Set ellipses and rects to CENTER mode
  ellipseMode(CENTER);
  rectMode(CENTER);
}
Easy e = new Easy();
Normal n = new Normal();
Hard h = new Hard();
Ball b = new Ball();
void draw(){
  background(255);
  b.ell();
  b.move();
  e.draw_zoog();
  e.move();
  n.draw_zoog();
  n.move();
  h.draw_zoog();
  h.move();
}

boolean mouseClicked(int x,int y){
  if(dist(mouseX,mouseY,x,y) <= 16 && mousePressed){
    return true;
  }else{
    return false;
  }
}

class Easy extends Zoog{
  void move(){
    x+= tempox/2;
    y+= tempoy/2;
    if((x + 40 > 500 || x - 40 <= 0)){
      tempox *= -1;
    }
  
    if(y + 70 >= 500 || y - 70 <= 0){
      tempoy *= -1;
    }
  }
}

class Hard extends Zoog{
  void move(){
    x+= tempox*2;
    y+= tempoy*2;
    if((x + 40 > 500 || x - 40 <= 0)){
      tempox *= -1;
    }
  
    if(y + 70 >= 500 || y - 70 <= 0){
      tempoy *= -1;
    }
  }
}

class Normal extends Zoog{  
  void move(){
    
    x+= tempox;
    y+= tempoy;
    if((x + 40 > 500 || x - 40 <= 0)){
      tempox *= -1;
    }
  
    if(y + 70 >= 500 || y - 70 <= 0){
      tempoy *= -1;
    }
  
  }
}


abstract class Zoog{
  int x = 100;int y = 100;
  int tempox = 2; int tempoy = 2;
  int mode = 1;
  int r_eye = 1;
  int l_eye = 1;
 
  int hp = 2;
  
  
  abstract void move();
  
  
  boolean mouseClicked(int x,int y){
    if(dist(mouseX,mouseY,x,y) <= 16 && mousePressed){
      return true;
    }else{
      return false;
    }
  }
  
  void draw_zoog(){
  
    // Draw Zoog’s body
    stroke(0);
    fill(150);
    rect(x, y, 20, 100);
    
  
    // Draw Zoog’s head
    fill(255);
    ellipse(x, y-30, 60, 60);
  
  // Draw Zoog’s eyes
    if(mouseClicked(x-19,y-30)){
      fill(255);
      l_eye--;
      hp--;
    }else{
      if(l_eye > 0){
        fill(0);
      }else{
        fill(255);
      }
    }
    ellipse(x-19, y-30, 16, 32);
  
    if(mouseClicked(x+19,y-30) ){
      fill(255);
      r_eye--;
      hp--;
    }else{
      if(r_eye > 0){
        fill(0);
      }else{
        fill(255);
      }
    }
    ellipse(x+19, y-30, 16, 32);
  
  // Draw Zoog’s legs
    stroke(0);
    line(x-10, y+50, x-20, y+60);
    line(x+10, y+50, x+20, y+60);
  }
}