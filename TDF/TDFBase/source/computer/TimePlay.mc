import Toybox.Activity;
import Toybox.Graphics;
import Toybox.Lang;

module TDFBase {
module Computer{

class TimePlay extends ComputerBase {
	private var time as Lang.Number? = null;
	private var sec as Lang.Number = 0;
	private var min as Lang.Number = 0;
	private var hour as Lang.Number = 0;

	function initialize() {
		ComputerBase.initialize();
		smallFieldBigFont = true;
		valueStr = "--:--";
	}

	protected function computeMaxValueStr(longField as Lang.Boolean) as Lang.String {
		if(longField)
		{
			return "00:00:00";
		}
		else
		{
			return "00:00";
		}
	}

	function compute(info as Activity.Info) as Void {
		var newTime = info.timerTime;

		if(time != newTime)
		{
			time = newTime;

			if(time != null)
			{
				time /= 1000;
				sec = time;
				hour = sec / 3600;
				sec -= hour * 3600;
				min = sec / 60;
				sec -= min * 60;
			}

			needUpdate = true;
		}
	}

	function onLayout() as Void {
		needUpdate = true;
	}

	function update(longField as Lang.Boolean) as Void {
		if(time != null)
		{
			if(longField)
			{
				valueStr = Lang.format(
					"$1$:$2$:$3$",
					[hour.format("%02d"), min.format("%02d"), sec.format("%02d")]
				);
			}
			else
			{
				valueStr = Lang.format(
					"$1$:$2$",
					[hour.format("%02d"), min.format("%02d")]
				);
			}
		}
		else
		{
			if(longField)
			{
				valueStr = "--:--:--";
			}
			else
			{
				valueStr = "--:--";
			}
		}
	}
}

}}