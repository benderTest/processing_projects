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
  void walk()
  {
    xPos += speed;
    if (xPos > width)
    {
      xPos = 0;
    }
  }
  
}//end Turtle class

//turtle objects to use in program
Turtle leo;
Turtle don;

//setup--sets screen size and intializes Turtle objects
void setup()
{
  fullScreen();
  background(color(0, 255, 0));
  leo = new Turtle(color(0, 0, 255), 0, 100, 2);
  don = new Turtle(color(196, 0, 196), 0, 200, 1);
}

//mainloop, draws and walks turtles
void draw()
{
  leo.walk();
  leo.display();
  don.walk();
  don.display();
}
