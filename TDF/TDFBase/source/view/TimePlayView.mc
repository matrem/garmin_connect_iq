module TDFBase {

class TimePlayView extends BaseView {
	private var time;
	private var sec, min, hour;
	private var needUpdate = true;

	function initialize() {
		BaseView.initialize();
		smallFieldBigFont = true;
		valueText = "--:--";
	}

	protected function computeMaxValueText() {
		if(getLongField())
		{
			return "00:00:00";
		}
		else
		{
			return "00:00";
		}
	}

	function compute(info as Activity.Info) as Void {
		var newTime = info.timerTime / 1000;

		if(time != newTime)
		{
			time = newTime;

			if(time != null)
			{
				sec = time;
				hour = sec / 3600;
				sec -= hour * 3600;
				min = sec / 60;
				sec -= min * 60;
			}

			needUpdate = true;
		}
	}

	function onLayout(dc as Dc) as Void {
		needUpdate = true;
		BaseView.onLayout(dc);
	}

	function onUpdate(dc as Dc) as Void {
		if(needUpdate)
		{
			if(time != null)
			{
				if(getLongField())
				{
					valueText = Lang.format(
						"$1$:$2$:$3$",
						[hour.format("%02d"), min.format("%02d"), sec.format("%02d")]
					);
				}
				else
				{
					valueText = Lang.format(
						"$1$:$2$",
						[hour.format("%02d"), min.format("%02d")]
					);
				}
			}
			else
			{
				if(getLongField())
				{
					valueText = "--:--:--";
				}
				else
				{
					valueText = "--:--";
				}
			}
			needUpdate = false;
		}
		BaseView.onUpdate(dc);
	}
}

}
