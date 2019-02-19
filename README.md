

### Instructions using esp-homekit-demo (macOS for now, to be updated w/ Linux) ###
1. Clone the esp-homekit-demo project (if that's what you use to build your sensor)
    ``` 
    git clone https://github.com/maximkulkin/esp-homekit-demo.git 
    ```

2. Go into directory & update :
    ```
    cd esp-homekit-demo
    git submodule update --init --recursive
    ```

3. Change the Wifi credentials for yours :
    ```
    cp wifi.h.sample wifi.h
    sed -i 's/mywifi/'"MY_WIFI_SSID"'/g' wifi.h
    sed -i 's/mypassword/'"MY_WIFI_PASSWORD"'/g' wifi.h
    ```

4. Build your project using this Docker image from one of the approach below :

### Just build : ###

1. Still from the source directory ./esp-homekit-demo, or change the path of volume below instead of $(pwd): 
    ```
    docker run -v $(pwd):/src --rm mach5even/esp-homekit make -C /src/examples/temperature_sensor
    ```

2. Your output binary should now be in (on your host machine) :
    - ./examples/temperature_sensor/firmware 

### Build and flash : ###

1. If you wish to flash directly from the container after build, use (assuming your USB device is /dev/tty.wchusbserial1440) :
    ```
    docker run -v $(pwd):/src --device=/dev/tty.wchusbserial1440 -e ESPPORT=/dev/tty.wchusbserial1440 --rm mach5even/esp-homekit make -C /src/examples/temperature_sensor
    ```
