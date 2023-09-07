//
//  AppDelegate.swift
//  task2_app
//
//  Created by Tolgahan Sonmez on 28.08.2023.
//

import UIKit
import UserNotifications
import AVFAudio
import AVFoundation

@main
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {


    var window: UIWindow?
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) { (granted, error) in
      if granted {
        print("Notification permission granted.")
      } else {
        print("Notification permission denied.")
      }
    }
    UNUserNotificationCenter.current().delegate = self
    self.window = UIWindow(frame: UIScreen.main.bounds)
    let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
    let viewController = storyboard.instantiateViewController(withIdentifier: "AlarmViewController") as! AlarmViewController
    self.window?.rootViewController = UINavigationController(rootViewController: viewController)
    self.window?.makeKeyAndVisible()
    return true
  }

  // Bildirim geldiğinde çağrılacak fonksiyon
  func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
      
      let application = UIApplication.shared
      if( application.applicationState == UIApplication.State.inactive) {
      let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
      let vc = storyboard.instantiateViewController(withIdentifier: "AlarmStopViewController") as? AlarmStopViewController
      self.window?.rootViewController = vc
    }
  }
}

