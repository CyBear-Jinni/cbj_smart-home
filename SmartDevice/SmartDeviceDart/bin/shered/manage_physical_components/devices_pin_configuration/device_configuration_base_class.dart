

class DeviceConfigurationBaseClass{
  List<int> gpioList; // GPIO pins number to interact with the pin, GPIO pin can receive or output only 1 (electricity) or 0 (no electricity), those pins cannot detect in between.

//   Getters
   List<int> GetGPIOList() => gpioList;

}