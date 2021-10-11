module TDFBase {

class ClockView extends BaseView {
	private var min = null, hour = null;

	function initialize() {
		BaseView.initialize();
		smallFieldBigFont = true;
		valueText = "--:--";
	}

	protected function computeMaxValueText() {
		return "00:00";
	}

	function compute(info as Activity.Info) as Void {
		var time = System.getClockTime();

		var newHour = time.hour;
		var newMin = time.min;

		if(hour != newHour || min != newMin)
		{
			hour = newHour;
			min = newMin;

			valueText = Lang.format(
				"$1$:$2$",
				[hour.format("%02d"), min.format("%02d")]
			);
		}
	}
}

}
