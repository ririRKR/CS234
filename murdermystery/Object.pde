class Object {
  Object(String typeIn, PVector startPos) {
    type = typeIn;
    if (type.equals("NPC")) {
    } else if (type.equals("OBJ")) {
    } else if(type.equals("BOOK")){
    }
    pos = startPos;
    opened = false;
    beenClicked = false;
   
  }

  void display() {
    fill(255);
    circle(pos.x, pos.y, 50);
  }
  
  void open(){
    //circle(width/2, height/2, 100);
  }
 
  void move(String direction) {
    if (direction.equals("LEFT")) {
      pos.x-=15;
    } else if (direction.equals("RIGHT")) {
      pos.x+=15;
    } else if (direction.equals("UP")) {
      pos.y-=15;
    } else if (direction.equals("DOWN")) {
      pos.y+=15;
    }
  }
  
  void decPageNumber() { 
  }
  
  void incPageNumber(){
  }
  
  
  String getType(){
    return type;
  }
  
  int getDialogueStart(){return 0;}
  int getDialogueEnd(){return 0;}
  
 
  PVector pos;
  String type;
  boolean opened;
  int pageNumber;
  boolean beenClicked;
  Object buddy;
}
