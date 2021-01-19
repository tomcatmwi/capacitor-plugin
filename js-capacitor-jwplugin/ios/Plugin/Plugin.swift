import Foundation
import Capacitor


/**
 * Please read the Capacitor iOS Plugin Development Guide
 * here: https://capacitorjs.com/docs/plugins/ios
 */
@objc(JWPlayer)
public class JWPlayer: CAPPlugin {
    @objc func echo(_ call: CAPPluginCall) {
        let value = call.getString("value") ?? ""
        call.success([
            "value": value
        ])
    }

    @objc func initPlayer(_ call: CAPPluginCall) {
        DispatchQueue.main.async {
            let jwPlayerViewController = JWPlayerViewController.init(
                videoUrl: "http://media.w3.org/2010/05/sintel/trailer.mp4"
            )

            jwPlayerViewController.modalPresentationStyle = .fullScreen

            self.bridge.viewController.present(
                jwPlayerViewController,
                animated: true, completion: nil
            )
        }
    }
}
