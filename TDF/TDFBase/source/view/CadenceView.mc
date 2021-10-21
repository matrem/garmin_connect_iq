import Toybox.Activity;
import Toybox.Lang;

module TDFBase {

class CadenceView extends RateBaseView {
	function initialize() {
		RateBaseView.initialize();
		unit0Str = "r";
	}

	function computeRate(info as Activity.Info) as Lang.Float? {
		return info.currentCadence;
	}
}

}