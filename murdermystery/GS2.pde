class GS2 extends Gamestate {
  GS2(Player playerIn, ArrayList<Dialogue> dialogueArrayListIn) {
    super(playerIn, dialogueArrayListIn);

    rosalieImg = loadImage("rosalie.png");
    rosalieImg.resize(75, 150);
    rosalieProf = loadImage("rosalieprof.png");
    rosalieProf.resize(100, 100);

    rosalie = new NPC("NPC", "Rosalie", rosalieImg, null, new PVector(width/2, height/4), 83, 99, #001DD3); // mid left
    emily = new NPC("NPC", "Emily", rosalieImg, null,new PVector(width/4, height/4), 30, 43, #881EF5); // top left
    thalia = new NPC("NPC", "Thalia",  rosalieImg, null,new PVector(width/4, height/2), 67, 81, #0C9532); // top mid
    willow = new NPC("NPC", "Willow",  rosalieImg, null,new PVector(width/4,  height*3/4), 83, 98, #7E2920); //top right
    magnolia = new NPC("NPC", "Magnolia", rosalieImg, null, new PVector(width/2, height*3/4), 1, 11, #1ACED6); //mid right
    nebula = new NPC("NPC", "Nebula",  rosalieImg, null,new PVector(width*3/4, height*3/4), 57, 65, #A28D80); //bot right
    angeline = new NPC("NPC", "Angeline",  rosalieImg, null,new PVector(width*3/4, height/2), 13, 28, #FF2A1F); // bot mid
    sasha = new NPC("NPC", "Sasha", rosalieImg, null,new PVector(width*3/4, height/4), 45, 54, #D1F2FA); // bot left
    mcClone = new NPC("NPC", "mcClone",  rosalieImg, null,new PVector(width/2, height/2), 25, 25, 255);//mid
    rosalie.buddy = willow; willow.buddy = rosalie;
    
    mainDoor = new Door(new PVector(width/2, height*.025), 101, "H");
    securityDoor = new Door(new PVector(width*.98, height*.3), 102, "V");
    
    hotelFloor = loadImage("hotelfloor.png");
    hotelFloor.resize(width, height);
    
    centerRoom = new Room("Lobby", hotelFloor, null, null, null, null);

    centerRoom.objects.add(rosalie);
    centerRoom.objects.add(emily);
    centerRoom.objects.add(thalia);
    centerRoom.objects.add(willow);
    centerRoom.objects.add(magnolia);
    centerRoom.objects.add(nebula);
    centerRoom.objects.add(angeline);
    centerRoom.objects.add(sasha);
    centerRoom.objects.add(mainDoor);
    centerRoom.objects.add(securityDoor);

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
    displayThingsToSee();
  }

  int peopleTalked;
  PImage hotelFloor, rosalieImg, rosalieProf;
}
