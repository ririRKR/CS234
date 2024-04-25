class GS7 extends Gamestate {
  GS7(Player playerIn, ArrayList<Dialogue> dialogueArrayListIn) {
    super(playerIn, dialogueArrayListIn);
    rosalie = new NPC("NPC", "Rosalie", new PVector(width/2, height/4), 1, 30, #001DD3, false, true); // mid left
    emily = new NPC("NPC", "Emily", new PVector(width/4, height/4), 0, 0, #881EF5, false, false); // top left
    thalia = new NPC("NPC", "Thalia",new PVector(width/4, height/2), 0, 0, #0C9532, false, false); // top mid
    willow = new NPC("NPC", "Willow", new PVector(width/4,  height*3/4), 0, 0, #7E2920, false, false); //top right
    magnolia = new NPC("NPC", "Magnolia", new PVector(width/2, height*3/4), 0, 0, #1ACED6, false, false); //mid right
    nebula = new NPC("NPC", "Nebula", new PVector(width*3/4, height*3/4), 0, 0, #A28D80, false, false); //bot right
    angeline = new NPC("NPC", "Angeline", new PVector(width*3/4, height/2), 0, 0, #FF2A1F, false, false); // bot mid
    mcClone = new NPC("NPC", "mcClone", new PVector(width/2, height/2), 0, 0, 255, false, false);//mid
    
   // mainDoor = new Door(new PVector(width/2, height*.025), 101, "H");
    //securityDoor = new Door(new PVector(width*.98, height*.3), 102, "V");
    
    centerRoom = new Room("Lobby", null, null, null, null, null);

    centerRoom.objects.add(rosalie);
    centerRoom.objects.add(emily);
    centerRoom.objects.add(thalia);
    centerRoom.objects.add(willow);
    centerRoom.objects.add(magnolia);
    centerRoom.objects.add(nebula);
    centerRoom.objects.add(angeline);
    //centerRoom.objects.add(sasha);
    //centerRoom.objects.add(mainDoor);
    //centerRoom.objects.add(securityDoor);

    rooms.add(centerRoom);
    currentRoom = centerRoom;
    dialogueNumber = 1;
    
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

  }
}
