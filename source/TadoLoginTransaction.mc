using Toybox.Application as App;
using Toybox.Communications as Comm;
using Toybox.System;
using Toybox.WatchUi;

// The LoginTransaction is a special transaction that handles
// getting the api token.
class LoginTransaction
{
    // Constructor
    function initialize() {
        // Register a callback to handle a response from the
        // OAUTH request. If there is a response waiting this
        // will fire right away
        Comm.registerForOAuthMessages(method(:accessCodeResult));
    }

    // Handle converting the authorization code to the access token
    // @param value Content of JSON response
    function accessCodeResult(value) {
        System.println("LoginTransaction.mc LoginTransaction::accessCodeResult");
        System.println("value = " + value);

        if (value.data != null) {
            handleResponse(value.data);
        }
        else {
            handleError(value.responseCode);
        }
    }

    // Method to kick off tranaction
    function go() {
        System.println("LoginTransaction.mc LoginTransaction::go");
        System.println($.ApiBaseUrl + "/login");

        // Kick of a request for the user's credentials. This will
        // cause a notification from Connect Mobile to file
        Comm.makeOAuthRequest(
            $.ApiBaseUrl + "/login",
            {},
            $.ApiBaseUrl + "/login/callback",
            Comm.OAUTH_RESULT_TYPE_URL,
            {"api_token"=>"api_token"}
        );
    }

    // Handle a successful response from the server
    function handleResponse(data) {
        System.println("LoginTransaction.mc LoginTransaction::handleResponse");
        System.println("Data: " + data);

        // Store the api token in the properties
        // For app store apps the properties are encrypted using
        // a randomly generated key
        App.getApp().setProperty("api_token", data["api_token"]);

        // Switch to the data view
        WatchUi.switchToView(new TadoView(), null, WatchUi.SLIDE_IMMEDIATE);
    }

    // Handle a error from the server
    function handleError(code) {
        System.println("LoginTransaction.mc LoginTransaction::handleError");

        var msg = WatchUi.loadResource( Rez.Strings.Error );
        msg += code;

        System.println(msg);

        WatchUi.switchToView(new ErrorView(msg), null, WatchUi.SLIDE_IMMEDIATE);
    }
}
