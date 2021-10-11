module TDFBase {

class CadenceView extends RateBaseView {
	function initialize() {
		RateBaseView.initialize();
		unit0Text = "r";
	}

	function computeRate(info as Activity.Info) as Lang.Float {
		return info.currentCadence;
	}
}

}