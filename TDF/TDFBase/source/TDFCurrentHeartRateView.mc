module TDFBase {

class TDFCurrentHeartRateView extends TDFRateBaseView {
	function initialize() {
        TDFRateBaseView.initialize(); 
    }
    
    function computeRate(info as Activity.Info) as Lang.Float {
        return info.currentHeartRate ;
    }
}

}
