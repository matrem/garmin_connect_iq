import Toybox.Application;
import Toybox.Lang;
import Toybox.WatchUi;

module TDFBase {

class TDFAppBase extends Application.AppBase {

    function initialize() {
        AppBase.initialize();
    }

    // onStart() is called on application start up
    function onStart(state as Dictionary?) as Void {
    }

    // onStop() is called when your application is exiting
    function onStop(state as Dictionary?) as Void {
    }
}

}