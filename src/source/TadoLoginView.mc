using Toybox.System;
using Toybox.WatchUi;

// Ui delegate for the Login view
class LoginDelegate extends WatchUi.BehaviorDelegate
{
    function initialize()
    {
        BehaviorDelegate.initialize();
    }

}

// Ui View that displays the message
// that directs the user to the phone
class LoginView extends WatchUi.View
{

    hidden var _transaction;
    hidden var _running;

    // Constructor
    function initialize()
    {
        View.initialize();

        System.println("LoginView::initialize");

        _transaction = new LoginTransaction();
        _running = false;
    }

    // Handle layout
    function onLayout(dc)
    {
        setLayout(Rez.Layouts.LoginLayout(dc));
    }

    // Handle becoming visible
    function onShow()
    {
         System.println("LoginView::onShow");

        // onShow can be called multiple times, so make sure
        // we only start the transaction once
        if(_running == false) {
            _transaction.go();
            _running = true;
        }
    }
}