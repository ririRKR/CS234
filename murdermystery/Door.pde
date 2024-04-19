class Door extends NPC{
  Door(PVector posIn, int dialogueStartIn, String doorTypeIn){
    super("DOOR", "DOOR", null, null, posIn, dialogueStartIn, dialogueStartIn, #674C17); 
    pos = posIn;
    doorType = doorTypeIn;
    beenClicked = true;
  }
  
  void display(){
    rectMode(CENTER);
    fill(#674C17);
    if(doorType.equals("H")){ //horizontal
       rect(pos.x, pos.y, width*.25, height*.0625);
    } else if(doorType.equals("V")){ //vertical
      rect(pos.x, pos.y, width*.0625, height*.25);
    }
   
  }

  PVector pos;
  String doorType;
}
