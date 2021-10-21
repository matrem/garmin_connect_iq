import Toybox.Activity;
import Toybox.Lang;

module TDFBase {

class RateBaseView extends BaseView {
	private var rate as Lang.Float? = null;

	function initialize() {
		BaseView.initialize();

		unit0Str = "b";
		unit1Str = "p";
		unit2Str = "m";

		valueStr = "---";

		smallFieldBigFont = true;
	}

	protected function computeMaxValueText() {
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

}
