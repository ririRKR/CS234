class GS1 extends Gamestate {
  GS1(Player playerIn, ArrayList<Dialogue> dialogueArrayListIn, String lastLineIn) {
    super(playerIn, dialogueArrayListIn);

    lastLine = lastLineIn;
  
    rosalieImg = loadImage("rosalie.png");
    rosalieImg.resize(75, 150);
    rosalieProf = loadImage("rosalieprof.png");
    rosalieProf.resize(100, 100);

    rosalie = new NPC("NPC", "Rosalie", new PVector(width*.9, height*.32), 83, 99, #001DD3, false, false); // mid left
    emily = new NPC("NPC", "Emily", new PVector(width/4, height/4), 30, 43, #881EF5, false, false); // top left
    thalia = new NPC("NPC", "Thalia", new PVector(width*.9, height*.9), 67, 81, #0C9532, false, false); // top mid
    willow = new NPC("NPC", "Willow", new PVector(width*.9, height/4), 83, 98, #7E2920, false, false); //top right
    magnolia = new NPC("NPC", "Magnolia", new PVector(width*.35, height*.15), 1, 11, #1ACED6, false, false); //mid right
    nebula = new NPC("NPC", "Nebula", new PVector(width*3/4, height*3/4), 57, 65, #A28D80, false, false); //bot right
    angeline = new NPC("NPC", "Angeline", new PVector(width*.2, height/2), 13, 28, #FF2A1F, false, false); // bot mid
    sasha = new NPC("NPC", "Sasha", new PVector(width*.1, height*.9), 45, 54, #D1F2FA, false, false); // bot left
    mcClone = new NPC("NPC", "mcClone", new PVector(width/2, height/2), 25, 25, 255, false, false);//mid
    rosalie.buddy = willow; willow.buddy = rosalie;
    
    mainDoor = new Door(new PVector(width/2, height*.025), 101, "H");
    securityDoor = new Door(new PVector(width*.98, height*.3), 102, "V");
    
    hotelFloor = loadImage("hotelfloor.png");
    hotelFloor.resize(width, height);
    
    centerRoom = new Room("Lobby", hotelFloor, null, null, null, null);
    rightRoom = new Room("Hotel Rooms", hotelFloor, centerRoom, null, null, null);
    centerRoom.right = rightRoom;

    centerRoom.objects.add(rosalie);
    rightRoom.objects.add(emily);
    centerRoom.objects.add(thalia);
    centerRoom.objects.add(willow);
    centerRoom.objects.add(magnolia);
    centerRoom.objects.add(nebula);
    centerRoom.objects.add(angeline);
    centerRoom.objects.add(sasha);
    centerRoom.objects.add(mainDoor);
    centerRoom.objects.add(securityDoor);

    rooms.add(centerRoom);
    rooms.add(rightRoom);

    //left, right, up, down
    currentRoom = centerRoom;
  }

  void display() {
    aDisplay();
  }


  void aDisplay() {
    currentRoom.displayRoom();
    if (thingsClicked()<3) {
      instructions();
    }
    
    p.display();
    openIt();

    textSize(25);
    talkDisplay();
    displayThingsToSee();
  }

  void instructions() {
    textAlign(LEFT);
    textSize(20);
    text("WASD TO MOVE", width*.025, height*.065);
    text("ARROW KEYS TO CHANGE ROOMS", width*.025, height*.1);
    text("DOORS ARE", width*.025, height*.135);
    fill(#674C17);
    text("BROWN", width*.14, height*.135);
    textAlign(CENTER);
  }

  PImage hotelFloor, rosalieImg, rosalieProf;
  String lastLine;
}
