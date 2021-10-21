import Toybox.Graphics;
import Toybox.Activity;
import Toybox.Lang;

module TDFBase {
module Computer{

class Distance extends ComputerBase {
	var distance as Lang.Float? = null;
	var distancef as Lang.Float = 0.0;
	var km as Lang.Boolean = false;

	function initialize() {
		ComputerBase.initialize();

		valueStr = "---";
		unit1Str = "";
		unit2Str = "m";
	}

	protected function computeMaxValueStr(longField as Lang.Boolean) {
		if(longField)
		{
			return "999.99";
		}
		else
		{
			return "999.9";
		}
	}

	function compute(info as Activity.Info) as Void {
		var newDistance = info.elapsedDistance;

		if(distance != newDistance)
		{
			distance = newDistance;

			var newKm = false;

			if(distance!=null)
			{
				distancef = distance;

				newKm = distancef >= 1000.0;

				if(newKm)
				{
					distancef /= 1000.0;
					needUpdate = true;
				}
				else
				{
					valueStr = distancef.format("%d");
				}
			}
			else
			{
				newKm = false;
				valueStr = "---";
			}

			if(km != newKm)
			{
				km = newKm;
				needUpdateUnitText = true;
				if(km)
				{
					unit1Str = "K";
					unit2Str = "m";
				}
				else
				{
				 	unit1Str = "";
					unit2Str = "m";
				}
			}
		}
	}

	function onLayout() as Void {
		needUpdate = distance!=null && km;
	}

	function update(longField as Lang.Boolean) as Void {
		if(longField)
		{
			valueStr = distancef.format("%.2f");
		}
		else
		{
			valueStr = distancef.format("%.1f");
		}
	}
}

}}