using Toybox.Application as App;
using Toybox.Communications as Comm;
using Toybox.System;
using Toybox.WatchUi;

class TadoView extends WatchUi.View {

    function initialize() {
        View.initialize();
    }

    // Load your resources here
    function onLayout(dc) {
        setLayout(Rez.Layouts.MainLayout(dc));
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() {
        System.println("TadoView.mc TadoView::onShow");

        var homeId = App.getApp().getProperty("home_id");

        if (homeId == null) {
            WatchUi.pushView(new TadoHomesView(), null, WatchUi.SLIDE_DOWN);
        }

        // Gimme the zones!

    }

    // Update the view
    function onUpdate(dc) {
        System.println("TadoView.mc TadoView::onUpdate");

        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() {
    }
}
