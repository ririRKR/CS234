class Book extends Object{
  Book(String bookTitleIn, ArrayList<Page> pagesIn, PVector startPos) {
    super("BOOK", startPos);
    pages = pagesIn;
    pageNumber = 0;
    bookTitle = bookTitleIn;
    
  }

  void display(){
    fill(#226F71);
    stroke(0);
    rect(pos.x, pos.y-width*.02, width*.04, height*.06);
  }
  void open() {
    beenClicked = false;
    pages.get(pageNumber).display(pageNumber, bookTitle);
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
  String bookTitle;
}

class Page {
  Page(String textIn) {
    text = textIn;
  }

  void display(int pageN, String bookTitleIn) {
    fill(255);
    rectMode(CENTER);
    textAlign(LEFT);
    stroke(255);
    rect(width/2, height/2, width/2, height*.7);
    fill(0);

    if (pageN==0) {
      textSize(50);
      text(bookTitleIn, width*.27, height*.23);
      textSize(20);
      text(text, 450, 525, 400, 600);
    } else {
      textSize(20);
      text(text, 450, 450, 400, 600);
      //text(text, width*.275, height*.2, -100, 600);
    }
    textAlign(CENTER);
  }

  String text;
}
