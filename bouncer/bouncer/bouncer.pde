PVector location;
PVector velo;


void setup()
{
  size(512, 512);
  smooth();
  background(128);
  stroke(0);
  location = new PVector(int(random(256) + 128), int(random(256 + 128)));
  velo = new PVector(random(2, 8), random(2, 8));
}

void draw()
{
  fill(255);
  rect(128, 128, width - 256, height - 256);
  
  //add velocity to location
  location.add(velo);
  //change velocity if edge reached
  if (location.x < 128)
  {
    velo.x = random(2, 8);
  }
  if (location.x > width - 128)
  {
    velo.x = -1 * random(2, 8);
  }
  if (location.y < 128)
  {
    velo.y = random(2, 8);
  }
  if (location.y > height - 128)
  {
    velo.y = -1 * random(2, 8);
  }
  
  //place ball at new location
  fill(200, 0, 0, 128);
  ellipse(location.x, location.y, 16, 16);
  
  
}
