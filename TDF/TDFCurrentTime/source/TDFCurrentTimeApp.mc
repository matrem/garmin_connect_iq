import Toybox.Application;
import Toybox.Lang;
import Toybox.WatchUi;
import TDFBase;

class TDFCurrentTimeApp extends TDFBase.TDFAppBase {

    function initialize() {
        TDFAppBase.initialize();
    }

    //! Return the initial view of your application here
    function getInitialView() as Array<Views or InputDelegates>? {
        return [ new TDFBase.TDFTimeView() ] as Array<Views or InputDelegates>;
    }
}

function getApp() as TDFCurrentTimeApp {
    return Application.getApp() as TDFCurrentTimeApp;
}
