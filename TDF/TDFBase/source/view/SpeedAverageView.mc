module TDFBase {

class SpeedAverageView extends SpeedBaseView {
	function initialize() {
		SpeedBaseView.initialize();
		setAverageView();
	}

	function computeSpeed(info as Activity.Info) as Lang.Float{
		return info.averageSpeed;
	}
}

}
