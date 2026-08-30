---
title: Remote Print HTTP Status Proxy
description: An introduction to mslicer, the open source MSLA resin slicer.
date: 2026-08-29
---

Part of the process to upload a model to a printer with remote print (for the now legacy protocol) is to serve the sliced file on an HTTP server, then send the download link to the printer over MQTT.
Because remote print already has to run an HTTP server, this option exposes an API at `0.0.0.0:<http_port>/status`.
Unless you set defaults, each time remote print starts all server ports are randomized, their values can been seen and set in the 'Services' section of the 'Remote Print' panel.

### Scriptable Widget

Before I explain how the API works, here is a cool thing you can use it for (if you have an iPhone).
There is an app called [Scriptable](https://scriptable.app) that lets you write scripts for your phone in JavaScript.
I have already written one that shows a widget with the status of the current print job.
It needs to access the API server, so if you want to access it outside your home network, you will need to use some proxy service like ngrok.

Anyway, you can download the code for the widget from GitHub [here](https://gist.github.com/connorslade/5ee51da075fb0d7295f7a85cc774a5e0).
Just make a new script in the app, paste the code in, and then you can make a Scriptable widget, edit it, and choose the script you made.

### The API

The status route returns a JSON array of printers, each with the following format.

```json
{
  "LastUpdate": integer,
  "MachineId": string,
  "Name": string,
  "PrintInfo": {
    "CurrentLayer": integer,
    "CurrentTicks": integer,
    "ErrorNumber": integer,
    "Filename": string,
    "Status": "None" | "InitialLower" | "Lowering" | "Exposure" | "Retracting" | "Pausing" | 
              "Paused" | "Stopping" | "Stopped" | "Complete" | "FinalRetract" | "Canceled",
    "TotalLayer": integer,
    "TotalTicks": integer
  },
  "ProtocolVersion": "V1" | "V3",
  "TransferInfo": {
    "CheckOffset": integer,
    "DownloadOffset": integer,
    "FileTotalSize": integer,
    "Filename": string,
    "Status": "None" | "Done" | "Error"
  }
}
```
