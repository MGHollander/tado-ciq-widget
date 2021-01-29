using Toybox.Application as App;
using Toybox.Communications as Comm;
using Toybox.System;
using Toybox.WatchUi;

class TadoMainView extends WatchUi.View
{
    const TEMPERATURE_CELSIUS = 0;
    const TEMPERATURE_FAHRENHEIT = 1;

    protected var _zones;
    protected var _temperatureUnit = "celsius";

    function initialize()
    {
        System.println("TadoMainView::initialize");

        View.initialize();

        if (System.getDeviceSettings().temperatureUnits == TEMPERATURE_FAHRENHEIT) {
            _temperatureUnit = "fahrenheit";
        }

        var zones = App.getApp().getProperty("zones");
        if (zones) {
            _zones = zones;
        }
    }

    function onLayout(dc)
    {
        System.println("TadoMainView::onLayout");

        setLayout(Rez.Layouts.MainLayoutLoading(dc));
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow()
    {
        System.println("TadoMainView::onShow");

        var homeId = App.getApp().getProperty("home_id");

        if (homeId == null) {
            WatchUi.pushView(new TadoHomesView(), null, WatchUi.SLIDE_IMMEDIATE);
        }
        else if (_zones == null) {
            var transaction = new TadoMainTransaction(self);
            transaction.go();
        }
    }

    function setZones(zones)
    {
        System.println("TadoMainView::setZones");

        _zones = zones;

        WatchUi.requestUpdate();
    }

    function getZones()
    {
        System.println("TadoMainView::getZones");

        return _zones;
    }

    function onUpdate(dc)
    {
        System.println("TadoMainView::onUpdate");

        // We need to update the layout before we start to draw the zones.
        if (_zones) {
            var numberOfZones = _zones.size();

            // There is no display that suppots more then
            if (numberOfZones > 3) {
                numberOfZones = 3;
            }

            switch (numberOfZones) {
                case 0:
                    setLayout(Rez.Layouts.MainLayoutNoZones(dc));
                    System.println("MainLayoutNoZones");
                    break;

                case 1:
                    setLayout(Rez.Layouts.MainOneZoneLayout(dc));
                    System.println("MainOneZoneLayout");
                    break;

                case 2:
                    setLayout(Rez.Layouts.MainTwoZonesLayout(dc));
                    System.println("MainTwoZonesLayout");
                    break;

                case 3:
                    setLayout(Rez.Layouts.MainThreeZonesLayout(dc));
                    System.println("MainThreeZonesLayout");
                    break;
            }

            System.println("_zones = " + _zones);

            for (var i = 0; i < numberOfZones; i++) {
                var name = _zones[i]["name"];
                var temprature = _zones[i]["temperature"][_temperatureUnit].format("%.1f") + "°";
                var setting = _zones[i]["temperature"]["setting"][_temperatureUnit].format("%.1f") + "°";
                var humidity = _zones[i]["humidity"].format("%.1f") + "%";

                var nameDrawable = View.findDrawableById("MainZone" + numberOfZones + "Name" + i);
                if (nameDrawable) {
                    nameDrawable.setText(name);
                }

                var temperatureDrawable = View.findDrawableById("MainZone" + numberOfZones + "Temperature" + i);
                if (temperatureDrawable) {
                    temperatureDrawable.setText(temprature);
                }

                var settingDrawable = View.findDrawableById("MainZone" + numberOfZones + "Setting" + i);
                if (settingDrawable) {
                    settingDrawable.setText(setting);
                }

                var humidityDrawable = View.findDrawableById("MainZone" + numberOfZones + "Humidity" + i);
                if (humidityDrawable) {
                    humidityDrawable.setText(humidity);
                }
            }
        }

        // Call the parent onUpdate function to redraw the layout.
        View.onUpdate(dc);
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide()
    {
        // Free resources, but how?
    }
}
