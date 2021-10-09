module TDFBase {

class TDFCadenceView extends TDFRateBaseView {
	function initialize() {
        TDFRateBaseView.initialize();        
        unit0Text = "r";
    }
    
    function computeRate(info as Activity.Info) as Lang.Float {
        return info.currentCadence;
    }
}

}