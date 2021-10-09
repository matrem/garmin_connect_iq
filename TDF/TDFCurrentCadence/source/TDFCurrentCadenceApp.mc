import Toybox.Application;
import Toybox.Lang;
import Toybox.WatchUi;

class TDFCurrentCadenceApp extends TDFBase.TDFAppBase {

    function initialize() {
        TDFBase.TDFAppBase.initialize();
    }

    //! Return the initial view of your application here
    function getInitialView() as Array<Views or InputDelegates>? {
        return [ new TDFBase.TDFCadenceView() ] as Array<Views or InputDelegates>;
    }

}

function getApp() as TDFCurrentCadenceApp {
    return Application.getApp() as TDFCurrentCadenceApp;
}