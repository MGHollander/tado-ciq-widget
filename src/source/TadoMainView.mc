using Toybox.Application as App;
using Toybox.Communications as Comm;
using Toybox.System;
using Toybox.WatchUi;

class TadoMainView extends WatchUi.View
{
    const TEMPERATURE_CELSIUS = 0;
    const TEMPERATURE_FAHRENHEIT = 1;

    protected var _fontHeight;
    protected var _iconTemperature;
    protected var _iconHumidity;
    protected var _loading;
    protected var _more1;
    protected var _more2;
    protected var _moreText1;
    protected var _moreText2;
    protected var _screenWidth;
    protected var _zones;

    // The y-ax on which the drawing of the zones start.
    protected var _y = 70;

    protected var _font = Graphics.FONT_TINY;
    protected var _temperatureUnit = "celsius";

    function initialize()
    {
        View.initialize();

        if (System.getDeviceSettings().temperatureUnits == TEMPERATURE_FAHRENHEIT) {
            _temperatureUnit = "fahrenheit";
        }
    }

    function onLayout(dc)
    {
        setLayout(Rez.Layouts.MainLayout(dc));

        // Load resources.
        _loading = View.findDrawableById("MainLayoutLoading");
        _more1 = View.findDrawableById("MainLayoutMore1");
        _more2 = View.findDrawableById("MainLayoutMore2");

        _iconTemperature = WatchUi.loadResource(Rez.Drawables.IconTemperature);
        _iconHumidity = WatchUi.loadResource(Rez.Drawables.IconHumidity);
        _moreText1 = WatchUi.loadResource(Rez.Strings.MoreString1);
        _moreText2 = WatchUi.loadResource(Rez.Strings.MoreString2);
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
        else {
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
            // Remove the loading text.
            _loading.setText("");

            // Set more text.
            _more1.setText(_moreText1);
            _more2.setText(_moreText2);
        }

        // Call the parent onUpdate function to redraw the layout.
        View.onUpdate(dc);

        if (_zones) {
            dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);

            // Get variables for the drawing context
            var screenWidth = dc.getWidth();
            var fontHeight = dc.getFontHeight(_font);

            var zonesToDisplay = _zones.size();

            // Only two zones fit on the watch screen.
            if (zonesToDisplay > 2) {
                zonesToDisplay = 2;
            }

            // Draw the zones.
            for (var i = 0; i < zonesToDisplay; i++) {
                var zone = _zones[i];

                // Draw the zone name.
                dc.drawText((screenWidth / 2), _y, _font, zone["name"], Graphics.TEXT_JUSTIFY_CENTER);

                // Add font height to y for the y possition of a new line.
                _y = (_y + fontHeight);

                // Round the tempretures and humidity to 1 decimal.
                var textTemprature = zone["temperature"][_temperatureUnit].format("%.1f")
                    + "/" + zone["temperature"]["setting"][_temperatureUnit].format("%.1f");
                var textHumidity = zone["humidity"].format("%.1f") + "%";

                // Draw the current temperature and the set temparature.
                dc.drawBitmap(20, _y, _iconTemperature);
                dc.drawText(45, _y, Graphics.FONT_XTINY, textTemprature, Graphics.TEXT_JUSTIFY_LEFT);

                // Draw the humidity.
                dc.drawBitmap(140, _y, _iconHumidity);
                dc.drawText(165, _y, Graphics.FONT_XTINY, textHumidity, Graphics.TEXT_JUSTIFY_LEFT);

                _y = (_y + 5);

                dc.drawLine(0, _y + fontHeight, screenWidth, _y + fontHeight);

                // Add font height to y for the y possition of a new line.
                _y = (_y + 5 + fontHeight);
            }
        }
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide()
    {
    }
}
