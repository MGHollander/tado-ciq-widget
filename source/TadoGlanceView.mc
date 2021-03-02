using Toybox.System;
using Toybox.WatchUi;

(:glance)
class TadoGlanceView extends WatchUi.GlanceView
{
    function initialize() {
        GlanceView.initialize();
    }

    function onLayout(dc)
    {
        System.println("TadoGlanceView::onLayout");

        setLayout(Rez.Layouts.GlanceLayout(dc));
    }

    function onUpdate(dc) {
        System.println("TadoGlanceView::onUpdate");

        // Call the parent onUpdate function to redraw the layout.
        View.onUpdate(dc);
    }
}
