class Book extends Object{
  Book(ArrayList<Page> pagesIn, PVector startPos) {
    super("BOOK", startPos);
    pages = pagesIn;
    pageNumber = 0;
    
  }

  void open() {
    pages.get(pageNumber).display(pageNumber);
  }

  void incPageNumber() {
    if (pageNumber<pages.size()-1) {
      pageNumber++;
    }
  }

  void decPageNumber() {
    if (pageNumber>0) {
      pageNumber--;
    }
  }
  
 

  ArrayList<Page> pages;
}

class Page {
  Page(String textIn) {
    text = textIn;
  }

  void display(int pageN) {
    fill(255);
    rectMode(CENTER);
    textAlign(LEFT);
    stroke(255);
    rect(width/2, height/2, width/2, height*.7);
    fill(0);

    if (pageN==0) {
      textSize(50);
      text("Evidence 1", width*.27, height*.23);
      textSize(20);
      text(text, 450, 525, 400, 600);
    } else {
      textSize(20);
      text(text, 450, 450, 400, 600);
      //text(text, width*.275, height*.2, -100, 600);
    }
  }

  String text;
}
