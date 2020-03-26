import UIKit
import Flutter
import Firebase
import GoogleMaps

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    // Use Firebase library to configure APIs
    GMSServices.provideAPIKey("AIzaSyCr96ks9JZMjenw1OiUtEOVHbBgQNWA2Wc")
    FirebaseApp.configure()
    
    setupPushNotifications(for: application)
    
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
  
    private func setupPushNotifications(for application: UIApplication) {
        let center = UNUserNotificationCenter.current()
        center.delegate = self
        center.requestAuthorization(options: [.alert, .sound]) { (granted, error) in
            //Do Nothing
        }
        
        application.registerForRemoteNotifications()
    }
}
