import processing.net.*;
import processing.serial.*;

Serial myPort;
Client c;
String lines[];
int numRecords =  0;
int[] data;
int graphPosition = 0;



void setup() {
  size(800, 600);
  stroke(0, 255, 0);
  strokeWeight(5);
  background(0, 0, 0);

  println(Serial.list());
  myPort = new Serial(this, Serial.list()[0], 9600);

  getData();
}


void draw() {
}


void drawGraph() {
  graphPosition = 0;
  for (int i = 0 ; i < data.length; i++) {
    int lineHeight = data[i]/2;
    line(graphPosition, height, graphPosition, height - lineHeight);
    if (graphPosition >= width) {
      graphPosition = 0;
    }
    else {
      graphPosition += 5;
    }
  }
}



void getData() {
  lines = loadStrings("http://www.your-url.com/sensorLog.txt");
  numRecords = lines.length;
  data = new int[numRecords];

  //println("there are " + numRecords + " lines");

  for (int i = 0 ; i < lines.length; i++) {
    //println(lines[i]);
    String[] temp = split(lines[i], ": ");
    data[i] = int(temp[1]);
    println(data[i]);
    drawGraph();
  }
}




void keyPressed() {
  if (key == 'R') {
    getData();
  }
}

