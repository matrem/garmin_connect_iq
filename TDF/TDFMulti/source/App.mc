import Toybox.Lang;
import Toybox.WatchUi;
import Toybox.Application;
import Toybox.System;
import Toybox.Time;

module TDF {

(:background)
class App extends Application.AppBase {

	function initialize() {
		Application.AppBase.initialize();
	}

	(:typecheck(disableBackgroundCheck))
	function getInitialView() as Array<Views or InputDelegates>? {
		Background.registerForTemporalEvent(new Time.Duration(5 * 60));

		return [ new TDFBase.ComputerMultiView(
			[new TDFBase.Computer.Clock(), new TDFBase.Computer.Temperature(), new TDFBase.Computer.Ascent()] as Array<TDFBase.Computer.ComputerBase>
			, 5)
		] as Array<Views or InputDelegates>;
	}

	function getServiceDelegate() as  Lang.Array<System.ServiceDelegate>{
		return [new TemperatureService()] as Array<System.ServiceDelegate>;
	}

	(:typecheck(disableBackgroundCheck))
	function onBackgroundData(data as Application.PersistableType) as Void
	{
		Application.Storage.setValue(TDFBase.Computer.Temperature.STORAGE_ID, data);
	}
}

function getApp() as App {
	return Application.getApp() as App;
}

}