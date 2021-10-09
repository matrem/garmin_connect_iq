module TDFBase {

class TDFAverageSpeedView extends TDFSpeedBaseView {
	function initialize() {
        TDFSpeedBaseView.initialize();
        setAverageView();
    }
    
    function computeSpeed(info as Activity.Info) as Lang.Float{
        return info.averageSpeed;
    }
}

}
