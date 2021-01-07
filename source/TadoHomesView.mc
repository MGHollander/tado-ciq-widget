using Toybox.Application as App;
using Toybox.Communications as Comm;
using Toybox.System;
using Toybox.WatchUi;

class TadoHomesView extends WatchUi.View
{
    hidden var _menuDelegate;

    function initialize()
    {
        View.initialize();

        _menuDelegate = new TadoHomesMenuDelegate();
    }

    // Load your resources here
    function onLayout(dc)
    {
        setLayout(Rez.Layouts.MainLayout(dc));
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow()
    {
        System.println("TadoHomesView::onShow");

        var homeId = App.getApp().getProperty("home_id");

        if (homeId == null) {
            makeRequest();
        }
    }

    // Update the view
    function onUpdate(dc)
    {
        System.println("TadoHomesView::onUpdate");

        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide()
    {
    }

    function selectHome(homes)
    {
        System.println("TadoHomesView::selectHome");
        System.println(homes);

        if (homes.size() == 1) {
            _menuDelegate.selectHome(homes[0]["id"]);
        }
        else {
            var menu = new WatchUi.Menu2(null);

            menu.setTitle(Rez.Strings.ChooseHome);

            for (var i = 0; i < homes.size(); i++) {
                menu.addItem(
                    new WatchUi.MenuItem(
                        homes[i]["name"],
                        null,
                        homes[i]["id"],
                        {}
                    )
                );
            }

            WatchUi.switchToView(menu, _menuDelegate, WatchUi.SLIDE_DOWN);
        }
    }

   // set up the response callback function
   function onReceive(responseCode, data)
   {
        System.println("TadoHomesView::onReceive");

        if (responseCode == 200) {
            System.println("Request successful");
            System.println("data: " + data);

            selectHome(data["homes"]);
        }
        else {
            System.println("Request failed");
            System.println("Response: " + responseCode);
        }
    }

    function makeRequest()
    {
        var apiToken = App.getApp().getProperty("api_token");
        System.println("TadoHomesView::makeRequest");

        Comm.makeWebRequest(
            $.ApiUrl + "/me",
            {"api_token" => apiToken},
            {
                :method => Comm.HTTP_REQUEST_METHOD_GET,
                :headers => {
                    "Content-Type" => Comm.REQUEST_CONTENT_TYPE_JSON
                },
                :responseType => Comm.HTTP_RESPONSE_CONTENT_TYPE_JSON
            },
            method(:onReceive)
        );
    }
}
