using Toybox.Application as App;

const BaseUrl = "https://tado-ciq-bridge.sharedwithexpose.com";
const ApiUrl = BaseUrl + "/api";

class TadoApp extends App.AppBase
{
    function initialize()
    {
        AppBase.initialize();
    }

    // onStart() is called on application start up
    function onStart(state)
    {
    }

    // onStop() is called when your application is exiting
    function onStop(state)
    {
    }

    // Return the initial view of your application here
    function getInitialView()
    {
        var apiToken = getProperty("api_token");

        if(!System.getDeviceSettings().phoneConnected) {
            return [ new ConnectToGarminConnectAppView() ];
        } else if ( apiToken == null ) {
            return [ new LoginView(), new LoginDelegate() ];
        } else {
            return [ new TadoView() ];
        }
    }
}