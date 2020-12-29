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

        // Check if any zones are loaded before you can switch to a zone view.
        if (_view.getZones()) {
            var zoneView = new TadoZoneView(0);
            WatchUi.switchToView(zoneView, new TadoZoneBehaviorDelegate(zoneView), WatchUi.SLIDE_LEFT);
        }

        return false; // @todo why false?
    }
}