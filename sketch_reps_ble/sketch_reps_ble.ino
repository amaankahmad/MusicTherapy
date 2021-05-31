#include "MPU9250.h"
#include <SoftwareSerial.h>
SoftwareSerial mySerial(14,15);

// an MPU9250 object with the MPU-9250 sensor on I2C bus 0 with address 0x68
MPU9250 IMU(Wire,0x68);
int status;

  double GY1;
  double GY2;
  int counter=0;

void setup() {
  // serial to display data
  Serial.begin(115200);
  mySerial.begin(9600);
  counter=0;
  while(!Serial) {}

  counter=0;

  // start communication with IMU 
  status = IMU.begin();
  if (status < 0) {
    Serial.println("IMU initialization unsuccessful");
    Serial.println("Check IMU wiring or try cycling power");
    Serial.print("Status: ");
    Serial.println(status);
    while(1) {}
  }
}

void loop() 
{
  
  // read the sensor
  IMU.readSensor();
  // display the data
  Serial.print("AccelX: ");
  Serial.print(IMU.getAccelX_mss(),6);
  Serial.print("  ");
  Serial.print("AccelY: ");  
  Serial.print(IMU.getAccelY_mss(),6);
  Serial.print("  ");
  Serial.print("AccelZ: ");  
  Serial.println(IMU.getAccelZ_mss(),6);
  
  Serial.print("GyroX: ");
  Serial.print(IMU.getGyroX_rads(),6);
  Serial.print("  ");
  Serial.print("GyroY: ");  
  Serial.print(IMU.getGyroY_rads(),6);
  
  GY2 = GY1;
  GY1 = (IMU.getGyroY_rads());
  Serial.print("  ");
  Serial.print("GY12: ");
  Serial.print("  ");
  Serial.print(GY1*GY2);

  if (GY1*GY2 < 0 && abs(GY1-GY2)>1)
  {
    counter ++;
  }
  
  Serial.print("  ");
  Serial.print("reps: ");
  Serial.print(counter/2);
  mySerial.write(counter/2);
  
  
  Serial.print("  ");
  Serial.print("GyroZ: ");  
  Serial.println(IMU.getGyroZ_rads(),6);

  Serial.print("MagX: ");  
  Serial.print(IMU.getMagX_uT(),6);
  Serial.print("  ");  
  Serial.print("MagY: ");
  Serial.print(IMU.getMagY_uT(),6);
  Serial.print("  ");
  Serial.print("MagZ: ");  
  Serial.println(IMU.getMagZ_uT(),6);
  
  Serial.print("Temperature in C: ");
  Serial.println(IMU.getTemperature_C(),6);
  Serial.println();
  delay(200);
} 
