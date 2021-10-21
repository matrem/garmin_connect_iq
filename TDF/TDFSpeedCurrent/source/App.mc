import Toybox.Lang;
import Toybox.WatchUi;
import Toybox.Application;

module TDF {

class App extends Application.AppBase {

	public function initialize() {
		Application.AppBase.initialize();
	}

	public function getInitialView() as Array<Views or InputDelegates>? {
		return [
			new TDFBase.ComputerView([new TDFBase.Computer.SpeedCurrent()] as Array<TDFBase.Computer.ComputerBase>, 0)
		] as Array<Views or InputDelegates>;
	}
}

public function getApp() as App {
	return Application.getApp() as App;
}

}