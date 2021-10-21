import Toybox.Lang;
import Toybox.WatchUi;
import Toybox.Application;

module TDF {

class App  extends Application.AppBase {

	function initialize() {
		Application.AppBase.initialize();
	}

	function getInitialView() as Array<Views or InputDelegates>? {
	return [ new TDFBase.HeartRateCurrentView() ] as Array<Views or InputDelegates>;
	}
}

function getApp() as App {
	return Application.getApp() as App;
}

}