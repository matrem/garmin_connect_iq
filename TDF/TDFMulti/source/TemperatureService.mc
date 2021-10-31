import Toybox.System;
import Toybox.Background;

module TDF {

(:background)
class TemperatureService extends System.ServiceDelegate {
	function initialize() {
		System.ServiceDelegate.initialize();
	}

	function onTemporalEvent() {
		var info = Sensor.getInfo();
		Background.exit(info.temperature);
	}
}

}