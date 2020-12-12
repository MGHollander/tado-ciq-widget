# tado° CIQ widget

A Garmin Connect IQ widget for your tado° smart thermostat.

## Notes

- The main screen only shows 2 zones. You can sort the zones in the Tado app.

## Todo

- Move the app code into a separate dir and move unused images from the app dir to a separate dir.
- Check if all web requests use the TadoTransaction.
- Display all zones in the main layout.
- Fix the build warning "BUILD: WARNING: This is a 'widget' app type but no source code was annotated with (:glance). The entire application will be loaded as a glance process. (glance application)".
- Use System.error() to report errors in the production app.
- Replace the hidden access modifier for protected, since hidden is just a synonym..
- Use the screen height to determine how many zones can be displayed on the screen.
- ~Make an API call to get all zones at once.~
- ~Clean out most of the code copied from the Strava API widget and start at the beginning for the tado widget (no code that is not needed yet).~

## Todo before deployment

- Update the BaseUrl to a production version of tado-ciq-bridge.