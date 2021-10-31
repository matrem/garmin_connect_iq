import Toybox.Activity;
import Toybox.Graphics;
import Toybox.Lang;
import Toybox.WatchUi;

module TDFBase {

class ComputerView extends WatchUi.DataField {

	private var longField as Lang.Boolean = false;
	private var fieldHeight as Lang.Number = 0;
	private var fieldWidth as Lang.Number = 0;

	private var font100 as Graphics.FontReference;
	private var font64 as Graphics.FontReference;
	private var font54 as Graphics.FontReference;
	private var font46 as Graphics.FontReference;
	private var valueFont as Graphics.FontReference;

	private var background as Background?;
	private function getBackground() as Background { return background; }
	private var valueText  as WatchUi.Text?;
	private function getValueText() as WatchUi.Text { return valueText; }
	private var unit0Text as WatchUi.Text?;
	private function getUnit0Text() as WatchUi.Text { return unit0Text; }
	private var unit1Text as WatchUi.Text?;
	private function getUnit1Text() as WatchUi.Text { return unit1Text; }
	private var unit2Text as WatchUi.Text?;
	private function getUnit2Text() as WatchUi.Text { return unit2Text; }

	private var lightColor as Graphics.ColorValue = Graphics.COLOR_WHITE;
	private var darkColor as Graphics.ColorValue = Graphics.COLOR_BLACK;

	private var backgroundColor as Graphics.ColorType = Graphics.COLOR_TRANSPARENT;
	private var needUpdateUnitX as Lang.Boolean = true;
	private var maxValueStr as Lang.String = "";

	protected var needUpdateValueFont as Lang.Boolean = true;
	protected var smallFieldBigFont as Lang.Boolean = false;
	protected var computer as Computer.ComputerBase;
	protected  var needUpdateUnitText as Lang.Boolean = true;

	function initialize( initComputer as Computer.ComputerBase ) {
		DataField.initialize();

		computer = initComputer;

		font100 = WatchUi.loadResource(Rez.Fonts.roboto100) as Graphics.FontReference;
		font64 = WatchUi.loadResource(Rez.Fonts.roboto64) as Graphics.FontReference;
		font54 = WatchUi.loadResource(Rez.Fonts.roboto54) as Graphics.FontReference;
		font46 = WatchUi.loadResource(Rez.Fonts.roboto46) as Graphics.FontReference;
		valueFont = font100;
	}

	function onLayout(dc as Dc) as Void {
		//System.println("onLayout");

		View.setLayout(Rez.Layouts.MainLayout(dc));

		background = View.findDrawableById("Background") as Background;
		valueText = View.findDrawableById("value") as WatchUi.Text;
		unit0Text = View.findDrawableById("unit0") as WatchUi.Text;
		unit1Text = View.findDrawableById("unit1") as WatchUi.Text;
		unit2Text = View.findDrawableById("unit2") as WatchUi.Text;

		backgroundColor = Graphics.COLOR_TRANSPARENT;

		fieldHeight = dc.getHeight();
		fieldWidth = dc.getWidth();
		longField = fieldWidth > fieldHeight * 3;

		//Unit Y
		var unitYCenter = (fieldHeight - Graphics.getFontHeight(Graphics.FONT_XTINY)) / 2.0;

		getUnit0Text().locY = unitYCenter - 10;
		getUnit1Text().locY = unitYCenter;
		getUnit2Text().locY = unitYCenter + 10;

		updateMaxValueStr();

		needUpdateValueFont = true;
		needUpdateUnitX = true;
		needUpdateUnitText = true;

		forwardLayout();
	}

	function forwardLayout() as Void
	{
		computer.onLayout();
	}

	protected function updateMaxValueStr() as Void {
		var newMaxValueStr = computer.computeMaxValueStr(longField);
		if(maxValueStr != newMaxValueStr)
		{
			maxValueStr = newMaxValueStr;
			needUpdateUnitX = true;
		}
	}

	private function updateValueFont() as Void
	{
		if(needUpdateValueFont)
		{
			needUpdateValueFont = false;
			//126 => big => 100px
			//62 => small => 50px
			//
			//322 => 1F => big
			//160 => 2F => big
			//105 => 3F => small
			//78 => 4F => small

			valueFont = font64;
			if(fieldHeight > 100)
			{
				valueFont = font100;
			}
			else if(fieldWidth < 200)
			{
				if(smallFieldBigFont)
				{
					valueFont = font54;
				}
				else
				{
					valueFont = font46;
				}
			}

			getValueText().locY = (fieldHeight - Graphics.getFontHeight(valueFont)) / 2.0;
			getValueText().setFont(valueFont);

			needUpdateUnitX = true;
		}
	}

	private function updateUnitX(dc as Dc) as Void{
		if(needUpdateUnitX) {
			needUpdateUnitX = false;

			var textWidth = dc.getTextWidthInPixels(maxValueStr, valueFont);
			var unitX = fieldWidth - (fieldWidth - textWidth) / 2.0 + 7;

			//System.println("updateUnitX : " + unitX + " from maxValueStr : " + maxValueStr);

			getUnit0Text().locX = unitX;
			getUnit1Text().locX = unitX;
			getUnit2Text().locX = unitX;
		}
	}

	private function updateBackgroundColor() as Void {
		var newBackgroundColor = getBackgroundColor();

		if(backgroundColor != newBackgroundColor)
		{
			//System.println("updateBackgroundColor");

			backgroundColor = newBackgroundColor;

			getBackground().setColor(backgroundColor);

			var color = darkColor;
			if (backgroundColor == Graphics.COLOR_BLACK) {
				color = lightColor;
			}

			getValueText().setColor(color);
			getUnit0Text().setColor(color);
			getUnit1Text().setColor(color);
			getUnit2Text().setColor(color);
		}
	}

	// private function logUpdateUnitText() as Void
	// {
	// 	System.println("updateUnitText");
	// 	System.println("unit0str : " + computer.getUnit0Str());
	// 	System.println("unit1str : " + computer.getUnit1Str());
	// 	System.println("unit2str : " + computer.getUnit2Str());
	// }

	private function updateUnitText() as Void{
		//System.println("should updateUnitText : " + (needUpdateUnitText ? "true" : "false"));

		if(needUpdateUnitText) {
			needUpdateUnitText = false;
			//logUpdateUnitText();
			getUnit0Text().setText(computer.getUnit0Str());
			getUnit1Text().setText(computer.getUnit1Str());
			getUnit2Text().setText(computer.getUnit2Str());
		}
	}

	protected function updateComputerInfos() as Void {
		needUpdateUnitText = needUpdateUnitText || computer.getNeedUpdateUnitText();
	}

	function onUpdate(dc as Dc) as Void {
		//System.println("onUpdate");

		updateComputerInfos();
		updateBackgroundColor();
		updateUnitText();
		updateValueFont();
		updateUnitX(dc);

		computer.onUpdate(longField);

		getValueText().setText(computer.getValueStr());

		View.onUpdate(dc);
	}

	function compute(info as Activity.Info) as Void {
		computer.compute(info);
	}
}

}