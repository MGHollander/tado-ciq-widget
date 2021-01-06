using Toybox.Application as App;
using Toybox.Communications as Comm;
using Toybox.System;
using Toybox.WatchUi;

// The LoginTransaction is a special transaction that handles
// getting the api token.
class LoginTransaction extends TadoTransaction
{
    // Constructor
    function initialize()
    {
        TadoTransaction.initialize();

        // Register a callback to handle a response from the
        // OAUTH request. If there is a response waiting this
        // will fire right away
        Comm.registerForOAuthMessages(method(:accessCodeResult));
    }

    // Handle converting the authorization code to the access token
    // @param value Content of JSON response
    function accessCodeResult(value)
    {
        System.println("LoginTransaction::accessCodeResult");
        System.println("value = " + value);

        if (value.data != null) {
            handleResponse(value.data);
        }
        else {
            handleError(value.responseCode, value.data);
        }
    }

    // Method to kick off tranaction
    function go()
    {
        System.println("LoginTransaction::go");
        System.println($.BaseUrl + "/login");

        // Kick of a request for the user's credentials. This will
        // cause a notification from Connect Mobile to file
        Comm.makeOAuthRequest(
            $.BaseUrl + "/login",
            {},
            $.BaseUrl + "/login/callback",
            Comm.OAUTH_RESULT_TYPE_URL,
            {"api_token"=>"api_token"}
        );
    }

    // Handle a successful response from the server
    function handleResponse(data)
    {
        System.println("LoginTransaction::handleResponse");
        System.println("data = " + data);

        // Store the api token in the properties
        // For app store apps the properties are encrypted using
        // a randomly generated key
        App.getApp().setProperty("api_token", data["api_token"]);

        // Switch to the data view
        var view = new TadoMainView();
        WatchUi.switchToView(view, new TadoMainBehaviorDelegate(view), WatchUi.SLIDE_IMMEDIATE);
    }
}
