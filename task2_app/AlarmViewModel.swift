//
//  AlarmViewModel.swift
//  task2_app
//
//  Created by Tolgahan Sonmez on 28.08.2023.
//

import Foundation
import UserNotifications

class AlarmViewModel: NSObject, UNUserNotificationCenterDelegate {
    
    var selectedDate: Date = Date()

    func setAlarm(completion: @escaping (Bool) -> Void) {
        let content = UNMutableNotificationContent()
        content.title = "Alarm"
        content.body = "Wake Up!!!"
        content.sound = UNNotificationSound.init(named: UNNotificationSoundName(rawValue: "smooth-ac-guitar-loop-93bpm-137706.mp3"))
        
        
        let calendar = Calendar.current
        let components = calendar.dateComponents([.hour, .minute], from: selectedDate)
        let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: true)

        let request = UNNotificationRequest(identifier: "alarmNotification", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Error adding notification request: \(error)")
                completion(false)
            } else {
                print("Notification request added successfully.")
                completion(true)
            }
        }
    }
}

