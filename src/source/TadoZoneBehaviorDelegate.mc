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

    function nextZone()
    {
        var zoneView = new TadoZoneView(_view.getNextZone());
        WatchUi.switchToView(zoneView, new TadoZoneBehaviorDelegate(zoneView), WatchUi.SLIDE_UP);
    }

    function previousZone()
    {
        var zoneView = new TadoZoneView(_view.getPreviousZone());
        WatchUi.switchToView(zoneView, new TadoZoneBehaviorDelegate(zoneView), WatchUi.SLIDE_DOWN);
    }

    function onSelect()
    {
        System.println("TadoZoneBehaviorDelegate::onSelect");

        nextZone();

        return true;
    }

    function onNextPage()
    {
        System.println("TadoZoneBehaviorDelegate::onNextPage");

        nextZone();

        return true;
    }

    function onPreviousPage()
    {
        System.println("TadoZoneBehaviorDelegate::onPreviousPage");

        previousZone();

        return true;
    }

    function onBack()
    {
        System.println("TadoZoneBehaviorDelegate::onBack");

        WatchUi.popView(WatchUi.SLIDE_RIGHT);

        return true;
    }
}