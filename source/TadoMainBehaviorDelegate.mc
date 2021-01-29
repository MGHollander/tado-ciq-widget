using Toybox.System;
using Toybox.WatchUi;

class TadoMainBehaviorDelegate extends WatchUi.BehaviorDelegate
{
    protected var _view;

    function initialize(view)
    {
        BehaviorDelegate.initialize();

        _view = view;
    }

    function onSelect()
    {
        System.println("TadoMainBehaviorDelegate::onSelect");

        var zones = _view.getZones();
        if (zones.size() > 1) {
            var zoneView = new TadoZoneView(0);
            WatchUi.pushView(zoneView, new TadoZoneBehaviorDelegate(zoneView), WatchUi.SLIDE_LEFT);
        }

        return false;
    }
}
