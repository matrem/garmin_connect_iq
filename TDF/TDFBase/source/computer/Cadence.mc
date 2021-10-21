import Toybox.Activity;
import Toybox.Lang;

module TDFBase {
module Computer{

class Cadence extends RateBase {
	function initialize() {
		RateBase.initialize();
		unit0Str = "r";
	}

	function computeRate(info as Activity.Info) as Lang.Float? {
		return info.currentCadence;
	}
}

}}