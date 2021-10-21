import Toybox.Activity;
import Toybox.Lang;

module TDFBase {
module Computer{

class Temperature extends ComputerBase {
	public static const TEMPERATURE_STORAGE_ID as Lang.String = "TDFStorage_Temperature";
	private var temp as Lang.Number? = null;

	function initialize() {
		ComputerBase.initialize();
		smallFieldBigFont = true;

		unit1Str = "°";
		unit2Str = "C";
		valueStr = "--";
	}

	protected function computeMaxValueStr(longField as Lang.Boolean) as Lang.String{
		return "-99";
	}

	function compute(info as Activity.Info) as Void {
		var newTemp = Application.Storage.getValue(TEMPERATURE_STORAGE_ID);

		if(temp != newTemp)
		{
			temp = newTemp;
			if(temp!=null)
			{
				valueStr = temp.format("%d");
			}
			else
			{
				valueStr = "--";
			}
		}
	}
}

}}