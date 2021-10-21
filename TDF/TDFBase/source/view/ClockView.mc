using Toybox.Activity;
using Toybox.Lang;
using Toybox.Time;
using Toybox.System;

module TDFBase {

class ClockView extends BaseView {
	private var min as Lang.Number = 0;
	private var hour as Lang.Number = 0;

	function initialize() {
		BaseView.initialize();
		smallFieldBigFont = true;
		valueStr = "00:00";
	}

	protected function computeMaxValueText() {
		return "00:00";
	}

	function compute(info as Activity.Info) as Void {
		var newTime = System.getClockTime();

		var newHour = newTime.hour;
		var newMin = newTime.min;

		if(hour != newHour || min != newMin)
		{
			hour = newHour;
			min = newMin;

			valueStr = Lang.format(
				"$1$:$2$",
				[hour.format("%02d"), min.format("%02d")]
			);
		}
	}
}

}
