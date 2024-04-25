class GS4 extends Gamestate {
  GS4(Player playerIn, ArrayList<Dialogue> dialogueArrayListIn) {
    super(playerIn, dialogueArrayListIn);
    
    mcClone = new NPC("NPC", "mcClone", new PVector(width/2, height/2), 0, 0, 255, false, false);//mid
    
    ArrayList<Page> rulePages = new ArrayList<Page>();
    rulePages.add(new Page("*Curfew is from 11PM to 7AM                           *Destruction of security cameras is not allowed.                               *Rules are subject to change at any time.                            *If they are changed, you will be notified."));
    rules = new Book("Hotel Rules", rulePages, new PVector(width*3/4, height/2));

    centerRoom =  new Room("Room 262", hotelFloor, null, null, null, null);
    centerRoom.objects.add(rules);
    
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

    //textSize(25);
   // talkDisplay();
    textAlign(CENTER);
    rectMode(CORNER);
  }


  PImage hotelFloor, rosalieImg, rosalieProf;
  Book rules;
}
