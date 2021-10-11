module TDFBase {

class HeartRateCurrentView extends RateBaseView {
	function initialize() {
		RateBaseView.initialize();
	}

	function computeRate(info as Activity.Info) as Lang.Float {
		return info.currentHeartRate ;
	}
}

}
