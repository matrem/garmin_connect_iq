import Toybox.Activity;
import Toybox.Lang;

module TDFBase {
	public const TEMPERATURE_STORAGE_ID as Lang.String = "TDFStorage_Temperature";

class TemperatureView extends BaseView {
	private var temp as Lang.Number? = null;

	function initialize() {
		BaseView.initialize();
		smallFieldBigFont = true;

		unit1Str = "°";
		unit2Str = "C";
		valueStr = "--";
	}

	protected function computeMaxValueText() {
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

}
