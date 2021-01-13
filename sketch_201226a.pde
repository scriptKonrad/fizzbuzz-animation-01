StringSystem[] mySS = {};
int _num;
int fontSize = 23;

void setup() {
  size(400,400);

  _num = height / fontSize;
  
  for  (int i = 0; i < _num; i++) {
    StringSystem thisSS = new StringSystem(fontSize + i * fontSize);

    mySS = (StringSystem[])append(mySS, thisSS);
  }
}

void draw() {
    background(5);
  for  (int i = 0; i < mySS.length; i++) {
    StringSystem thisSS = mySS[i];
    thisSS.display();
    thisSS.move();
  }
}

class StringSystem {
  int a, b, h_, h;
  PFont f;
  float x, xpos, cw;
  String str1 = "";
  float halfScreen = width / 2;
  
  StringSystem(int h_) {
    a = int(random(11, 23));  //generate first number in string
    b = int(random(29, 43));  //generate how long string will be
    x = random(0.5, 2);       //speed of sting
    h = h_;                   //height when string will appear
    xpos = 50;                //position of first string
    fizzbuzz(a, b);           //fizzbuzz algorytm
    cw = (textWidth(str1));   //how long string will be
  }
  
  void reset() {
    str1 = "";
    xpos = width;
    a = int(random(11, 23));
    b = int(random(29, 43));
    x = random(0.5, 2);
    fizzbuzz(a, b);
    cw = (textWidth(str1));
  }
  
  void move() {
    xpos = xpos - x;
    if ((xpos + cw + halfScreen) < 0)  {
      reset();
    }
  }
  
  void display() {
    f = createFont("Arial", fontSize, true);
    textFont(f, fontSize); 
    fill(255,0,0);
    text(str1, xpos, h);
  }

  void fizzbuzz(int x_, int y_) {
    for(int i = x_; i <= x_ + y_; i++) {
    if ((i % 15) == 0) {
        str1 = str1 + "fizzbuzz ";
      }
    else if ((i % 3) == 0) {
        str1 = str1 + "fizz ";
      }      
    else if ((i % 5) == 0) {
        str1 = str1 + "buzz ";
      }
    else {
        str1 = str1 + str(i) + " ";
      }
    }
    
  }  
}
