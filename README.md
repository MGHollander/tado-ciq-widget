# tado° CIQ widget

A Garmin Connect IQ widget for your tado° smart thermostat.


## Todo

- ~Clean out most of the code copied from the Strava API widget and start at the beginning for the tado widget (no code that is not needed yet).~
- Make an API call to get all zones at once

## How to get data

- Build an oAuth API that serves as a bridge between the widget and tado. (best option, I guess)
- Build a simple API and a service to register on it via the browser. Then create an API token (and secret?) for the user to save in the settings. (a lot of hussle for users).
- Connect to tado directly
  - Via a self made login? (a good option)
  - By adding your username and password as settings... (not sure if this is safe)