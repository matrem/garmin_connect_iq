import Toybox.Activity;
import Toybox.Graphics;
import Toybox.Lang;
import Toybox.WatchUi;

module TDFBase {

class BaseView extends WatchUi.DataField {

	private var longField as Lang.Boolean = false;
	protected function getLongField() as Lang.Boolean { return longField; }

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

	protected var valueStr as Lang.String = "";
	protected var unit0Str as Lang.String = "";
	protected var unit1Str as Lang.String = "";
	protected var unit2Str as Lang.String = "";
	protected var smallFieldBigFont as Lang.Boolean = false;
	private var lightColor as Graphics.ColorValue = Graphics.COLOR_WHITE;
	private var darkColor as Graphics.ColorValue = Graphics.COLOR_BLACK;

	private var backgroundColor as Graphics.ColorType = Graphics.COLOR_TRANSPARENT;
	protected var needUpdateUnitText as Lang.Boolean = true;
	private var needUpdateUnitX as Lang.Boolean = true;

	protected function setAverageView() as Void	{
		lightColor = Graphics.COLOR_LT_GRAY;
		darkColor = Graphics.COLOR_DK_GRAY;
	}

	function initialize() {
		DataField.initialize();

		font100 = WatchUi.loadResource(Rez.Fonts.roboto100) as Graphics.FontReference;
		font64 = WatchUi.loadResource(Rez.Fonts.roboto64) as Graphics.FontReference;
		font54 = WatchUi.loadResource(Rez.Fonts.roboto54) as Graphics.FontReference;
		font46 = WatchUi.loadResource(Rez.Fonts.roboto46) as Graphics.FontReference;
		valueFont = font100;
	}

	function onLayout(dc as Dc) as Void {
		View.setLayout(Rez.Layouts.MainLayout(dc));

		background = View.findDrawableById("Background") as Background;
		valueText = View.findDrawableById("value") as WatchUi.Text;
		unit0Text = View.findDrawableById("unit0") as WatchUi.Text;
		unit1Text = View.findDrawableById("unit1") as WatchUi.Text;
		unit2Text = View.findDrawableById("unit2") as WatchUi.Text;

		var fieldHeight = dc.getHeight();
		var fieldWidth = dc.getWidth();

		longField = dc.getWidth() > fieldHeight * 3;

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

		var unitYCenter = (dc.getHeight() - Graphics.getFontHeight(Graphics.FONT_XTINY)) / 2.0;

		getUnit0Text().locY = unitYCenter - 9;
		getUnit1Text().locY = unitYCenter;
		getUnit2Text().locY = unitYCenter + 9;

		getValueText().setFont(valueFont);

		backgroundColor = Graphics.COLOR_TRANSPARENT;
		needUpdateUnitX = true;
		updateUnitX(dc);
    }

	private function updateUnitX(dc as Dc) as Void{
		if(needUpdateUnitX) {
			needUpdateUnitX = false;
			var textWidth = dc.getTextWidthInPixels(computeMaxValueText(), valueFont);
			var unitX = dc.getWidth() - (dc.getWidth() - textWidth) / 2.0 + 7;

			getUnit0Text().locX = unitX;
			getUnit1Text().locX = unitX;
			getUnit2Text().locX = unitX;
		}
	}

	protected function computeMaxValueText() as Lang.String {
		return "";
	}

	private function updateBackgroundColor() as Void {
		var newBackgroundColor = getBackgroundColor();

		if(backgroundColor != newBackgroundColor)
		{
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

	private function updateUnitText() as Void{
		if(needUpdateUnitText) {
			needUpdateUnitText = needUpdateUnitText;
			getUnit0Text().setText(unit0Str);
			getUnit1Text().setText(unit1Str);
			getUnit2Text().setText(unit2Str);
		}
	}

	function onUpdate(dc as Dc) as Void {
		updateBackgroundColor();
		updateUnitText();
		updateUnitX(dc);

		getValueText().setText(valueStr);

		View.onUpdate(dc);
	}

}

}
