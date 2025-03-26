Spider spider;
Web web;
boolean debug = true;

void setup(){
  size(700,500);
  newWeb();
  
  
}

void draw(){
  background(255);
  web.display();
  //spider.follow(web);
  //spider.update();
  //spider.display();
}

void newWeb(){
  web = new Web();
  web.addPoint(27 + 512/5 , 27);
  web.addPoint(27 + 512/2.5, 27 + 512/5);
  web.addPoint(27 + 512/5, 27 + 512/2.5);
  web.addPoint(27 , 27 + 512/5);
} 


public void keyPressed(){
  if (key ==' '){
    debug = !debug;
  }
}
