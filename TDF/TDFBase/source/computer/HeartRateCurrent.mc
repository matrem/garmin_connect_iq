import Toybox.Activity;
import Toybox.Lang;

module TDFBase {
module Computer{

class HeartRateCurrent extends RateBase {
	function initialize() {
		RateBase.initialize();
	}

	function computeRate(info as Activity.Info) as Lang.Float? {
		return info.currentHeartRate ;
	}
}

}}