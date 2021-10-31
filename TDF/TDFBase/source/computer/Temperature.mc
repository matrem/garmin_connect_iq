import Toybox.Activity;
import Toybox.Lang;

module TDFBase {
module Computer{

class Temperature extends ComputerBase {
	public static const STORAGE_ID as Lang.String = "TDFStorage_Temperature";
	private var temp as Lang.Number? = null;

	function initialize() {
		ComputerBase.initialize();
		smallFieldBigFont = true;

		unit1Str = "°";
		unit2Str = "C";
		valueStr = "--";
	}

	public function computeMaxValueStr(longField as Lang.Boolean) as Lang.String{
		return "-99";
	}

	function compute(info as Activity.Info) as Void {
		var newTemp = Application.Storage.getValue(STORAGE_ID);

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