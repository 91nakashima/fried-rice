import UIKit
import Capacitor
import SwiftUI


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        
        
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
    }
    
    // Capacitor
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        return ApplicationDelegateProxy.shared.application(app, open: url, options: options)
    }
    
    // Capacitor
    func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool {
        return ApplicationDelegateProxy.shared.application(application, continue: userActivity, restorationHandler: restorationHandler)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        //        なんか⚠️が出る
        //        let statusBarRect = UIApplication.shared.statusBarFrame
        //        guard let touchPoint = event?.allTouches?.first?.location(in: self.window) else { return }
        
        //        if statusBarRect.contains(touchPoint) {
        //            NotificationCenter.default.post(name: .capacitorStatusBarTapped, object: nil)
        //        }
    }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        NotificationCenter.default.post(name: .capacitorDidRegisterForRemoteNotifications, object: deviceToken)
    }
    
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        NotificationCenter.default.post(name: .capacitorDidFailToRegisterForRemoteNotifications, object: error)
    }
}


extension AppDelegate: UNUserNotificationCenterDelegate {
    func setRemoteNotification(application: UIApplication) {
        // Delegateの設定
        UNUserNotificationCenter.current().delegate = self
        // プッシュ通知受信の許可を求める。
        let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
        UNUserNotificationCenter.current().requestAuthorization(options: authOptions, completionHandler: {_, _ in })
        application.registerForRemoteNotifications()
    }
    
    // アプリがフォアグラウンドで起動している際にプッシュ通知が届いたら呼ばれる。
    // func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
    //     completionHandler([.alert, .sound, .badge])
    // }
    
    // プッシュ通知に対しタッチ等のアクションを行った時に呼ばれる。
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
    }
}
