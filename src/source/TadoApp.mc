using Toybox.Application as App;

const BaseUrl = "https://tado-ciq-bridge.mghollander.nl";
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
        System.println("TadoApp::onStart");
        System.println("state = " + state);
    }

    // onStop() is called when your application is exiting
    function onStop(state)
    {
        System.println("TadoApp::onStop");
        System.println("state = " + state);

        // Empty the zones property to make sure fresh data is gathered the next time.
        App.getApp().setProperty("zones", null);
    }

    // Return the initial view of your application here
    function getInitialView()
    {
        var apiToken = getProperty("api_token");

        if(!System.getDeviceSettings().phoneConnected) {
            return [ new ConnectToGmcView() ];
        } else if ( apiToken == null ) {
            return [ new LoginView(), new LoginDelegate() ];
        } else {
            var mainView = new TadoMainView();
            return [ mainView, new TadoMainBehaviorDelegate(mainView) ];
        }
    }
}