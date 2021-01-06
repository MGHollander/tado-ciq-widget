using Toybox.System;
using Toybox.WatchUi;


// View to handle showing the Connect to GCM message
class ErrorView extends WatchUi.View
{
    hidden var _code;
    hidden var _message;

    function initialize(code, message)
    {
        View.initialize();

        _code = code;
        _message = message;
    }

    function onLayout(dc)
    {
        setLayout(Rez.Layouts.ErrorLayout(dc));

        System.println("ErrorView::onLayout");
        System.println("_code = " + _code);
        System.println("_message = " + _message);

        var code = View.findDrawableById("ErrorCode");
        var message = View.findDrawableById("ErrorMessage");

        code.setText(_code.toString());
        message.setText(_message.toString());
    }

}