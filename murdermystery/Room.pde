class Room{
  Room(String nameIn, PImage floorIn, Room leftIn, Room rightIn, Room upIn, Room downIn){
    objects = new ArrayList<Object>();
    name = nameIn;
    left = leftIn; right = rightIn; up = upIn; down = downIn;
    floor = floorIn;
  }

  void displayRoom(){
    //if(floor!=null)image(floor, 0, 0);
    textAlign(CENTER);
    background(0);
    for(Object o: objects){
      o.display();
      if (o.opened == true) o.open();
    }
    fill(255);
    textSize(30);
    text(name, width*.9, height*.08);
  }
  
 
  ArrayList<Object> objects; 
  String name;
  Room left, right, up, down;
  PImage floor;
}
