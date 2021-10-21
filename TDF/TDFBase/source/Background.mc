import Toybox.Application;
import Toybox.Graphics;
import Toybox.WatchUi;

module TDFBase {

class Background extends WatchUi.Drawable {

	hidden var mColor as ColorType;

	function initialize() {
		var dictionary = {
			:identifier => "Background"
		};

		Drawable.initialize(dictionary);

		mColor = Graphics.COLOR_WHITE;
	}

	function setColor(color as ColorType) as Void {
		mColor = color;
	}

	function draw(dc as Dc) as Void {
		dc.setColor(Graphics.COLOR_TRANSPARENT, mColor);
		dc.clear();
	}
}

}
