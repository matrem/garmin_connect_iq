import Toybox.Application;
import Toybox.Lang;
import Toybox.WatchUi;

class TDFCurrentHeartRateApp  extends TDFBase.TDFAppBase {

    function initialize() {
        TDFBase.TDFAppBase.initialize();
    }

    //! Return the initial view of your application here
    function getInitialView() as Array<Views or InputDelegates>? {
        return [ new TDFBase.TDFCurrentHeartRateView() ] as Array<Views or InputDelegates>;
    }
}

function getApp() as TDFCurrentHeartRateApp {
    return Application.getApp() as TDFCurrentHeartRateApp;
}