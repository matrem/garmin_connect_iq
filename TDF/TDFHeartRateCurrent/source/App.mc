module TDF {

class App  extends TDFBase.App {

	function initialize() {
		TDFBase.App.initialize();
	}

	function getInitialView() as Array<Views or InputDelegates>? {
	return [ new TDFBase.HeartRateCurrentView() ] as Array<Views or InputDelegates>;
	}
}

function getApp() as App {
	return Application.getApp() as App;
}

}