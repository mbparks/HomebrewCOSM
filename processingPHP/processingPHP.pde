/**
 * HTTP Client. 
 * 
 * Starts a network client that connects to a server on port 80,
 * sends an HTTP 1.0 GET request, and prints the results. 
 *
 * Note that this code is not necessary for simple HTTP GET request:
 * Simply calling loadStrings("http://www.processing.org") would do
 * the same thing as (and more efficiently than) this example.
 * This example is for people who might want to do something more 
 * complicated later.
 */


import processing.net.*;
import processing.serial.*;

Serial myPort;
Client c;
String lines[];
int numRecords =  0;
int[] data;
int graphPosition = 0;
int prevGraphPosition = 0;





void setup() {
  size(800, 600);
  stroke(0, 255, 0);
  strokeWeight(5);
  background(0, 0, 0);

  println(Serial.list());
  myPort = new Serial(this, Serial.list()[0], 9600);

  textSize(30);
  text("Light Sensor Data Graph", 10, 40);

  getData();
}




void draw() {
}




void drawGraph() {
  graphPosition = 0;
  for (int i = 0 ; i < data.length; i++) {
    int lineHeight = data[i]/2;
    clearScreen();
    if (lineHeight < 100) {
      stroke(255, 0, 0);
    }
    else {
      stroke(0, 255, 0);
    }
    line(graphPosition, height, graphPosition, height - lineHeight);
    stroke(255, 255, 255);
    line(graphPosition, 110, graphPosition, 100);
    prevGraphPosition = graphPosition;
    if (graphPosition >= width) {
      graphPosition = 0;
    }
    else {
      graphPosition += 5;
    }
  }
}





void getData() {
  lines = loadStrings("http://www.YOUR-URL.COM/sensorLog.txt");
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



void clearScreen() {
  stroke(0, 0, 0);
  line(graphPosition, height, graphPosition, 100);
  line(prevGraphPosition, 110, prevGraphPosition, 100);
}





void keyPressed() {
  if (key == 'R') {
    getData();
  }
}

