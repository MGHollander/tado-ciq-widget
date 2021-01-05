# tado° CIQ widget

A Garmin Connect IQ widget for your tado° smart thermostat.

![tado CIQ widget example 1](assets/screenshots/tado-ciq-widget-1.png "tado CIQ widget example 1") ![tado CIQ widget example 2](assets/screenshots/tado-ciq-widget-2.png "tado CIQ widget example 2")


This widget depends on data from the [tado° Connect IQ bridge](https://github.com/MGHollander/tado-ciq-bridge). This
Laravel based API serves tailored made data data to make the traffic as fast as possible.

This is still a work in progress. New features will be introduced every now and then.

## Notes

- The main screen only shows 2 zones. You can sort the zones in the Tado app.

## Todo

- Create issues for all other todo items.
- Check if all web requests use the TadoTransaction.
- Fix the build warning "BUILD: WARNING: This is a 'widget' app type but no source code was annotated with (:glance). The entire application will be loaded as a glance process. (glance application)".
- Use System.error() to report errors in the production app.
- Replace the hidden access modifier for protected, since hidden is just a synonym..
- Use the screen height to determine how many zones can be displayed on the screen.
- Remove all debug information.
- Add unit tests (https://developer.garmin.com/connect-iq/core-topics/unit-testing/).
- Add error reporting (https://developer.garmin.com/connect-iq/core-topics/exception-reporting-tool/).
- ~Move the app code into a separate dir and move unused images from the app dir to a separate dir.~
- ~Make an API call to get all zones at once.~
- ~Clean out most of the code copied from the Strava API widget and start at the beginning for the tado widget (no code that is not needed yet).~

## Feedback 

Please feel free to give feedback, share ideas or report bugs. Email me at marc [at] mghollander [dot] nl 
or [add an issue](https://github.com/MGHollander/tado-ciq-widget/issues).

## Donate 

I work on this widget in my free time, but you can support me by making a donation (or buy me a beer) via 
https://paypal.me/mghollander
