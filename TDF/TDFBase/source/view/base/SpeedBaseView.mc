module TDFBase {

class SpeedBaseView extends BaseView {
	private var speed = null;

	function initialize() {
		BaseView.initialize();
		unit0Text = "Km";
		unit1Text = "p";
		unit2Text = "h";
		smallFieldBigFont = true;
		valueText = "--.-";
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
				valueText = speed.format("%.1f");
			}
			else
			{
				valueText = "--.-";
			}
		}
	}

	function computeSpeed(info as Activity.Info) as Lang.Float {
		return null;
	}
}

}
