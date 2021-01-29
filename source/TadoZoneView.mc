using Toybox.Application as App;
using Toybox.Communications as Comm;
using Toybox.System;
using Toybox.WatchUi;

class TadoZoneView extends WatchUi.View
{
    const TEMPERATURE_CELSIUS = 0;
    const TEMPERATURE_FAHRENHEIT = 1;

    protected var _arrowDown;
    protected var _arrowUp;
    protected var _currentZone;
    protected var _humidity;
    protected var _name;
    protected var _setting;
    protected var _settingText;
    protected var _temperature;
    protected var _zones;

    protected var _temperatureUnit = "celsius";

    function initialize(currentZone)
    {
        View.initialize();

        _currentZone = currentZone;

        var zones = App.getApp().getProperty("zones");
        if (zones) {
            _zones = zones;
        }

        if (System.getDeviceSettings().temperatureUnits == TEMPERATURE_FAHRENHEIT) {
            _temperatureUnit = "fahrenheit";
        }
    }

    function getNextZone()
    {
        var numberOfZones = _zones.size();
        var nextZone = _currentZone + 1;

        if (nextZone == numberOfZones ) {
            nextZone = 0;
        }

        return nextZone;
    }

    function getPreviousZone()
    {
        var previousZone = _currentZone - 1;

        if (previousZone == -1) {
            previousZone = (_zones.size() - 1);
        }

        return previousZone;
    }

    // Load your resources here
    function onLayout(dc)
    {
        setLayout(Rez.Layouts.ZoneLayout(dc));

        // Load resources.
        _humidity = View.findDrawableById("ZoneHumidity");
        _name = View.findDrawableById("ZoneName");
        _setting = View.findDrawableById("ZoneSetting");
        _temperature = View.findDrawableById("ZoneTemperature");

        _settingText = WatchUi.loadResource(Rez.Strings.ZoneSetting);
        _arrowUp = WatchUi.loadResource(Rez.Drawables.IconArrowUp);
        _arrowDown = WatchUi.loadResource(Rez.Drawables.IconArrowDown);
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow()
    {
        System.println("TadoZoneView::onShow");
    }

    // Update the view
    function onUpdate(dc)
    {
        System.println("TadoZoneView::onUpdate");

        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);

        if (_zones.size() > 0) {
            var zone = _zones[_currentZone];

            // Draw navigation arrows if there is more then one zone.
            if(_zones.size() > 1) {
                var horizontalCenter = ((dc.getWidth() / 2) - 8);
                var screenHeight = dc.getHeight();

                dc.drawBitmap(horizontalCenter, 30, _arrowUp);
                dc.drawBitmap(horizontalCenter, screenHeight - 18, _arrowDown);
            }

            _name.setText(zone["name"]);
            _humidity.setText(zone["humidity"].format("%.1f") + "%");
            _temperature.setText(zone["temperature"][_temperatureUnit].format("%.1f") + "°");
            _setting.setText(_settingText + " " + zone["temperature"]["setting"][_temperatureUnit].format("%.1f") + "°");
        }
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide()
    {
        // Free resources, but how?
    }
}
