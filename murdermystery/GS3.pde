class GS3 extends Gamestate {
  GS3(Player playerIn, ArrayList<Dialogue> dialogueArrayListIn) {
    super(playerIn, dialogueArrayListIn);
    current = 0;
    currentRoom = new Room("Hotel Room 262", null, null, null, null, null);
  }

  void display() {
    aDisplay();
    textAlign(CENTER);
    textSize(40);
    text(rollingText(dialogues.get(dialogueNumber)), width*.175, height/4, width*600/900, height*400/900);
  }

  void aDisplay() {
    background(0);
    p.display();
  }
}



/*  GS3(Player playerIn, ArrayList<Dialogue> dialogueArrayListIn) {
 super(playerIn, dialogueArrayListIn);
 
 mcClone = new NPC("NPC", "mcClone", new PVector(width/2, height/2), 0, 25, 255, false, true);//mid
 
 centerRoom = new Room("Room 262", null, null, null, null, null);
 centerRoom.objects.add(mcClone);
 
 rooms.add(centerRoom);
 
 currentRoom = centerRoom;
 }
 
 void display() {
 aDisplay();
 }
 
 
 void aDisplay() {
 currentRoom.displayRoom();
 
 p.display();
 openIt();
 
 textSize(25);
 talkDisplay();
 //displayThingsToSee();
 
 }
 
 
 }*/
