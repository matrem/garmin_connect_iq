module TDF {

class App extends TDFBase.App {

    function initialize() {
        TDFBase.App.initialize();
    }

    //! Return the initial view of your application here
    function getInitialView() as Array<Views or InputDelegates>? {
        return [ new TDFBase.TimePlayView() ] as Array<Views or InputDelegates>;
    }
}

function getApp() as App {
    return Application.getApp() as App;
}

}