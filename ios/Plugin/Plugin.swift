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

        if(appScheme != "") {
            let appUrl = URL(string: appScheme)

            DispatchQueue.main.async {
                if UIApplication.shared.canOpenURL(appUrl! as URL) {
                    call.resolve(["value": true]);
                } else {
                    call.resolve(["value": false]);
                }
            }
        } else {
            call.error("Property 'sheme' is required")
        }
    }

    @objc func open(_ call: CAPPluginCall) {
        let appScheme = call.getString("sheme") ?? ""

        if(appScheme != "") {
            let appUrl = URL(string: appScheme)

            DispatchQueue.main.async {
                if UIApplication.shared.canOpenURL(appUrl! as URL) {
                    UIApplication.shared.open(appUrl!)
                    call.resolve()
                } else {
                    call.error("App is not installed. Call check function before trying to open an app");
                }
            }
        } else {
            call.error("Property 'sheme' is required")
        }
    }
}
