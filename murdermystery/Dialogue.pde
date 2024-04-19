class Dialogue{
  Dialogue(String nameIn, String speechIn){
    name = nameIn;
    speech = speechIn;
    thinking = false;
  }
  
  String getNamee(){ return name;}
  String getSpeech(){ return speech;}
  String name, speech;
  boolean thinking;
}
