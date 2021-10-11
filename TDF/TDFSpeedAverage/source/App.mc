module TDF{

class App extends TDFBase.App {
	function initialize() {
		TDFBase.App.initialize();
	}

	function getInitialView() as Array<Views or InputDelegates>? {
		return [ new TDFBase.SpeedAverageView() ] as Array<Views or InputDelegates>;
	}
}

function getApp() as App {
	return Application.getApp() as App;
}

}