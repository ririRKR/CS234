class GS0 extends Gamestate {
  GS0(Player playerIn, ArrayList<Dialogue> dialogueArrayListIn) {
    super(playerIn, dialogueArrayListIn);
    current = 0;
   
    baseRoom = new Room("Intro", null, null, null, null, null);
    currentRoom = baseRoom;
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
  
  Room baseRoom;
}
