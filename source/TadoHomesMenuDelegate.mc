using Toybox.Application as App;
using Toybox.System;
using Toybox.WatchUi;

class TadoHomesMenuDelegate extends WatchUi.Menu2InputDelegate
{
    function initialize()
    {
        Menu2InputDelegate.initialize();
    }

    function onSelect(item)
    {
        var id = item.getId();

        System.println("TadoHomesMenuDelegate::onSelect");
        System.println("item.getId(): " + id);

        selectHome(id);

        return true;
    }

    // Block the back button handling
    function onBack()
    {
        System.println("TadoHomesMenuDelegate::onBack");

        return true;
    }

    function selectHome(id)
    {
        System.println("TadoHomesMenuDelegate::onSelect");

        App.getApp().setProperty("home_id", id);

        WatchUi.popView(WatchUi.SLIDE_UP);
    }

}