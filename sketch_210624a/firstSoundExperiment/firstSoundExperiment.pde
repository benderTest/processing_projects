import processing.sound.*;

//turtle class
class Turtle
{
  color c;
  float xPos;
  float yPos;
  float speed;
  
  //parameterized constructor for Turtle class, takes color, position coords, and speed
  //as parameters
  Turtle(color cIn, float xIn, float yIn, float speedIn)
  {
    c = cIn;
    xPos = xIn;
    yPos = yIn;
    speed = speedIn;
  }
  
  //display method
  //shows current location of car
  //takes no parameters, returns void
  void display()
  {
    stroke(0);
    fill(c);
    ellipse(xPos, yPos, 20, 10);
  }
  
  //walk method
  //advances turtle along x axis, wrapping at right edge of screen
  //no parameters, returns void
  void walk(float ampIn)
  {
    xPos += speed;
    if (xPos > width)
    {
      xPos = 0;
    }
    yPos = ampIn;
  }
  
}//end Turtle class

//turtle objects to use in program
Turtle leo;
Turtle don;
Amplitude amp;
AudioIn in;
Sound s;

//setup--sets screen size and intializes Turtle objects
void setup()
{
  fullScreen();
  background(color(0, 255, 0));
  leo = new Turtle(color(0, 0, 255), 0, 100, 2);
  don = new Turtle(color(196, 0, 196), 0, 5000, 1);
  
  //sound properties
  Sound.list();
  
  //create a new sound object and assign third audio device
  s = new Sound(this, 48000, 0, 4, 1.0);
  s.inputDevice(2);
  
  //print(s.sampleRate());
  
  //now get first audio channel from that device
  amp = new Amplitude(this);
  in = new AudioIn(this, 0);
  in.start();
  amp.input(in);
}

//mainloop, draws and walks turtles
void draw()
{
  leo.walk(100);
  leo.display();
  don.walk(1000 * amp.analyze());
  don.display();
}
