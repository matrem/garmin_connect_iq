import Toybox.Activity;
import Toybox.Lang;

module TDFBase {
module Computer{

class SpeedAverage extends SpeedBase {
	function initialize() {
		SpeedBase.initialize();
	}

	function computeSpeed(info as Activity.Info) as Lang.Float?{
		return info.averageSpeed;
	}
}

}}