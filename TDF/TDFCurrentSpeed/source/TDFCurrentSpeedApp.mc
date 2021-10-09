import Toybox.Application;
import Toybox.Lang;
import Toybox.WatchUi;

class TDFCurrentSpeedApp extends TDFBase.TDFAppBase {

    function initialize() {
        TDFAppBase.initialize();
    }

    //! Return the initial view of your application here
    function getInitialView() as Array<Views or InputDelegates>? {
        return [ new TDFBase.TDFCurrentSpeedView() ] as Array<Views or InputDelegates>;
    }
}

function getApp() as TDFCurrentSpeedApp {
    return Application.getApp() as TDFCurrentSpeedApp;
}