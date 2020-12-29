using Toybox.System;
using Toybox.WatchUi;

class TadoZoneBehaviorDelegate extends WatchUi.BehaviorDelegate
{
    protected var _view;

    function initialize(view)
    {
        BehaviorDelegate.initialize();

        _view = view;
    }

    function onSelect()
    {
        System.println("TadoZoneBehaviorDelegate::onSelect");

        var zoneView = new TadoZoneView(_view.getNextZone());
        WatchUi.switchToView(zoneView, new TadoZoneBehaviorDelegate(zoneView), WatchUi.SLIDE_DOWN);

        return false;
    }

    function onBack()
    {
        System.println("TadoZoneBehaviorDelegate::onBack");

        var mainView = new TadoMainView();
        WatchUi.switchToView(mainView, new TadoMainBehaviorDelegate(mainView), WatchUi.SLIDE_RIGHT);

        return true;
    }
}