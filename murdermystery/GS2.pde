class GS2 extends Gamestate {
  GS2(Player playerIn, ArrayList<Dialogue> dialogueArrayListIn) {
    super(playerIn, dialogueArrayListIn);

    rosalieImg = loadImage("rosalie.png");
    rosalieImg.resize(75, 150);
    rosalieProf = loadImage("rosalieprof.png");
    rosalieProf.resize(100, 100);

    rosalie = new NPC("Rosalie", rosalieImg, null, new PVector(width/2, height/4), 83, 99, #001DD3); // mid left
    emily = new NPC("Emily",  rosalieImg, null,new PVector(width/4, height/4), 30, 43, #881EF5); // top left
    thalia = new NPC("Thalia",  rosalieImg, null,new PVector(width/4, height/2), 67, 81, #0C9532); // top mid
    willow = new NPC("Willow",  rosalieImg, null,new PVector(width/4,  height*3/4), 83, 98, #7E2920); //top right
    magnolia = new NPC("Magnolia", rosalieImg, null, new PVector(width/2, height*3/4), 1, 11, #1ACED6); //mid right
    nebula = new NPC("Nebula",  rosalieImg, null,new PVector(width*3/4, height*3/4), 57, 65, #A28D80); //bot right
    angeline = new NPC("Angeline",  rosalieImg, null,new PVector(width*3/4, height/2), 13, 28, #FF2A1F); // bot mid
    sasha = new NPC("Sasha", rosalieImg, null,new PVector(width*3/4, height/4), 45, 54, #D1F2FA); // bot left
    mcClone = new NPC("mcClone",  rosalieImg, null,new PVector(width/2, height/2), 25, 25, 255);//mid
    rosalie.buddy = willow; willow.buddy = rosalie;
    
    mainDoorGS1 = new Door(new PVector(width/2, height*.025), 101, "H");
    securityDoorGS1 = new Door(new PVector(width*.98, height*.3), 102, "V");
    
    hotelFloor = loadImage("hotelfloor.png");
    hotelFloor.resize(width, height);
    
    centerGS2Room = new Room("Lobby", hotelFloor, null, null, null, null);

    centerGS2Room.objects.add(rosalie);
    centerGS2Room.objects.add(emily);
    centerGS2Room.objects.add(thalia);
    centerGS2Room.objects.add(willow);
    centerGS2Room.objects.add(magnolia);
    centerGS2Room.objects.add(nebula);
    centerGS2Room.objects.add(angeline);
    centerGS2Room.objects.add(sasha);
    centerGS2Room.objects.add(mainDoorGS1);
    centerGS2Room.objects.add(securityDoorGS1);

    rooms.add(centerGS2Room);
    currentRoom = centerGS2Room;
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
