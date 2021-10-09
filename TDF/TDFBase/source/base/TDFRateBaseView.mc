module TDFBase {

class TDFRateBaseView extends TDFBaseView {
	private var rate = null;
	
	function initialize() {
        TDFBaseView.initialize();
       
        unit0Text = "b";
        unit1Text = "p";
		unit2Text = "m";
		
		valueText = "---";
		
		smallFieldBigFont = true;
    }
    
    protected function computeMaxValueText() {
	 	return "999";
    }
    
    function compute(info as Activity.Info) as Void {
        var newRate = computeRate(info);
        
        if(rate != newRate)
        {
        	rate = newRate;
        	
	        if(rate == null)
	 		{
	 			valueText = "---";
	 		}
	 		else
	 		{
				valueText = rate.format("%d");
			}
		}    		
    }
	
	function computeRate(info as Activity.Info) as Lang.Float {
    	return 0.0f;
    }
}

}
