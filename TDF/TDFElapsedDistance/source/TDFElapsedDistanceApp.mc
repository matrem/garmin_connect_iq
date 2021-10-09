import Toybox.Application;
import Toybox.Lang;
import Toybox.WatchUi;

class TDFElapsedDistanceApp extends TDFBase.TDFAppBase {

    function initialize() {
        TDFAppBase.initialize();
    }

    //! Return the initial view of your application here
    function getInitialView() as Array<Views or InputDelegates>? {
        return [ new TDFBase.TDFDistanceView() ] as Array<Views or InputDelegates>;
    }
}

function getApp() as TDFElapsedDistanceApp {
    return Application.getApp() as TDFElapsedDistanceApp;
}