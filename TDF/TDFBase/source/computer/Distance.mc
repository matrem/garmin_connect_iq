import Toybox.Graphics;
import Toybox.Activity;
import Toybox.Lang;

module TDFBase {
module Computer{

class Distance extends ComputerBase {
	var distance as Lang.Float? = null;
	var distancef as Lang.Float = 0.0;
	var prefixValue as Lang.Number = 0;
	var km as Lang.Boolean = false;

	function initialize() {
		ComputerBase.initialize();

		smallFieldBigFont = true;
		valueStr = "---";
		unit1Str = "";
		unit2Str = "m";
		prefixStr = "";
	}

	public function computeMaxValueStr(longField as Lang.Boolean) as Lang.String {
		if(longField)
		{
			return "99.99";
		}
		else
		{
			return "99.9";
		}
	}

	function compute(info as Activity.Info) as Void {
		var newDistance = info.elapsedDistance;
		var newPrefixValue = 0 as Lang.Number;

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
					newPrefixValue = (distancef / 100).toNumber();
					//System.println("newPrefixValue : " + newPrefixValue);
					distancef -= newPrefixValue * 100;
					//System.println("distancef : " + distancef);
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

			if(prefixValue != newPrefixValue)
			{
				prefixValue = newPrefixValue;
				prefixStr = prefixValue.format("%d");
				needUpdatePrefixText = true;
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