class NPC extends Object {
  NPC(String type, String nameIn, PVector startPos, int dialogueStartIn, int dialogueEndIn, color fillIn, boolean beenClickedIn, boolean startOpenIn) {
    super(type, startPos);
    fill = fillIn;
    dialogueStart = dialogueStartIn;
    dialogueEnd = dialogueEndIn;
    beenClicked = beenClickedIn;
    opened = startOpenIn;
    name = nameIn;
  }

  void open() {
    fill(150);
    rectMode(CENTER);
    rect(width/2, height*.85, width, 300);
  }
  
  void display() {
    fill(fill);
    imageMode(CENTER);
    //image(sprite, pos.x, pos.y);
    if(!name.substring(0, 1).equals("x")) circle(pos.x, pos.y, 50);
    else {rectMode(CENTER); rect(pos.x, pos.y, 100, 50); } //deleted a rectmode center in here
    fill(255);
    textSize(40);
    if(!name.substring(0, 1).equals("x")) text(name.substring(0, 1), pos.x, pos.y+15);
    imageMode(CORNER);
  }
 
 
  void remakePosition(PVector posIn, int startD, int endD){
    pos = posIn;
    dialogueStart = startD;
    dialogueEnd = endD;
  }

  int getDialogueStart() {
    return dialogueStart;
  }

  int getDialogueEnd() {
    return dialogueEnd;
  }

  color fill;
  int dialogueStart, dialogueEnd;
  String name;
  //NPC buddy;
}
