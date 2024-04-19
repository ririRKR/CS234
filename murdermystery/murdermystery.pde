Player mc;
Book keyCardX;
Object keycard;
ArrayList<Page> pagesb1;
ArrayList<Object> GS0objects;
ArrayList<Gamestate> Gamestates;
int cgs; // current game state
NPC rosalie, emily, thalia, willow, magnolia, nebula, angeline, sasha, mcClone;
Door mainDoor, securityDoor;
Door hotelRoom1, hotelRoom2, hotelRoom3;
Room centerRoom, rightRoom;
GS0 gs0; GS1 gs1; GS2 gs2; GS3 gs3; GS4 gs4;
boolean allClosed;
PImage rightArrow;
void setup() {
  size(900, 900);
  
  mc = new Player(new PVector(width/2, height/2));
  
  GS0objects = new ArrayList<Object>();

  rightArrow = loadImage("rightarrow.png");
  rightArrow.resize(int(width*.1), int(height*.1));

  Gamestates = new ArrayList<Gamestate>();
  gs0 = new GS0(mc, loadDialogue("GS0.txt"));
  gs1 = new GS1(mc, loadDialogue("GS1.txt"), "It's getting late. I should see if anyone has found anything.");
  gs2 = new GS2(mc, loadDialogue("GS2.txt"));
  gs3 = new GS3(mc, loadDialogue("GS3.txt"));
  gs4 = new GS4(mc, loadDialogue("GS3.txt"));
  //gs3 = new GS3(mc, loadDialogue("GS2.txt"));
  Gamestates.add(gs0); Gamestates.add(gs1); Gamestates.add(gs2); Gamestates.add(gs3); Gamestates.add(gs4);
  cgs = 4;
  allClosed = true;
  //display the .gamestate.get (last line), new variable for last gamestate
  
  //what a prestigious career
}

void draw() {
  Gamestates.get(cgs).display();
  changeGS();
}


void mouseClicked() {
  Gamestates.get(cgs).current = 0;
  boolean notOpened = true;
  for (Object o : Gamestates.get(cgs).currentRoom.objects) {
    if (o.opened == true) {
      notOpened = false;
      break;
    }
  }

  for (Object o : Gamestates.get(cgs).currentRoom.objects) {
    if (o.type == "BOOK" && o.opened == true) { //if the book is opened
      if (mouseX>width/2&& mouseX<width*3/4) { // if mouse is on right side of book
        o.incPageNumber(); // next page
      } else if (mouseX>width*1/4&& mouseX<width/2) { //if mouse is on left side of book
        o.decPageNumber(); // previous page
      }
    } else if (o.type == "NPC" && o.opened == true) {
      o.open();
    }
    }

  if(notOpened) checkDistance();
  if (cgs==0 || cgs == 3) {
    Gamestates.get(cgs).dialogueNumber++;
  } else {
    for (Object o : Gamestates.get(cgs).currentRoom.objects) { //per room
      if (o.opened) {
        Gamestates.get(cgs).incrementDialogueNumber();
      }
    }
  }


  
}

void keyPressed() {
  Gamestate currentGS = Gamestates.get(cgs);
  if (cgs!=0) {
    if (nothingOpened()) {
      if (key == 'w') {
        mc.move("UP");
      } else if (key == 's') {
        mc.move("DOWN");
      } else if (key == 'a') {
        mc.move("LEFT");
      } else if (key == 'd') {
        mc.move("RIGHT");
      } else if(keyCode == RIGHT){
        if(currentGS.currentRoom.right!=null){
          currentGS.currentRoom = currentGS.currentRoom.right;
          currentGS.p.pos.x= width/2;
          currentGS.p.pos.y= height/2;
        } 
      } else if(keyCode == LEFT){
         if(currentGS.currentRoom.left!=null){
          currentGS.currentRoom = currentGS.currentRoom.left;
          currentGS.p.pos.x= width/2;
          currentGS.p.pos.y= height/2;
        } 
      }
    }
  }
  
  if(keyCode == TAB){
    if(!nothingOpened()){
      for(Object o: Gamestates.get(cgs).currentRoom.objects){
        if(o.type.equals("BOOK")) o.opened = false;
      }
    }
  }
  
}

void checkDistance() {
  for (Object o : Gamestates.get(cgs).currentRoom.objects) {
    if (dist(mouseX, mouseY, o.pos.x, o.pos.y)<30) {
      if (o.getType().equals("BOOK") || o.getType().equals("NPC") || o.getType().equals("DOOR")) {
        o.opened = true;
        o.pageNumber = 0;
      }
      break;
    }
  }
}


boolean nothingOpened(){
 boolean notOpened = true;
  Gamestate currentGS = Gamestates.get(cgs);
  for (Object o : currentGS.currentRoom.objects) {
    if (o.opened == true) {
      notOpened = false;
      break;
    }
  }
  return notOpened;
}

void changeGS() {
  if (cgs==0 && Gamestates.get(cgs).dialogueNumber == 6) {
    cgs++;
  } else if(cgs==2 && Gamestates.get(cgs).dialogueNumber == 0 && nothingOpened()){
    cgs++;
  } else if(cgs==3 && Gamestates.get(cgs).dialogueNumber == 11 && nothingOpened()){
    cgs++;
  } else if(cgs==1 && Gamestates.get(cgs).checkTalked() == true){
    cgs++;
  } 
}

ArrayList<Dialogue> loadDialogue(String filename) {
  String[] lines = loadStrings(filename);
  ArrayList<Dialogue> dialogues = new ArrayList<>();
  for (String line : lines) {
    String[] parts = line.split("=");
    if (parts.length!=2) {
      System.out.println("Line " + line + " not formatted properly");
      continue;
    }

    String name = returnName(parts[0]);
    String speech = parts[1];
    Dialogue d = new Dialogue(name, speech);
    d.thinking = getThinking(parts[0]);
    dialogues.add(d);
    
  }
  return dialogues;
}

String returnName(String nameIn) {
  String name = "";
  if (nameIn.equals("Ros")) {
    name = "Rosalie";
  } else if (nameIn.equals("Neb")) {
    name = "Nebula";
  } else if (nameIn.equals("cen")) {
    name = " ";
  } else if (nameIn.equals("Sas")) {
    name = "Sasha";
  } else if(nameIn.equals("Mag")){
    name = "Magnolia";
  } else if (nameIn.equals("Ang")){
    name = "Angeline";
  } else if(nameIn.equals("Emi")){
    name = "Emily";
  } else if(nameIn.equals("Sas")){
    name = "Sasha";
  } else if(nameIn.equals("Wil")){
    name = "Willow";
  } else if (nameIn.equals("mcN") || nameIn.equals("mcT")) {
    name = "You";
  } else if(nameIn.equals("Tha")){
    name = "Thalia";
  }
  return name;
}

boolean getThinking(String input){
  if(input.equals("mcT")) return true;
  else return false;
}
