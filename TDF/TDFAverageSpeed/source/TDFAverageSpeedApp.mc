import Toybox.Application;
import Toybox.Lang;
import Toybox.WatchUi;

class TDFAverageSpeedApp extends TDFBase.TDFAppBase {

    function initialize() {
        TDFAppBase.initialize();
    }

    //! Return the initial view of your application here
    function getInitialView() as Array<Views or InputDelegates>? {
        return [ new TDFBase.TDFAverageSpeedView() ] as Array<Views or InputDelegates>;
    }
}

function getApp() as TDFAverageSpeedApp {
    return Application.getApp() as TDFAverageSpeedApp;
}
