import processing.sound.*;

FFT faFoT;
AudioIn in;
Amplitude amp;
int bands = 128;
int realBands = bands / 4;
float[] spectrum = new float[bands];
float centerX;
float centerY;
float angle;

void setup()
{
  //size(512, 360);
  fullScreen();
  background(0);
  frameRate(16);
  
  centerX = width / 2.0;
  centerY = height / 2.0;
  angle = 0.0;
  
  //create new input stream which is routed to amp analyzer
  faFoT = new FFT(this, bands);
  amp = new Amplitude(this);
  in = new AudioIn(this, 0);
  
  //start the audio in
  in.start();
  
  //patch audio in to fft
  faFoT.input(in);
  amp.input(in);
}

void draw()
{
  int shade = (int)(amp.analyze() * 255);
  
  //background(shade);
  
  //background(255);
  faFoT.analyze(spectrum);
  strokeWeight(2);
  stroke(255 - shade);
  float segment = TAU / realBands;
  //angle = 0; //resets angle back to zero for each frame
  //for loop to iterate over all values in spectrum
  for(int i = 0; i < realBands; i++)
  {
    //draw fft spectrum radiating from center of screen
    line(centerX, centerY, height * (cos(angle + i * segment) * spectrum[i]) + centerX, 
                            height * (sin(angle + i * segment) * spectrum[i]) + centerY);
  }
  angle += segment;
  if (angle > TAU)
    angle = 0;
  //println(angle);
  
  fill(shade, 32);
  rect(128, 128, width - 256, height - 256);
}
