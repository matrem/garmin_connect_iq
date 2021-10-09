import Toybox.Activity;
import Toybox.Graphics;
import Toybox.Lang;
import Toybox.WatchUi;

module TDFBase {

class TDFBaseView extends WatchUi.DataField {

	private var longField;
	protected function getLongField() { return longField; }
	
	private var font100;
	private var font64;
	private var font54;
	private var font46;
	private var background;
	private var value;
	private var unit0;
	private var unit1;
	private var unit2;
	private var valueFont;
	
	protected var valueText;
	protected var unit0Text = "";
	protected var unit1Text = "";
	protected var unit2Text = "";
	protected var smallFieldBigFont = false;
	private var lightColor = Graphics.COLOR_WHITE;
	private var darkColor = Graphics.COLOR_BLACK;
	
	private var previousBackgroundColor = null;
	protected var needUpdateUnitText = true;
	private var needUpdateUnitX = true;
		
	protected function setAverageView() as Void	{
		lightColor = Graphics.COLOR_LT_GRAY;
        darkColor = Graphics.COLOR_DK_GRAY;
    }
    
    function initialize() {
        DataField.initialize();
        
        font100 = WatchUi.loadResource(Rez.Fonts.roboto100);         
        font64 = WatchUi.loadResource(Rez.Fonts.roboto64);
        font54 = WatchUi.loadResource(Rez.Fonts.roboto54);
        font46 = WatchUi.loadResource(Rez.Fonts.roboto46);
    }

    function onLayout(dc as Dc) as Void {

	    View.setLayout(Rez.Layouts.MainLayout(dc));
	    
	    background = View.findDrawableById("Background");
	    value = View.findDrawableById("value");
	    unit0 = View.findDrawableById("unit0");	    
	    unit1 = View.findDrawableById("unit1");
	    unit2 = View.findDrawableById("unit2");
	    
	    var text = value as Text;
	    
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
	    
	    value.locY = (fieldHeight - Graphics.getFontHeight(valueFont)) / 2.0;
	    
	    var unitYCenter = (dc.getHeight() - Graphics.getFontHeight(Graphics.FONT_XTINY)) / 2.0;
	    
	    unit0.locY = unitYCenter - 9;	   
	    unit1.locY = unitYCenter;
	    unit2.locY = unitYCenter + 9;
	    
	    text.setFont(valueFont);
	    
	    previousBackgroundColor = null;
	    needUpdateUnitX = true;
	    updateUnitX(dc);
    }
    
    private function updateUnitX(dc as Dc){
    	if(needUpdateUnitX) {
	    	needUpdateUnitX = false;
	    	var textWidth = dc.getTextWidthInPixels(computeMaxValueText(), valueFont);
	        var unitX = dc.getWidth() - (dc.getWidth() - textWidth) / 2.0 + 7;
	        unit0.locX = unitX;
	        unit1.locX = unitX;
	      	unit2.locX = unitX;
      	}
    }
    
    protected function computeMaxValueText() as Lang.String {
    	return "";
    }
    
    private function updateBackgroundColor() {
    	var backgroundColor = getBackgroundColor();
    	
    	if(backgroundColor != previousBackgroundColor)
    	{
    		previousBackgroundColor = backgroundColor;
    		
	        background.setColor(backgroundColor);
	
			var color = darkColor;
	        if (backgroundColor == Graphics.COLOR_BLACK) {
	           color = lightColor;           
	        } 
	
			value.setColor(color);
			unit0.setColor(color);
	        unit1.setColor(color);
	        unit2.setColor(color);
        }
    }
    
    private function updateUnitText() {
    	if(needUpdateUnitText) {
    	    needUpdateUnitText = needUpdateUnitText;	    	
	        unit0.setText(unit0Text);
		    unit1.setText(unit1Text);
			unit2.setText(unit2Text);
		}
    }

    function onUpdate(dc as Dc) as Void {
        updateBackgroundColor();             
        updateUnitText();
		updateUnitX(dc);
		
		value.setText(valueText);

        View.onUpdate(dc);
    }

}

}
