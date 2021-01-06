using Toybox.Application as App;
using Toybox.Communications as Comm;
using Toybox.System;
using Toybox.WatchUi;

class TadoTransaction
{
    hidden var _endpoint = "/me";

    // Constructor
    hidden function initialize()
    {
        // We do not need to do anything here, yet.
    }

    function go()
    {
        var apiToken = App.getApp().getProperty("api_token");
        System.println("TadoTransaction::go");
        System.println("endpoint: " + $.ApiUrl + _endpoint + "?api_token=" + apiToken);

        Comm.makeWebRequest(
            $.ApiUrl + _endpoint,
            {"api_token" => apiToken},
            {
                :method => Comm.HTTP_REQUEST_METHOD_GET,
                :headers => {
                    "Accept" => "application/json",
                    "Content-Type" => Comm.REQUEST_CONTENT_TYPE_JSON,
                    "CIQ-app" => "Tado widget"
                },
                :responseType => Comm.HTTP_RESPONSE_CONTENT_TYPE_JSON
            },
            method(:onReceive)
        );
    }

   // set up the response callback function
   function onReceive(responseCode, data)
   {
        System.println("TadoTransaction::onReceive");

        if (responseCode == 200) {
            System.println("Request successful");
            System.println("data: " + data);

            handleResponse(data);
        }
        else if (responseCode == 401) {
            System.println("Request unauthenticated");
            System.println("data: " + data);

            handleAuthError(data);
        }
        else {
            System.println("Request failed");
            System.println("Response: " + responseCode);
            System.println("data: " + data);

            var message = "";
            if (data["message"] != null) {
                System.println("has message");
                message = data["message"];
            }

            handleError(responseCode, message);
        }
    }

    // Function to put response handling
    function handleResponse(data)
    {
        System.println("TadoTransaction::handleResponse");
        System.println("data = " + data);
    }

    // Function to put error handling
    function handleAuthError(error)
    {
        System.println("TadoTransaction::handleAuthError");
        System.println("error = " + error);
        System.println("api_token = " + App.getApp().getProperty("api_token"));

        App.getApp().setProperty("api_token", null);
        WatchUi.switchToView(new LoginView(), null, WatchUi.SLIDE_IMMEDIATE);
    }

    // Handle an error from the server
    function handleError(code, message)
    {
        System.println("TadoTransaction::handleError");
        System.println("code = " + code);
        System.println("message = " + message);

        WatchUi.switchToView(new ErrorView(code, message), null, WatchUi.SLIDE_IMMEDIATE);
    }
}