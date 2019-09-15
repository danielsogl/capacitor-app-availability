import Foundation
import Capacitor

/**
 * Please read the Capacitor iOS Plugin Development Guide
 * here: https://capacitor.ionicframework.com/docs/plugins/ios
 */
@objc(AppAvailability)
public class AppAvailability: CAPPlugin {
    
    @objc func check(_ call: CAPPluginCall) {
        let appScheme = call.getString("sheme") ?? ""
        let appUrl = URL(string: appScheme)
        
        if UIApplication.shared.canOpenURL(appUrl! as URL) {
            call.resolve(["value": true]);
        } else {
            call.resolve(["value": false]);
        }
    }
    
    @objc func open(_ call: CAPPluginCall) {
        let appScheme = call.getString("sheme") ?? ""
        let appUrl = URL(string: appScheme)
        
        if UIApplication.shared.canOpenURL(appUrl! as URL) {
            UIApplication.shared.open(appUrl!)
            call.resolve()
        } else {
            call.error("App is not installed. Call check function before trying to open an app");
        }
    }
}
