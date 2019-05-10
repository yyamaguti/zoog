class Ball{
  int x,y;
  int r;
  int num;
  Ball(){
    x = mouseX;
    y = mouseY;
    r = 20;
    num = 10;
  }
  
  void ell(){
    fill(255,0,0);
    ellipse(x,y,r*2,r*2);
  }
  
  void move(){
    y--;
    if(mousePressed){
      x = mouseX; y = mouseY;
    }
    
  }
  
}