//
//  NotificationManager.swift
//  LotoSonuc
//
//  Created by Murat Baykor on 4.03.2020.
//  Copyright © 2020 Murat Baykor. All rights reserved.
//

import UIKit
import UserNotifications

struct NotificationManager {
    
    let center = UNUserNotificationCenter.current()
    
    func askPermission() {
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        center.requestAuthorization(options: options) { (didAllow, error) in
            if !didAllow {
                print("User has decline notifications")
            }
        }
    }
    
    func reminderNotifications(identifier: String, title:String, body:String, weekday: Int, hour: Int, minute: Int){
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        
        content.sound = .default
        
        var dateComponent = DateComponents()
        dateComponent.weekday = weekday
        dateComponent.hour = hour
        dateComponent.minute = minute
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponent, repeats: true)
        
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
        
        center.add(request)
    }
    
    func resultNotifications(identifier: String, title:String, body:String, weekday: Int, hour: Int, minute: Int){
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content.sound = .default
        
        var dateComponent = DateComponents()
        dateComponent.weekday = weekday
        dateComponent.hour = hour
        dateComponent.minute = minute
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponent, repeats: true)
        
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
        
        center.add(request)
    }
    

}
