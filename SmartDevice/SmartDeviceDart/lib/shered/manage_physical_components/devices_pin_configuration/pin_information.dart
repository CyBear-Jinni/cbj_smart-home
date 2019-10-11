//  This class will save all the information that we have about pin

class PinInformation {
  bool isInUse = false; //  Save the state of the pin, used or free to be taken
  String category; //  Category/spec of the pins, Examples: GPIO, USB/Audio/IR, Audio, Debug Port（UART0）
  String name; //  Name from the site, Examples: VDD_5V, SYS_3.3V, GND, SCL, SDA, CS, GPIOL11/IR-RX, DEBUG_RX(UART_RXD0)/GPIOA5/PWM0
  String gpioValue; // The gpio value, Examples: 5V, 3V3, GND, IRRX, RXD, TXD
  String mode; //  Examples: IN, OUT, OFF, ALT5
  String model; //  Examples:  RTL8188CUS/8188EU 802.11n WLAN Adapter, RT2070 Wireless Adapter, mi WiFi mt7601
  String description; //  Examples: 5V Power Out, USB1 DP Signal, GPIOL11 or IR Receive, I2S/PCM Serial Data Input
  int gpioColumn; //  Gpio column, Examples: 1, 2
  int index; //  Examples: 1, 2, 3, 4
  int v; //  Can be 0 or 1
  int ph; //  Examples: 25, 26
  int bcmOrLinuxGpio; //  Examples: 12, 11, 203
  int wPi; //  Pin configuration in the library WiringNP, Examples: 8, 9, 7
  int pinAndPhysicalPinConfiguration; //  Examples: 3, 5, 7
  double onDuration; //  Value of -1 is on forever

  PinInformation({
    this.isInUse,
      this.category,
      this.name,
      this.gpioValue,
      this.mode,
      this.model,
      this.description,
      this.gpioColumn,
      this.index,
      this.v,
      this.ph,
      this.bcmOrLinuxGpio,
      this.wPi,
      this.pinAndPhysicalPinConfiguration}) {
    this.isInUse = this.isInUse == null ? false : this.isInUse;
    onDuration = 0;
  }
}
