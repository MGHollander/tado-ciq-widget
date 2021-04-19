# tado° CIQ widget

A [Garmin Connect IQ widget](https://developer.garmin.com/connect-iq/overview/)
to display information from your tado° smart thermostat on your Garmin
device.

![tado CIQ widget example 1](assets/screenshots/tado-ciq-widget-1.png "tado CIQ widget example 1") ![tado CIQ widget example 2](assets/screenshots/tado-ciq-widget-2.png "tado CIQ widget example 2")

This is still a work in progress. New features will be introduced in the future.
If you have questions, ideas or found a bug, please
[create an issue](https://github.com/MGHollander/tado-ciq-widget/issues/new/choose).

The widget depends on data from the
[tado° Connect IQ bridge](https://github.com/MGHollander/tado-ciq-bridge).
This API serves tailored made data data to make the traffic as fast as possible.

*This widget is not build by tado°.*

## Features

- An overview of the current temperature, the set temperature and the humidity
  in your zones.
- Navigate through all zones, separate from each other.
- If you have multiple homes then the widget will ask you to choose a home from
  which the zones will be displayed (it is not yet possible to change to
  another home).

## Device support

At this moment the widget is in alpha phase and only supports the Fenix 5 plus.
Support for other devices will be added  in the future.

You are free to download the source of the widget and compile it for your own
device. It is not tested (yet) on any other device then the Fenix 5 plus though.

## Installation

- Download the package for your device from the
  [releases page](https://github.com/MGHollander/tado-ciq-widget/releases).
- Connect your device to your computer using a USB cable.
- Place the package in the `Garmin/Apps` folder on your device.

## Notes

- The main screen might not display all zones. You can sort the zones in the
  Tado app.

## Development

You can add your own features if you like. If you want to extend the features of
the API, then you need to be able to access it over a global reachable secure
connection. You can use [Expose](https://beyondco.de/docs/expose/introduction)
to make your development environment available for the widget. Change the
BaseUrl in TadoApp.mc to the Expose URL to test.

## Todo

- Add support for
- Read and apply
  - Debugging (https://developer.garmin.com/connect-iq/core-topics/debugging/)
  - Unit testing (https://developer.garmin.com/connect-iq/core-topics/unit-testing/)
  - Exception Reporting Tool (https://developer.garmin.com/connect-iq/core-topics/exception-reporting-tool/)
  - Publishing to the Store (https://developer.garmin.com/connect-iq/core-topics/publishing-to-the-store/)
- Use System.error() to report errors in the production app.
- Create issues for all other todo items.
- A -2 error pops up every now and then when the device is not connected to a
  phone.
- Check code style/formatting rules.
- Update layout ids. Most have layout at the end of the id, but some don't...
- Check if all web requests use the TadoTransaction.
- Replace the hidden access modifier for protected, since hidden is just a
  synonym..
- Use the screen height to determine how many zones can be displayed on the
  screen.
- Test the 401 handling in the onReceive method of TadoTransaction. Is this
  working as expected?
- Test the error handling in the accessCodeResult method of the login
  transaction. Is this working as expected?
- Remove all debug information.
- ~Move the app code into a separate dir and move unused images from the app dir
  to a separate dir (possible in Eclipse, but not in VS code).~

## Debugging (for advanced users)

The data field contains a debug option, to set this up follow these steps:

1. Uninstall the data field
2. Install the data field and turn on the debug option in the settings
3. Connect the watch with an usb cable to your computer and browse to the folder `\GARMIN\APPS` Remember the most recent name of the PRG file
4. Browse to the folder `\GARMIN\APPS\LOGS` and create a txt file with the same name as the most recent prg file
5. After running the data field for a while the txt file should contain debug info about the weather retrieval

## Feedback

Please feel free to give feedback, share ideas or report bugs.

- [Add an issue](https://github.com/MGHollander/tado-ciq-widget/issues)
- [Post a question in the dedicated topic on the Garmin Developer forum](https://forums.garmin.com/developer/connect-iq/f/showcase/250769/widget-tado-ciq-widget)
- [Email me at marc@mghollander.nl](mailto:marc@mghollander.nl)

## Donate

I work on this widget in my free time, but you can support me by making a
donation (or buy me a beer) via <https://paypal.me/mghollander>. It will be
appreciated a lot!

## Supported devices

Support for these devices is requested.

| Device | Screen size | CIQ version | Requests | Supported |
| --- | --- | ---: | :---: | --- |
| fenix 6 pro | 260 x 260 | 3.0 | 7 | x |
| fenix 6x pro | 280 x 280 | 3.0 | 4 |  |
| Fenix 6s pro | 240 x 240 | 3.0 | 3 | x |
| fenix 5 | 240 x 240 | 3.0 | 1 | x |
| fenix 5s | 218 x 218 | 3.0 | 1 |  |
| fenix 5 plus | 240 x 240 | 3.0 | 1 | x |
| fenix 5s plus | 240 x 240 | 3.0 | 1 | x |
| forerunner 245 | 240 x 240 | 3.0 | 1 | x |
| forerunner 945 | 240 x 240 | 3.0 | 1 | x |
| fenix 3 | 218 x 218 | 1.0 | 1 |  |
| fenix 3 hr | 218 x 218 | 1.0 | 1 |  |
