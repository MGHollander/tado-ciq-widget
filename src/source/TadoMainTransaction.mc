using Toybox.Application as App;
using Toybox.Communications as Comm;
using Toybox.System;

class TadoMainTransaction extends TadoTransaction
{
    hidden var _view;

    function initialize(view)
    {
        TadoTransaction.initialize();

        var homeId = App.getApp().getProperty("home_id");

        _endpoint = "/zones/" + homeId;
        _view = view;
    }

    // Function to put response handling
    function handleResponse(data)
    {
        System.println("TadoMainTransaction::handleResponse");
        System.println("data = " + data);

        App.getApp().setProperty("zones", data);

        _view.setZones(data);
    }


    // Function to put error handling
    function handleError(error)
    {
        System.println("TadoMainTransaction::handleError");
        System.println("error = " + error);
    }
}