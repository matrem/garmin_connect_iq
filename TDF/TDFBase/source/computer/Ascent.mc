import Toybox.Graphics;
import Toybox.Activity;
import Toybox.Lang;

module TDFBase {
module Computer{

class Ascent extends ComputerBase {
	var ascent as Lang.Number? = null;
	var ascentf as Lang.Float = 0.0f;

	function initialize() {
		ComputerBase.initialize();

		valueStr = "---";
		unit1Str = "a+";
		unit2Str = "km";
	}

	public function computeMaxValueStr(longField as Lang.Boolean) as Lang.String {
		if(longField)
		{
			return "9.999";
		}
		else
		{
			return "9.99";
		}
	}

	function compute(info as Activity.Info) as Void {
		var newAscent = info.totalAscent;

		if(ascent != newAscent)
		{
			ascent = newAscent;

			if(ascent!=null)
			{
				ascentf = ascent / 1000.0f;
				needUpdate = true;
			}
			else
			{
				valueStr = "---";
			}
		}
	}

	function onLayout() as Void {
		needUpdate = ascent!=null;
	}

	function update(longField as Lang.Boolean) as Void {
		if(longField)
		{
			valueStr = ascentf.format("%.3f");
		}
		else
		{
			valueStr = ascentf.format("%.2f");
		}
	}
}

}}