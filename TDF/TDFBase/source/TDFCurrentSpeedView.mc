module TDFBase {

class TDFCurrentSpeedView extends TDFSpeedBaseView {
	function initialize() {
        TDFSpeedBaseView.initialize();
    }
    
    function computeSpeed(info as Activity.Info) as Lang.Float{
        return info.currentSpeed;
    }
}

}
