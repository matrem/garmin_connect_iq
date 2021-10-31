import Toybox.Activity;
import Toybox.Graphics;
import Toybox.Lang;
import Toybox.WatchUi;

module TDFBase {

class ComputerMultiView extends ComputerView {
	private var computerChangeTimer as Lang.Number = 0;
	private var computerChangeTime as Lang.Number = 0;
	private var computers as Lang.Array<Computer.ComputerBase>;
	private var computerIdx as Lang.Number = 0;
	private var needUpdateComputerInfo as Lang.Boolean = true;

	function initialize( initComputers as Lang.Array<Computer.ComputerBase>, initComputerChangeTimer as Lang.Number ) {
		ComputerView.initialize(initComputers[0]);

		computers = initComputers;
		computerChangeTimer = initComputerChangeTimer;
	}

	function forwardLayout() as Void {
		for (var i = 0; i < computers.size(); i++) {
			computers[i].onLayout();
		}
	}

	private function nextComputer() as Void {
		++computerIdx;

		if(computerIdx>=computers.size())
		{
			computerIdx = 0;
		}
		computer = computers[computerIdx];
		needUpdateComputerInfo = true;
		needUpdateUnitText = true;
	}

	protected function updateComputerInfos() as Void {
		ComputerView.updateComputerInfos();

		if(needUpdateComputerInfo) {
			needUpdateComputerInfo = false;

			var newSmallFieldBigFont = computer.getSmallFieldBigFont();

			if(smallFieldBigFont != newSmallFieldBigFont)
			{
				smallFieldBigFont = newSmallFieldBigFont;
				needUpdateValueFont = true;
			}

			updateMaxValueStr();
		}
	}

	function compute(info as Activity.Info) as Void {

		if(computerChangeTimer!=0)
		{
			++computerChangeTime;
			if(computerChangeTime>=computerChangeTimer)
			{
				nextComputer();
				computerChangeTime = 0;
			}
		}

		ComputerView.compute(info);
	}
}

}