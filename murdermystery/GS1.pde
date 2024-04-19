class GS1 extends Gamestate {
  GS1(Player playerIn, ArrayList<Dialogue> dialogueArrayListIn, String lastLineIn) {
    super(playerIn, dialogueArrayListIn);

    lastLine = lastLineIn;
  
    rosalieImg = loadImage("rosalie.png");
    rosalieImg.resize(75, 150);
    rosalieProf = loadImage("rosalieprof.png");
    rosalieProf.resize(100, 100);

    rosalie = new NPC("Rosalie", rosalieImg, null, new PVector(width*.9, height*.32), 83, 99, #001DD3); // mid left
    emily = new NPC("Emily",  rosalieImg, null,new PVector(width/4, height/4), 30, 43, #881EF5); // top left
    thalia = new NPC("Thalia",  rosalieImg, null,new PVector(width*.9, height*.9), 67, 81, #0C9532); // top mid
    willow = new NPC("Willow",  rosalieImg, null,new PVector(width*.9, height/4), 83, 98, #7E2920); //top right
    magnolia = new NPC("Magnolia", rosalieImg, null, new PVector(width*.35, height*.15), 1, 11, #1ACED6); //mid right
    nebula = new NPC("Nebula",  rosalieImg, null,new PVector(width*3/4, height*3/4), 57, 65, #A28D80); //bot right
    angeline = new NPC("Angeline",  rosalieImg, null,new PVector(width*.2, height/2), 13, 28, #FF2A1F); // bot mid
    sasha = new NPC("Sasha", rosalieImg, null,new PVector(width*.1, height*.9), 45, 54, #D1F2FA); // bot left
    mcClone = new NPC("mcClone",  rosalieImg, null,new PVector(width/2, height/2), 25, 25, 255);//mid
    rosalie.buddy = willow; willow.buddy = rosalie;
    
    mainDoorGS1 = new Door(new PVector(width/2, height*.025), 101, "H");
    securityDoorGS1 = new Door(new PVector(width*.98, height*.3), 102, "V");
    
    hotelFloor = loadImage("hotelfloor.png");
    hotelFloor.resize(width, height);
    
    centerGS1Room = new Room("Lobby", hotelFloor, null, null, null, null);
    rightGS1Room = new Room("Hotel Rooms", hotelFloor, centerGS1Room, null, null, null);
    centerGS1Room.right = rightGS1Room;

    centerGS1Room.objects.add(rosalie);
    rightGS1Room.objects.add(emily);
    centerGS1Room.objects.add(thalia);
    centerGS1Room.objects.add(willow);
    centerGS1Room.objects.add(magnolia);
    centerGS1Room.objects.add(nebula);
    centerGS1Room.objects.add(angeline);
    centerGS1Room.objects.add(sasha);
    centerGS1Room.objects.add(mainDoorGS1);
    centerGS1Room.objects.add(securityDoorGS1);

    rooms.add(centerGS1Room);
    rooms.add(rightGS1Room);

    //left, right, up, down
    currentRoom = centerGS1Room;
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

  int peopleTalked;
  PImage hotelFloor, rosalieImg, rosalieProf;
  String lastLine;
}
