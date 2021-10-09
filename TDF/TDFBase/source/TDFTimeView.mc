module TDFBase {

class TDFTimeView extends TDFBaseView {
	private var time;
	private var sec, min, hour;
	private var needUpdate = true;
	
	function initialize() {
        TDFBaseView.initialize();
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
        var newTime = info.elapsedTime / 1000;
        
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
     	TDFBaseView.onLayout(dc);
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
     	TDFBaseView.onUpdate(dc);
     }
}

}
