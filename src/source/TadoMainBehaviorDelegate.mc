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

    // Detect Menu behavior
    function onSelect()
    {
        System.println("TadoMainBehaviorDelegate::onSelect");

        WatchUi.switchToView(new TadoZoneView(), null, WatchUi.SLIDE_LEFT);

        return false; // allow InputDelegate function to be called
    }
}