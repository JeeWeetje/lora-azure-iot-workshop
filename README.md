# From device to actionable insights with LoRa and the Azure IoT platform

## LoRa - Azure IoT Hands-on Lab / Workshop

In this hands-on lab you will be creating the complete chain from configuring, to bridging the gap between the connectivity providers clouds and the Microsoft Azure IoT platform, creating actionable insights on the Microsoft Azure IoT platform and sending commands all the way back to the device.
This includes assembling hardware, configuring hardware and software and coding the missing logic to a complete IoT solution.
The workshop will simulate a remote located machine malfunctioning and getting restarted based on the received telemetry and created insights based on the telemetry data.
You will be creating all components to get the malfunctioning machine back up running again.
All of that within 2-4 hours (2 hours is minimum).

Technologies used during the hands-on lab;

* Arduino development boards The Things Uno (LoRa enabled Arduino Leonardo)
* Software emulated devices/sensors (in Java, NodeJS or C# (UWP))
* Sensors (button and LED light bar)
* LoRa & Lora WAN
* The Things Network cloud
* Microsoft Azure IoT Platform (including Azure Web Jobs, Azure IoT Hub, Azure Stream analytics, Azure Event hub, Azure blob storage and Azure Functions)

The hands-on lab is created in conjunction with [Atos](https://atos.net) and [Microsoft Nederland](https://www.microsoft.com/nl-nl/).

**Hardware used will *remain property* of Atos and Microsoft.**

## Team of experts

During the workshop the following experts can guide you through the workshop:

* Jan Willem Groenenberg; Atos Senior Expert, IoT Integration Architect, Azure Advisory Board member [![Twitter](img/social/twitter.png)](https://twitter.com/jeeweetje) [![LinkedIn](img/social/linkedin.png)](https://www.linkedin.com/in/jwgroenenberg/) [![LinkedIn](img/social/wordpress.png)](https://jeeweetje.net)

* Sander van de Velde; MVP, IoT Platform Architect, Azure Advisory Board member [![Twitter](img/social/twitter.png)](https://twitter.com/svelde) [![LinkedIn](img/social/linkedin.png)](https://www.linkedin.com/in/sandervandevelde/) [![LinkedIn](img/social/wordpress.png)](https://blog.vandevelde-online.com)

* Hans Boksem, IoT Integration Architect, Atos Senior Expert [![Twitter](img/social/twitter.png)](https://twitter.com/bokse001) [![LinkedIn](img/social/linkedin.png)](https://www.linkedin.com/in/hansboksem/) [![LinkedIn](img/social/wordpress.png)](https://hansboksem.wordpress.com/)

## Workshop/Hands-on locations and dates

These are the places where this workshop is given

<table border="1">
<thead>
<tr><th>Name</th><th>location</th><th>Date</th><th># of attendees</th></tr>
<thead>
<tbody>
<tr><td>Microsoft Tech Days 2016</td><td>Amsterdam, The Netherlands</td><td>October 4, 2016</td><td>19</td></tr>
<tr><td>Microsoft Tech Days 2016</td><td>Amsterdam, The Netherlands</td><td>October 4, 2016</td><td>16</td></tr>
<tr><td>Microsoft Tech Days 2016</td><td>Amsterdam, The Netherlands</td><td>October 5, 2016</td><td>12</td></tr>
<tr><td>Microsoft Tech Days 2016</td><td>Amsterdam, The Netherlands</td><td>October 5, 2016</td><td>15</td></tr>
<tr><td>dotNed Saturday 2017</td><td>Veenendaal, The Netherlands</td><td>Januari 28, 2017</td><td>15</td></tr>
<tr><td>Atos Innovatos 2017</td><td>Amstelveen, The Netherlands</td><td>March 14, 2017</td><td>8</td></tr>
<tr><td>Atos Innovatos 2017</td><td>Groningen, The Netherlands</td><td>March 21, 2017</td><td>9</td></tr>
<tr><td>Atos Innovatos 2017</td><td>Eindhoven, The Netherlands</td><td>March 28, 2017</td><td>13</td></tr>
<tr><td>IoT Tech Day 2017</td><td>Utrecht, The Netherlands</td><td>April 19, 2017</td><td>22</td></tr>
<tr><td>Global Azure Bootcamp 2017</td><td>Amstelveen, The Netherlands</td><td>April 22, 2017</td><td>12</td></tr>
<tr><td>Microsoft Tech Days 2017</td><td>Amsterdam, The Netherlands</td><td>October 12, 2017</td><td>14</td></tr>
<tr><td>Codecamp 2017</td><td>Iasi, Romania</td><td>October 27, 2017</td><td>20</td></tr>
<tr><td>LoRa IoT network</td><td>Apeldoorn, The Netherlands</td><td>April 7, 2018</td><td>20</td></tr>
<tr><td>Global Azure Bootcamp 2018</td><td>Amstelveen, The Netherlands</td><td>April 21, 2018</td><td>10</td></tr>
<tr><td>TEQnation 2018</td><td>Utrecht, The Netherlands</td><td>April 26, 2018</td><td>20</td></tr>
<tr><td>Hogeschool Rotterdam</td><td>Rotterdam, The Netherlands</td><td>September 5, 2018</td><td>20</td></tr>
<tr><td>IoT Masterclass</td><td>Amersfoort, The Netherlands</td><td>February 14, 2019</td><td>12</td></tr>
<tr><td>Hogeschool Rotterdam</td><td>Rotterdam, The Netherlands</td><td>September 3, 2019</td><td>??</td></tr>
</tbody>
</table>

## Let's dive into the workshop

The workshop consists of several chapters. The first two chapters will guide you through the essentials we want you to get your hands on. The other chapters are optional/extra if you have time left.

You have three options to choose from to start with. You can either go for physical hardware based on the The Things Uno (Lora/LoraWAN enabled Arduino Leonardo) programmed in C and connected via The Things Network. Or choose one of the device simulation applications like UWP (C#) or NodeJS (JavaScript).

* Click on one of the logos to get started with the device or simulated device and follow that path for the rest of the workshop (at the end of each chapter, a link to the following chapter is provided *

1. **Connecting a device to the Azure IoT Platform**

    <table border="1">
        <thead>
        <tr>
            <th colspan="3">Choose the device or simulator to connect to Azure IoT  </th>
        </tr>
        <thead>
        <tbody>
        <tr>
            <td align="center">
                <a href="TheThingsNetwork.md"><img src="img/Options/arduino.png" alt="Getting started with the The Things Uno device and The Things Network" /></a>
            </td>
            <td align="center">
                <a href="UwpToIotHub.md"><img src="img/Options/windows.png" alt="Connecting to an IoT Hub using a UWP app device simulation" /></a>
            </td>
            <td align="center">
                <a href="NodeJsToIotHub.md"><img src="img/Options/nodejs.png" alt="Connecting to an IoT Hub using a NodeJs (JavaScript) app device simulation" /></a>
            </td>
        </tr>
        </tbody>
    </table>

2. **Receiving and handling telemetry in Azure**

    <table border="1">
        <thead>
        <tr>
            <th colspan="3">Choose the device or simulator to receive telemetry from</th>
        </tr>
        <thead>
        <tbody>
        <tr>
            <td align="center">
                <a href="AzureTTN.md"><img src="img/Options/arduino.png" alt="Receiving and handling telemetry in Azure, sent by a TheThingsUno" /></a>
            </td>
            <td align="center">
                <a href="AzureUWP.md"><img src="img/Options/windows.png" alt="Receiving and handling telemetry in Azure, sent by a UWP app device simulation" /></a>
            </td>
            <td align="center">
                <a href="AzureNodeJs.md"><img src="img/Options/nodejs.png" alt="Receiving and handling telemetry in Azure, sent by a NodeJs (JavaScript) app device simulation" /></a>
            </td>            
        </tr>
        </tbody>
    </table>

3. **Passing commands back to actual devices or simulated devices**

    <table border="1">
        <thead>
        <tr>
            <th colspan="3">Choose the device or simulator to pass commands back to </th>
        </tr>
        <thead>
        <tbody>
        <tr>
            <td align="center">
                <a href="CommandsTTN.md"><img src="img/Options/arduino.png" alt="Passing commands back to a The Things Uno device" /></a>
            </td>
            <td align="center">
                <a href="CommandsUwp.md"><img src="img/Options/windows.png" alt="Passing commands back to a UWP app device simulation" /></a>
            </td>
            <td align="center">
                <a href="CommandsNodeJs.md"><img src="img/Options/nodejs.png" alt="Passing commands back to a NodeJs (JavaScript) app device simulation" /></a>
            </td>            
        </tr>
        </tbody>
    </table>

    
4. **Bonus chapter**
   * [Deploying The Things Network Bridge to Azure as a WebJob](Webjob.md)

![](img/logos/microsoft.jpg) ![](img/logos/atos.png)
