float x, y, z;
float[][] squares;

void setup()
{
  fullScreen(P3D);
  //size(256, 256, P3D);
  x = width / 2;
  y = height / 2;
  z = 0.0;
  squares = new float[4][4];
  for(int i = 0; i < 4; i++)
  {
    for(int j = 0; i < 4; i++)
    {
      
    }
  }
}

void draw()
{
  translate(0, 0, z);
  rotateX(PI/8);
  rotateY(PI/8);
  rectMode(CENTER);
  rect(x, y, 100, 100);
  z++;
}
