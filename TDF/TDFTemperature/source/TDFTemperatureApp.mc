import Toybox.Application;
import Toybox.Lang;
import Toybox.WatchUi;
import Toybox.System;
import Toybox.Time;
import Toybox.Background;
using Toybox.Time.Gregorian;
using Toybox.Application.Storage;

(:background)
class TDFTemperatureApp extends Application.AppBase {

    function initialize() {
        System.println(hashCode() + " - App.initialize");
        AppBase.initialize();
    }

    // onStart() is called on application start up
    function onStart(state as Dictionary?) as Void {
        System.println(hashCode() + " - App.onStart");
    }

    // onStop() is called when your application is exiting
    function onStop(state as Dictionary?) as Void {
        System.println(hashCode() + " - App.onStop");
    }

    //! Return the initial view of your application here
    function getInitialView() as Array<Views or InputDelegates>? {
        System.println(hashCode() + " - App.getInitialView");

        var time = Time.Gregorian.info(Background.getLastTemporalEventTime(), Time.FORMAT_MEDIUM);
        System.println(hashCode() + " - last time : " + time.hour + "h" + time.min + ":" + + time.sec);
        //Background.registerForTemporalEvent(Time.now());
        Background.registerForTemporalEvent(new Time.Duration(5 * 60));

        return [ new TDFTemperatureView() ] as Array<Views or InputDelegates>;
    }

    function getServiceDelegate() as  Lang.Array<System.ServiceDelegate>{
        return [new MyServiceDelegate()];
    }

    function onBackgroundData(data as Application.PersistableType) as Void 
    {
        System.println(hashCode() + " - App.onBackgroundData");
        Application.Storage.setValue("temperature", data); 
    }
}

function getApp() as TDFTemperatureApp {
    return Application.getApp() as TDFTemperatureApp;
}

(:background)
class MyServiceDelegate extends System.ServiceDelegate {
    function initialize() {
        System.ServiceDelegate.initialize();
        System.println(hashCode() + " - service.initialize");
    }

    function onTemporalEvent() {
        System.println(hashCode() + " - service.onTemporalEvent");
        var info = Sensor.getInfo();
        System.println(hashCode() + " - temp : " + info.temperature);
        Background.exit(info.temperature);        
    }
}