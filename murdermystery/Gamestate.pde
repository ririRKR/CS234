class Gamestate {
  Gamestate(Player playerIn, ArrayList<Dialogue> dialogueArrayListIn) {
    //objs = new ArrayList<Object>();
    //tempObjs = new ArrayList<Object>();
    p = playerIn;
    dialogueNumber = 0;
    dialogues = dialogueArrayListIn;
    rooms = new ArrayList<Room>();
    doneTalking = false;
    peopleTalked = 0;
  }

  void display() {
  }

  void talkDisplay() {
    textAlign(CENTER);
    rectMode(CORNER);
    for (Object o : currentRoom.objects) {
      if (o.opened &&o.type!="BOOK") {
        if (!o.beenClicked) { //and never been clicked before
          if (dialogueNumber==1) dialogueNumber=o.getDialogueStart();
          if (dialogueNumber == o.getDialogueEnd()) { //o.friend.getDialogueEnd() ///friend object in constructor, sets them both to true
            o.opened = false; //unopen it
            o.beenClicked = true; //show that its been clicked
            if (o.buddy!=null) o.buddy.beenClicked = true; //buddy has also been clicked
            dialogueNumber = 0; // reset the dialogue
          }
        } else { //if its been clicked
          if (dialogueNumber == 1) dialogueNumber = o.getDialogueEnd();
          else if (dialogueNumber == o.getDialogueEnd()+1) {
            o.opened = false;
            dialogueNumber = 0;
          }
        }
      }
    }
    if (dialogueNumber!=0) {
      textSize(25);
      displayTalker(checkNPC(dialogues.get(dialogueNumber)));
      text(rollingText(dialogues.get(dialogueNumber)), width*.175, height*3/4, width*600/900, height*400/900);
    }
  }
  void aDisplay() {
  }

  void incrementDialogueNumber() {
    dialogueNumber++;
  }

  void openIt() {
    for (Object o : currentRoom.objects) {
      if (o.opened) o.open(); 
    }
  }


  String rollingText(Dialogue dIn) {
    if (dIn.thinking) {
      fill(#C6EEF5);
    } else if(dIn.getNamee().equals(" ")) fill(#84988D);
      else if(dIn.getNamee().equals("  ")) fill(#E3122B);
      else if(dIn.getNamee().equals("   ")) fill(#674C17);
    else fill(255);
    String speech = dIn.getSpeech();
    if (frameCount%2==0 && current<speech.length()) {
      current++;
    } else if (current>=speech.length()) {
      return speech;
    }
    return speech.substring(0, current);
  }


  void displayTalker(NPC nIn) {
    fill(nIn.fill);
    circle(width*.1, height*3/4, width*100/900);
    fill(255);
    textSize(50);
    if (!nIn.name.substring(0, 1).equals("m") && !nIn.name.substring(0, 1).equals("x")) text(nIn.name.substring(0, 1), width*.1, height*.77);
    textSize(25);
  }

  NPC checkNPC(Dialogue dIn) {
    String speaker = dIn.getNamee();
    //println(speaker);
    if (speaker.equals("Thalia")) {
      return thalia;
    } else if (speaker.equals("Magnolia")) {
      return magnolia;
    } else if (speaker.equals("Angeline")) {
      return angeline;
    } else if (speaker.equals("Emily")) {
      return emily;
    } else if (speaker.equals("Sasha")) {
      return sasha;
    } else if (speaker.equals("Willow")) {
      return willow;
    } else if (speaker.equals("Rosalie")) {
      return rosalie;
    } else if (speaker.equals("Nebula")) {
      return nebula;
    } else return mcClone;
  }

  boolean checkTalked() {
    for (Room r : rooms) {
      for (Object o : r.objects) {
        if (o.buddy!=null) {
          if (!o.beenClicked && !o.buddy.beenClicked) {
            return false; //if you haven't clicked on someone yet, talkedToEveryone = false;
          }
        } else if (!o.beenClicked) {
          return false;
        }
      }
    }
    return true;
  }

  int thingsClicked() {
    int thingsClicked = 0;
    for (Room r : rooms) {
      for (Object o : r.objects) {
        if (o.beenClicked == true) {
          thingsClicked++;
        }
      }
    }
    return thingsClicked;
  }

  int numDoors() {
    int numDoor = 0;
    for (Room r : rooms) {
      for (Object o : r.objects) {
        //println(o.getType());
        if (o.type.equals("DOOR")) {
          numDoor++;
        }
      }
    }
    return numDoor;
  }

  void displayThingsToSee() {
    int minusDoors1 = thingsClicked()-numDoors();
    int minusDoors2 = totalObjects()-numDoors();
    fill(255);
    text(minusDoors1 + " / " + minusDoors2, width/2, height*.1);
  }

  int totalObjects() {
    int objNumber = 0;
    for (Room r : rooms) {
      objNumber+=r.objects.size();
    }
    return objNumber;
  }

  Player p;
  int dialogueNumber;
  int current;
  ArrayList<Dialogue> dialogues;
  ArrayList<Object> objs, tempObjs;
  ArrayList<Room> rooms;
  Room currentRoom;
  boolean doneTalking;
  int peopleTalked;
}

/*
  void moveRooms(Room r){
 if(r.getType().equals("CENTER")){
 if(checkRightRoom()){
 image(rightArrow, width*.8, height*.8);
 }
 }
 
 }*/
/*
  void swappedRooms(Room rIn){
 
 if(rIn.getType().equals("RIGHT")){
 for(Room r: rooms){
 if(r.getType().equals("CENTER")) r.type = "LEFT";
 
 if(!r.getType().equals("CENTER")) //if not center or left
 break;
 } //set current to center
 
 
 
 }*/

/*
  boolean checkLeftRoom(){
 boolean lRoom = false;
 for(Room r: rooms){
 if(r.getType().equals("LEFT")) lRoom = true;
 }
 return lRoom;
 }
 
 boolean checkRightRoom(){
 boolean rRoom = false;
 for(Room r: rooms){
 if(r.getType().equals("RIGHT")) rRoom = true;
 }
 return rRoom;
 }
 
 boolean checkUpRoom(){
 boolean uRoom = false;
 for(Room r: rooms){
 if(r.getType().equals("UP")) uRoom = true;
 }
 return uRoom;
 }
 
 boolean checkDownRoom(){
 boolean dRoom = false;
 for(Room r: rooms){
 if(r.getType().equals("DOWN")) dRoom = true;
 }
 return dRoom;
 }*/





/*
  if you want it to only display the person you are talking to:
 boolean nothingOpened = true;
 background(0);
 for (Object o : objs) {
 if(o.opened == true){
 nothingOpened = false;
 }
 }
 
 if(nothingOpened == true){
 for(Object o: objs){
 o.display();
 }
 p.display();
 }
 
 for (Object o: objs) {
 if (o.opened == true) {
 o.open();
 nothingOpened = false;
 }
 }*/
