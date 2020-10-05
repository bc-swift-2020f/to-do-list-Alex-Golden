//
//  LocalNotificationManager.swift
//  ToDoList
//
//  Created by Alex Golden on 10/4/20.
//

import Foundation
import UserNotifications

struct LocalNotificationManager {
    static func autherizeLocalNotifications() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { (granted, error)
            in
            guard error == nil else {
                print("error \(error!.localizedDescription)")
                return
            }
            if granted {
                print("notification authorization granted")
            } else {
                print("the user denied notifications")
                //TODO  put an alert in here telling the user what to do
            }
        }
    }
  static func setCalendarNotification(title: String, subtitle: String, body: String, badge: NSNumber?, sound: UNNotificationSound?, date: Date) -> String {
        //create content
        let content = UNMutableNotificationContent()
        content.title = title
        content.subtitle = subtitle
        content.body = body
        content.sound = sound
        content.badge = badge
        
        //create trigger
        var dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute],from: date)
        dateComponents.second = 00
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        
        //create request
        let notificationID = UUID().uuidString
        let request = UNNotificationRequest(identifier: notificationID, content: content, trigger: trigger)
        
        //register request with notification center
        UNUserNotificationCenter.current().add(request) { (error) in
            if let error = error {
                print("error \(error.localizedDescription) adding notification request went wrong")
            } else {
                print("notification scheduled \(notificationID), title \(content.title)")
            }
            
        }
        return notificationID
    }
}
