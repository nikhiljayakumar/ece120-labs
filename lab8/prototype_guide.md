# The Interface to the Physical Vending Machine:

Refer to [this video](https://www.youtube.com/watch?v=Zk1RaK2S8PM&ab_channel=LabsECxplainEd) to learn more about this lab and the physical prototype vending machine - courtesy of the ECE Student Advancement Committee.

![Coin Sensor 1](./img/coin_sorter-1-1.jpg)

It has two optical sensors (T, CLK) and three LEDs (T, CLK, A) for visual feedback:

![Coin Sensor 2](./img/sensor_leds_mod-1-1.jpg)

![Dime Intake](./img/dime-1-1.jpg)

When a quarter is passing, the T and CLK LEDs will light to indicate that the T and CLK sensors have both detected a coin:

![Quarter Intake](./img/quarter-1-1.jpg)

Similarly, when your circuit generates output A=1, the A LED will light to indicate that the signal has been correctly received:

![Accept](./img/accept-1-1.jpg)

![Waveform](./img/waveform_lab8-1-1.PNG)

The interface to the protoboard is given by a connector (a ribbon cable):

![Ribbon Cable](./img/ribbon_connector_mod-1-1.jpg)

The connector has a total of 8 pins, but for simplicity in this lab,  we are only using 4 signals: GND, A, T and CLK. On the protoboard, you will have to wire the required signals in preparation for the connection. Make sure to leave enough space on your protoboard for the interface to the vending machine:

![Protoboard Interface](./img/proto_interface_mod-1-1.jpg)