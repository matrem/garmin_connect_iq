import Toybox.Activity;
import Toybox.Lang;

module TDFBase {
module Computer{

class RateBase extends ComputerBase {
	private var rate as Lang.Float? = null;

	function initialize() {
		ComputerBase.initialize();

		unit0Str = "b";
		unit1Str = "p";
		unit2Str = "m";

		valueStr = "---";

		smallFieldBigFont = true;
	}

	public function computeMaxValueStr(longField as Lang.Boolean) as Lang.String {
		return "999";
	}

	function compute(info as Activity.Info) as Void {
		var newRate = computeRate(info);

		if(rate != newRate)
		{
			rate = newRate;

			if(rate == null)
			{
				valueStr = "---";
			}
			else
			{
				valueStr = rate.format("%d");
			}
		}
	}

	function computeRate(info as Activity.Info) as Lang.Float? {
		return null;
	}
}

}}