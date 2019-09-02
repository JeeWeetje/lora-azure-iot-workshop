# From device to actionable insights with LoRa and the Azure IoT platform

## Passing commands back to a device

This is an example of how downlink commands are sent back to a device. In this workshop, we will send commands back to faulty devices, using an Azure Function, to start them up again.

![](img/arch/azure-telemetry-pipeline-commands-ttn.png)

This part of the workshop supports the [TTN Node](TheThingsNetwork.md).

*Note: In this workshop, we will create uniquely named Azure resources. The suggested names could be reserved already.*

### Prerequisites

1. A running TTN node connected to the TTN network and a running TTN bridge on your PC which is connected to an IoT Hub and the TTN portal

2. A combination of Azure IoT Hub, Stream Analytics job, Event Hub and Azure Function which are waiting for analyzed telemetry coming from the devices

3. Azure account [create here](https://azure.microsoft.com/en-us/free/) _(Azure passes will be present for those who have no Azure account (please check your email for final confirmation))_

### Steps to perform in this part of the workshop

At the end of this part of the workshop, the following steps are performed

1. Sending back commands for devices which are in a faulty state

2. Handle commands in the devices

## Sending back commands for devices which are in a faulty state

![](img/msft/Picture12-connect-anything-using-flow.png)

In the [previous chapter](AzureTTNcsharp.md), we passed the telemetry from the device to a Stream Analytics job. 

This job collected devices which are sending error states. 

Every two minutes, information about devices that are in a faulty state are passed to an Azure Function.

In this workshop, we will react on these devices by sending them a command to 'repair themselves'.

## Updating the C# Azure Function with sending command logic

First, we update the Azure Function. For each device which is passed on, we send a command back.

Sending commands back to devices is a specific feature of the IoT Hub. The IoT Hub can register devices and their security policies so only these devices can communicate and send telemetry. And the IoT Hub has built-in logic to send commands back to these specific devices.

1. On the left, select **Resource groups**. A list of resource groups is shown

    ![](img/azure-resource-groups.png)

2. Select the ResourceGroup **IoTWorkshop-rg**. It will open a new blade with all resources in this group

3. Select the Azure Function App **IoTWorkshop-fa**

4. To the left, the current functions are shown. Select **IoTWorkshopEventHubFunction**

    ![](img/function/azure-function-select.png)

5. The Code panel is shown. The code of the function is shown. *Note: actually, this code is saved in a file named run.scx in the Azure storage of the Function app*

6. Change the current code into

    ```csharp
    using System;
    using Microsoft.Azure.Devices;
    using System.Text;
    using Newtonsoft.Json;

    public static void Run(string myEventHubMessage, TraceWriter log)
    {
      log.Info($"Stream Analytics produced {myEventHubMessage}");

      // Connect to IoT Hub
      var connectionString = "[IOT HUB connection string]";
      var serviceClient = ServiceClient.CreateFromConnectionString(connectionString);

      // Send commands to all devices
      var messages = JsonConvert.DeserializeObject<StreamAnalyticsCommand[]>(myEventHubMessage);

      log.Info($"{messages.Length} messages arrived.");

      foreach(var message in messages)
      {
        var bytes = new byte[1];
        bytes[0] = 42; // restart the machine!
        var commandMessage = new Message(bytes);
        serviceClient.SendAsync(message.deviceid, commandMessage);

        // Log
        log.Info($"Machine restart command processed after {message.count} errors for device '{message.deviceid}'");
      }
    }

    public class StreamAnalyticsCommand
    {
      public string deviceid {get; set;}
      public int count {get; set;}
    }
    ```

7. Press the **Logs** button at the bottom to open the pane which shows some basic logging

    ![](img/azure-function-app-eventhubtrigger-logs.png)

8. A 'Logs' panel is shown. This 'Logs' panel works like a trace log.

9. If you try to *save* this code, you will notice that compilation fails. This is not that surprising: we are using certain libraries that Azure Functions has no knowledge of. Yet!

10. Press the **View Files** button to open the pane which shows a directory tree of all files.

    ![](img/commands/azure-function-app-view-files.png)

11. In the pane you can see that the file currently selected is: run.csx

    ![](img/commands/azure-function-app-view-files-pane.png)

12. Add a new file by pressing **Add**

    ![](img/commands/azure-function-app-view-files-pane-add.png)

13. Name the new file **project.json**

    ![](img/commands/azure-function-app-view-files-pane-add-file.png)

14. Press **Enter** to confirm the name of the file and an empty code editor will be shown for this file.

15. The 'project.json' file describes which Nuget packages have to be referenced. Fill the editor with the following code

    ```json
    {
      "frameworks": {
        "net46": {
          "dependencies": {
            "Microsoft.Azure.Devices": "1.18.1",
            "Newtonsoft.Json": "12.0.2"
          }
        }
      }
    }
    ```

16. Select **Save**. The changed C# code will be recompiled immediately *Note: you can press 'save and run', this will actually run the function, but an empty test will be passed (check out the 'Test' option to the right for more info)*

17. In the 'Logs' panel, just below 'Code', **verify the outcome** of the compilation

    ```cmd/sh
    2017-01-08T14:49:46.794 Packages restored.
    2017-01-08T14:49:47.113 Script for function 'IoTWorkshopEventHubFunction' changed. Reloading.
    2017-01-08T14:49:47.504 Compilation succeeded.
    ```

18. There is just one thing left to do: we have to **fill in** the Azure IoT Hub security policy **connection string**. To send commands back, we have to proof we are authorized to do this

19. In the Azure Function, replace '[IOT HUB connection string]' with your *remembered* IoT Hub **Connection String-primary key**

20. Select **Save** and recompile again succesfully

21. In order to test your function without stream analytics you can write your own test for Azure Functions. Let's write a test so we can check the code for sending a command.

22. Select **Test** in the menu to the right

    ![](img/function/azureFunctionTestSelect.png)

23. **Replace** 'TestMessage' with the following JSON array message:

    ```json
    [{"count":42,"deviceid":"MachineCyclesUwp"}]
    ```

24. Press **Run** so the Azure Function will be triggered by this test message.

25. The log output should look like this:

    ![](img/function/azure-Function-Test-Result.png)

Now, the Azure Function is ready to receive data about devices which simulate 'faulty machines'. And it can send commands back to 'repair' the 'machines'.

## Handle commands in the devices

![](img/msft/Picture05-submit-data-to-ttn.png)

Let's bring your device in a faulty state and see how the Azure IoT Platforms sends back a command to repair it.

### Handle commands in the TTN Node

In [TTN Node](TheThingsNetwork.md), we assembled a TTN node and we put a sketch (source code) on it. Here we will add more logic to the node.

1. **Go back** to the Arduino IDE and select the sketch

2. **Alter** the sketch, Add the 'ttn.onMessage(handleCommand);' in the setup function:

    ```c
    // Initializing TTN communication...
    ttn.onMessage(handleCommand); // new: Handle downlink
    ttn.personalize(devAddr, nwkSKey, appSKey);
    ```

3. Every time a message is sent to the TTN backend, the node checks for commands. When a command is received, the handleCommand function will be called

4. Add the extra function 'handleCommand' at the end of the sketch

    ```c
    void handleCommand(const byte* payload, size_t length, port_t port) {
      if (length > 0) {
        int command = payload[0];

        if (command >= 42) {
          errorCode = 0;
          bar.setLed(1,0);
          debugSerial.println("Machine repaired...");
        }
      }
    }
    ```

5. In the **Sketch** menu, click **Upload**. *Note: The sketch is uploaded and again telemetry will arrive at the TTN Portal, the TTN Azure bridge and the IoTHub*

6. **Push** the button attached to the node and **hold** it until the LED is unlit. The 'machine' is now in an 'error' state

7. **Check out** the bridge. The node is not updating the cycles anymore and error 99 is passed

    ![](img/commands/TTN-Errors-arrive.png)

8. After a few errors within two minutes (the same time frame Stream Analytics is checking), `Check out` the Azure Function. It will handle the event message.

    ```cmd/sh
    2017-01-13T14:09:17.188 Function started (Id=ed3a2175-33e6-4698-a76c-5831b2ea86a1)
    2017-01-13T14:09:17.646 Stream Analytics produced [{"count":2,"deviceid":"predictive_maintenance_machine_42"}]
    2017-01-13T14:09:17.724 1 messages arrived.
    2017-01-13T14:09:17.833 Machine restart command processed after 2 errors for predictive_maintenance_machine_42
    2017-01-13T14:09:17.833 Function completed (Success, Id=ed3a2175-33e6-4698-a76c-5831b2ea86a1)
    ```

9. **Check out** the bridge again. It will now handle the command (Downlink message) and send it to the TTN portal

    ![](img/commands/TTN-Errors-arrive-at-bridge.png)

10. **Check out** the TTN portal, the data pane. It will now handle the command (Downlink message) and send it to the device, one the first moment a new uplink message arrives

    ![](img/commands/TTN-Errors-arrive-at-ttn.png)

11. Finally, **check out** the logging of the node. The commands arrives and is handled by the function in the sketch

    ![](img/commands/TTN-Errors-arrive-at-node.png)

12. And in the end, the device will dim the red LED and lit the light of the working LED again. The 'machine' is now running again

We have now gone full circle: the machine on hold (in an error state), simulated by the TTN Node, is running again and it's updating the machine cycles number again. And again, it's running without an error state.

## Conclusion

Receiving commands from Azure completes the main part of the workshop.

We hope you did enjoy working with the Azure IoT Platform, as much as we did. Thanks for getting this far!

![](img/msft/Picture13-make-the-world-a-better-place.png)

But wait, there is still more. We added a bonus chapter to the workshop

* [Deploying the TTN C# bridge as Azure Web Job](Webjob.md)

And for more creative ideas, we can recommand to look at [hackster.io](https://www.hackster.io/). Every day, new IoT projects are added!

![](img/logos/microsoft.jpg) ![](img/logos/atos.png)
