class NPC extends Object {
  NPC(String type, String nameIn, PImage spriteIn, PImage talkImgIn, PVector startPos, int dialogueStartIn, int dialogueEndIn, color fillIn) {
    super(type, startPos);
    fill = fillIn;
    dialogueStart = dialogueStartIn;
    dialogueEnd = dialogueEndIn;
    beenClicked = false;
    name = nameIn;
    sprite = spriteIn;
    talkImg = talkImgIn;
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
    else {rectMode(CENTER); rect(pos.x, pos.y, 100, 50); rectMode(CENTER);}
    fill(255);
    textSize(40);
    if(!name.substring(0, 1).equals("x")) text(name.substring(0, 1), pos.x, pos.y+15);
    imageMode(CORNER);
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
  PImage sprite, talkImg;
  //NPC buddy;
}
