import processing.sound.*;

FFT faFoT;
AudioIn in;
Amplitude amp;
int bands = 32;
float[] spectrum = new float[bands];

void setup()
{
  //size(512, 360);
  fullScreen();
  background(255);
  frameRate(16);
  
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
  background(shade, shade, shade);
  faFoT.analyze(spectrum);
  strokeWeight(4);
  int interval = (int) (width / bands);
  //for loop to iterate over all values in spectrum
  for(int i = 0; i < bands; i++)
  {
    //the result of the fft is normalized
    //draw the line for each frequency band i, scaling up by 5
    line(interval * i, height / 2, interval * i, (height / 2) - spectrum[i] * height * 2);
    line(interval * i, height / 2, interval * i, (height / 2) + spectrum[i] * height * 2);
  }
}
