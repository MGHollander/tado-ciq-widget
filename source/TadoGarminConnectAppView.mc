using Toybox.WatchUi;


// View to handle showing the Connect to GCM message
class ConnectToGarminConnectAppView extends WatchUi.View {

    function initialize() {
        View.initialize();
    }

    function onLayout(dc) {
        setLayout(Rez.Layouts.Gcm(dc));
    }

}

