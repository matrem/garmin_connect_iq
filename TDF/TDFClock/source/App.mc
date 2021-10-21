import Toybox.Lang;
import Toybox.WatchUi;
import Toybox.WatchUi;
import Toybox.Application;

module TDF{

class App extends Application.AppBase {

	function initialize() {
		Application.AppBase.initialize();
	}

	function getInitialView() as Array<Views or InputDelegates>? {
		return [
			new TDFBase.ComputerView([new TDFBase.Computer.Clock()] as Array<TDFBase.Computer.ComputerBase>, 0)
		] as Array<Views or InputDelegates>;
	}

}

function getApp() as App {
	return Application.getApp() as App;
}

}