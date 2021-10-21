import Toybox.Activity;
import Toybox.Lang;

module TDFBase {

class SpeedBaseView extends BaseView {
	private var speed as Lang.Float? = null;

	function initialize() {
		BaseView.initialize();
		unit0Str = "Km";
		unit1Str = "p";
		unit2Str = "h";
		smallFieldBigFont = true;
		valueStr = "--.-";
	}

	protected function computeMaxValueText() {
		return "99.9";
	}

	function compute(info as Activity.Info) as Void {
		var newSpeed = computeSpeed(info);

		if(speed != newSpeed)
		{
			speed = newSpeed;

			if(speed != null)
			{
				speed *= 3.6;
				valueStr = speed.format("%.1f");
			}
			else
			{
				valueStr = "--.-";
			}
		}
	}

	function computeSpeed(info as Activity.Info) as Lang.Float? {
		return null;
	}
}

}
