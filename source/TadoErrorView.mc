using Toybox.System;
using Toybox.WatchUi;


// View to handle showing the Connect to GCM message
class ErrorView extends WatchUi.View {

    hidden var _message;

    function initialize(message) {
        View.initialize();

        _message = message;
    }

    function onLayout(dc) {
        setLayout(Rez.Layouts.ErrorLayout(dc));
        var view = View.findDrawableById("Message");

        System.println("TadoErrorView.mc ErrorView::onLayout");
        System.println(_message);

        view.setText(_message.toString());
    }

}