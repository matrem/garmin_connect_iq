module TDFBase {

class SpeedCurrentView extends SpeedBaseView {
	function initialize() {
		SpeedBaseView.initialize();
	}

	function computeSpeed(info as Activity.Info) as Lang.Float{
		return info.currentSpeed;
	}
}

}
