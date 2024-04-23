class GS5 extends Gamestate {
  GS5(Player playerIn, ArrayList<Dialogue> dialogueArrayListIn) {
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
