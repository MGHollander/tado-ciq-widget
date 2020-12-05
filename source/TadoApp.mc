using Toybox.Application;

class TadoApp extends Application.AppBase {

    function initialize() {
        AppBase.initialize();
    }

    // onStart() is called on application start up
    function onStart(state) {
    }

    // onStop() is called when your application is exiting
    function onStop(state) {
    }

    // Return the initial view of your application here
    function getInitialView() {
        if(!System.getDeviceSettings().phoneConnected) {
            return [ new ConnectToGarminConnectAppView() ];
        } else {
            return [ new TadoView() ];
        }
    }
}