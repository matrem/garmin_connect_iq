import Toybox.Activity;
import Toybox.Lang;

module TDFBase {
module Computer{

class SpeedBase extends ComputerBase {
	private var speed as Lang.Float? = null;

	function initialize() {
		ComputerBase.initialize();
		unit0Str = "Km";
		unit1Str = "p";
		unit2Str = "h";
		smallFieldBigFont = true;
		valueStr = "--.-";
	}

	protected function computeMaxValueStr(longField as Lang.Boolean) {
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

}}