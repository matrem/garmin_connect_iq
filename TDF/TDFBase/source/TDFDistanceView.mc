module TDFBase {

class TDFDistanceView extends TDFBaseView {
	var distance = null;
	var km;
	var needUpdate;
	
	function initialize() {
        TDFBaseView.initialize();
        
        valueText = "---";
 		unit1Text = "";
		unit2Text = "m";
    }
    
    protected function computeMaxValueText() {
    	if(getLongField())
	 	{
	 		return "999.99";
	 	}
	 	else
	 	{
			return "999.9";
		}
    }
    
    function compute(info as Activity.Info) as Void {
        var newDistance = info.elapsedDistance;
        
        if(distance != newDistance)
        {
        	distance = newDistance;
        	
        	var newKm = false;
        	
	        if(distance!=null)
	        {	
		        newKm = distance >= 1000.0;
		        
		        if(newKm)
		        {
		        	distance /= 1000.0;
		        	needUpdate = true;
		        }
				else
				{
				 	valueText = distance.format("%d");
				}
		    }
		    else
		    {
		    	newKm = false;
		    	valueText = "---";
			}
			
			if(km != newKm)
			{
				km = newKm;
				needUpdateUnitText = true;
				if(km)
				{
					unit1Text = "K";
					unit2Text = "m";
				}
				else
				{
				 	unit1Text = "";
					unit2Text = "m";
				}
			}		
		}
    }
    
    function onLayout(dc as Dc) as Void {
    	needUpdate = distance!=null && km;
    	TDFBaseView.onLayout(dc);
    }
    
	function onUpdate(dc as Dc) as Void {
      	if(needUpdate)
        {		        
        	if(getLongField())
		 	{
		 		valueText = distance.format("%.2f");
		 	}
		 	else
		 	{
				valueText = distance.format("%.1f");
			}
			needUpdate = false;
	    }

		
        TDFBaseView.onUpdate(dc);
    }
}

}
