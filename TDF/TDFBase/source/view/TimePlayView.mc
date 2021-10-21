import Toybox.Activity;
import Toybox.Graphics;
import Toybox.Lang;

module TDFBase {

class TimePlayView extends BaseView {
	private var time as Lang.Number? = null;
	private var sec as Lang.Number = 0;
	private var min as Lang.Number = 0;
	private var hour as Lang.Number = 0;
	private var needUpdate as Lang.Boolean = true;

	function initialize() {
		BaseView.initialize();
		smallFieldBigFont = true;
		valueStr = "--:--";
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
				if(getLongField())
				{
					valueStr = "--:--:--";
				}
				else
				{
					valueStr = "--:--";
				}
			}
			needUpdate = false;
		}
		BaseView.onUpdate(dc);
	}
}

}
