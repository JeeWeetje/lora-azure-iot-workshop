# From device to actionable insights with LoRa and the Azure IoT platform

## Connecting to an IoT Hub using a NodeJs app device simulation

![](img/NodeJsToIotHub/Picture00-NodeJs-overview.png)

This is an example integration between a NodeJs app and Azure IoT Hub. This integration shows features like creating devices in the Azure IoT Hub device registry as well as sending telemetry to the IoT Hub.

*Note: In this workshop, we will create uniquely named Azure resources. The suggested names could be reserved already. Just try another unique name.*

*Note: The IoT Hub also offers the ability to send commands back to devices. This will be demonstrated after this labs.*

### Prerequisites

1. A Windows 7+ or Linux or Mac computer with internet access

2. Some text editor like [Visual Code](https://code.visualstudio.com/)

3. [Node.js](https://nodejs.org/en/) installed. _(We prefer Version 8)_

4. Azure account [create here](https://azure.microsoft.com/en-us/free/) _([Azure passes](https://www.microsoftazurepass.com/howto) will be present for those who have no Azure account (please check your email for final confirmation))_

5. [Device Explorer](https://github.com/Azure/azure-iot-sdks/releases). _(Locate the download link for the SetupDeviceExplorer.msi installer. Download and run the installer)_

### Steps to perform in this part of the workshop

At the end of this part of the workshop, the following steps are performed

1. Creating an IoT Hub in the Azure Portal

2. Creating a new NodeJs app

3. Generate and send dummy telemetry

4. Monitoring the arrival of the telemetry in Azure

5. Conclusion

## Creating an Azure IoT Hub in the Azure portal

![](img/NodeJsToIotHub/Picture01-NodeJs-overview.png)

Follow these steps to create an Azure IoT Hub.

1. **Log into** the [Azure portal](https://portal.azure.com/). You will be asked to provide Azure credentials if needed

2. On the left, a number of common Azure services are shown. Select **All Services** to open a list with all available services

    ![](img/TheThingsNetwork/all-services.png)

3. Filter it with **IoT Hub**

    ![](img/NodeJsToIotHub/azure-search-iot-hub.png)

4. Select **IoT Hub** and a new blade will be shown. Select **Add** and you will be asked to enter the information needed to create an IoT Hub

    ![](img/NodeJsToIotHub/azure-portal-add.png)

5. Enter a unique Resource Group eg. **IoTWorkshop-rg**. A green sign will be shown if the name is unique

6. Select **West Europe** for the location, if needed

7. Enter a unique IoT Hub name eg. **IoTWorkshop-ih**. A green sign will be shown if the name is unique

    ![](img/NodeJsToIotHub/NewIoTHub1.png)
    
8. Press `Next: Size and scale`
    
    ![](img/NodeJsToIotHub/NewIoTHub2.png)

9. Press `Review + create` and check your input. Press **Create** and the portal will start creating the service. Once it is created, a notification is shown. In the right upper corner, a bell represents the list of all notifications shown

    ![](img/NodeJsToIotHub/azure-notifications-iothub.png)

Creating an IoT Hub takes some time. Meanwhile, we will start with the app which will connect to the IoT Hub later on.

### Connect to the IoT Hub and register the app like a device

![](img/NodeJsToIotHub/Picture02-NodeJs-overview.png)

All devices that use an IoT hub must be individually registered, and use their own 'endpoint' and shared access key to access the hub. So we have full control over all connected devices and the telemetry coming in. In this exercise, you will register a client device.

### Get the Connection String for the IoT Hub

To register a client device, you must run a script that uses a connection with sufficient permissions to access the hub registry. In this case, you will use the built-in iothubowner shared access policy to accomplish this.

1. **Check** the Azure portal. The resource group and the IoT Hub should be created by now (otherwise, we were unable to send duty cycles information to it)

    ![](img/UwpToIotHub/azure-notifications-iothub.png)

2. On the left, select **Resource groups**. A list of resource groups is shown

    ![](img/UwpToIotHub/azure-resource-groups.png)

3. Select the resource group **IoTWorkshop-rg**. It will open a new blade with all resources in this group

4. Select the IoT Hub **IoTWorkshop-ih**. It will open a new blade with the IoT Hub

    ![](img/UwpToIotHub/azure-iot-hub-initial.png)

5. The IoTHub has not received any messages yet. Check the general settings for **Shared access policies**

    ![](img/UwpToIotHub/azure-iot-hub-share-access-policy.png)

6. Navigate to the 'iothubowner' policy and **write down** this **Connection String-Primary Key**

    ![](img/UwpToIotHub/azure-iothubowner-policy.png)

This is the secret from the IoT Hub, needed to connect our NodeJs client and monitor it later on

*Note: For more information about access control for IoT hubs, see [Access control](https://azure.microsoft.com/en-us/documentation/articles/iot-hub-devguide-security/) in the "Azure IoT Hub developer guide."*

### Create a Device Identity using NodeJS app

Each device that sends data to the IoT hub must be registered with a unique identity.

1. **Create** a new "createdeviceid" folder on your system using a File explorer

2. **Open** a Node.JS console or dosbox and navigate to the createdeviceid folder using the command prompt

3. Enter the following **command**, and press RETURN to accept all the default options. This creates a package.json file for your application:

    ```javascript
    npm init
    ```

4. Enter the following **command** to install the Azure IoT Hub package:

    ```javascript
    npm install azure-iothub
    ```

5. Create a **createdeviceid.js** file in the createdeviceid folder.

6. Use a text editor to **edit** the "createdeviceid.js" file. *Note:* We recommend the usage of an editor like [VS Code](https://code.visualstudio.com/) 

7. Modify the file with the following script and set the **connStr variable** to reflect the shared access policy connection string for your IoT Hub, as shown here:

    ```javascript
    'use strict';
    var iothub = require('azure-iothub');
    var connStr = '<IOT-HUB-CONNECTION-STRING>';
    var registry = iothub.Registry.fromConnectionString(connStr);
    var device =  { deviceId: 'MachineCyclesNodeJs' };

    registry.create(device, function(err, deviceInfo, res) {
      if (err) {
        registry.get(device.deviceId, printDeviceInfo);
      }
      if (deviceInfo) {
        printDeviceInfo(err, deviceInfo, res)
      }
    });

    function printDeviceInfo(err, deviceInfo, res) {
      if (deviceInfo) {
        console.log('Device id: ' + deviceInfo.deviceId);
      }
    }
    ```

8. **Save** the script and close the file

9. In the Node.JS console window, **enter** the following command to run the script:

    ```javascript
    node createdeviceid.js
    ```

10. Do not expect a lot output. Only the text "Device id: MachineCyclesNodeJs" will be shown

11. Let's **Verify** that the script actually registers a device with the ID MachineCyclesNodeJs. Open the browser to your [Azure portal](http://portal.azure.com)

12. In the Azure portal, on the blade for your IoT Hub, **click** the **IoT Devices** tab to the left

13. A list of all registered devices of this IoTHub is shown. **Verify** that "MachineCyclesNodeJs" is listed

14. **Click** "MachineCyclesNodeJs" and view the device-specific keys and connection strings that have been generated

15. **Remember** the **connection string-primary key** for "MachineCyclesNodeJs" (copy to the clipboard). You will use this in the next exercise

We have created a registration for a device simulation. Now let's build the actual device simulation.

## Creating a new NodeJs App

![](img/NodeJsToIotHub/Picture03-NodeJs-overview.png)

Now that you have registered a client device, you can create an application that the device can use to submit data to the IoT Hub.

### Create a Client Device Application

Now that you have registered a device, it can submit data to the IoT hub.

1. **Create** a new "iotdevice" folder on your system, next to the folder in the previous excercise

2. **Open** the Node.JS console or dosbox and navigate to the iotdevice folder

3. **Enter** the following command, and press RETURN to accept all the default options. This creates a package.json file for your application:

    ```javascript
    npm init
    ```

4. Enter the following **command** to install the Azure IoT device and AMQP protocol packages:

    ```javascript
    npm install azure-iot-device azure-iot-device-amqp
    ```

5. Create an **iotdevice.js** file in the iotdevice folder. *Note:* We recommend the usage of an editor like [VS Code](https://code.visualstudio.com/) 

6. Use a text editor to **edit** the "iotdevice.js" file

7. **Modify** the JavaScript file with the following script and set the **connStr variable** to reflect the **device connection string** for the MachineCyclesNodeJs device (which you copied to the clipboard in the previous exercise), as shown here:

    ```javascript
    'use strict';

    var clientFromConnectionString = require('azure-iot-device-amqp').clientFromConnectionString;
    var Message = require('azure-iot-device').Message;
    var connStr = '<DEVICE_CONNECTION_STRING>';
    var client = clientFromConnectionString(connStr);

    function printResultFor(op) {
      return function printResult(err, res) {
        if (err) console.log(op + ' error: ' + err.toString());
        if (res) console.log(op + ' status: ' + res.constructor.name);
      };
    }

    var i = 1;
    var e = 0;
    var repaired = false;

    var connectCallback = function (err) {
      if (err) {
        console.log('Could not connect to IoT Hub: ' + err);
      } else {
        console.log('Client connected to IoT Hub');

        client.on('message', function (msg) {
          client.complete(msg, printResultFor('completed'));

          if ( msg.data[0] >= 42) {
            console.log("\x1b[33m",'Repair command received. Machine started running again');
            console.log("\x1b[0m", '------------------------------------------------------');
            e = 0;
            repaired = true;
          }
        });

        // Create a message and send it to the IoT Hub every second

        setInterval(function(){
          if (i % 5 == 0 && !repaired ) {
            e = 99;
          }
          repaired = false;

          var data = JSON.stringify({ errorCode: e, numberOfCycles: i });
          var message = new Message(data);
          console.log("Telemetry sent: " + message.getData());
          client.sendEvent(message, printResultFor('send'));

          if (e == 0) {
            i++;
          }
        }, 10000);
      }
    };

    console.log("\x1b[31m",'MACHINE CYCLE DEMO');
    console.log("\x1b[0m", '==================');

    client.open(connectCallback);
    ```

8. **Save** the script and close the file

The simulation of a machine is now written. You are ready to send telemetry.

## Generate and send dummy telemetry

![](img/NodeJsToIotHub/Picture04-NodeJs-overview.png)

Now you can run your client application to send data to the IoT hub.

1. In the Node.JS console window, enter the following **command** to run the script:

    ```javascript
    node iotdevice.js
    ```

2. **Observe** the script running as it starts to submit device readings. (don't close the running script)

    ![](img/NodeJsToIotHub/nodejs-send-telemetry.png)

Now we have sent telemetry to the IoT Hub. Let's check if it's arrived.

## Monitoring the arrival of the telemetry in Azure

![](img/NodeJsToIotHub/Picture05-NodeJs-overview.png)

We can monitor the arrival of telemetry only if we have enough rights to look into the IoT Hub. We collected the IoT Hub Policy secrets already.

### Device Explorer tool

We can check the arrival of messages in the Azure IoT Hub. This can be done using the Device Explorer tool.

### Install & run

The Device Explorer tool is a Windows-only graphical tool for managing your devices in IoT Hub.

The easiest way to install the Device Explorer tool in your environment is to download the pre-built version by clicking [Azure IoT SDKs releases](https://github.com/Azure/azure-iot-sdks/releases). _(Locate the download link for the SetupDeviceExplorer.msi installer. Download and run the installer)_

1. Start the **Device Explorer** from the desktop or using the start menu

2. On the Configuration Tab, insert the IoT Hub **Connection String**. Leave the **Protocol Gateway Hostname** empty

3. Press **Update**

4. On the Management tab, your **device** should already be available. It was **registered** by the bridge the very first time, telemetry arrived

    ![](img/NodeJsToIotHub/deviceexplorerJS.png)

5. On the Data tab, Select your **Device ID** (like 'MachineCyclesNodeJs') and press **Monitor**

6. Now we **check the leds** on the device for Sending cycle updates a couple of times. This will result in the following messages while Duty Cycle telemetry is sent by the device

    ```cmd/sh
    Receiving events...MachineCyclesNodeJs
    1/5/2017 9:46:18 PM> Device: [MachineCyclesNodeJs], Data:[{"errorCode":0,"numberOfCycles":1}]
    1/5/2017 9:46:19 PM> Device: [MachineCyclesNodeJs], Data:[{"errorCode":0,"numberOfCycles":2}]
    1/5/2017 9:46:20 PM> Device: [MachineCyclesNodeJs], Data:[{"errorCode":0,"numberOfCycles":3}]
    ```

The cycle information is arriving.

## Conclusion

These messages shown during the monitoring step are now available in Azure, and kept in the IotHub until other resources are asking for telemetry...

Next Step: You are now ready to process your data in an Azure Function. Continue to [Receiving and handling telemetry in Azure](AzureNodeJs.md)

![](img/logos/microsoft.jpg) ![](img/logos/atos.png)
