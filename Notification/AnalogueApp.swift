//
//  AnalogueApp.swift
//  Notification
//
//  Created by Harbros47 on 28.12.20.
//

import CoreData
import UIKit

class AnalogueApp {
    
    init() {
        NotificationCenter.default.addObserver(
                    self,
                    selector: #selector(applicationNotification),
                    name: .analogueDidChangeNotification,
                    object: nil
                    )
        NotificationCenter.default.addObserver(
                    self,
                    selector: #selector(application2Notification),
                    name: .analogueFunc2DidChangeNotification,
                    object: nil
                    )
        NotificationCenter.default.addObserver(
                    self,
                    selector: #selector(application3Notification),
                    name: .analogueFunc3DidChangeNotification,
                    object: nil
                    )
        NotificationCenter.default.addObserver(
                    self,
                    selector: #selector(persistentContainerNotification),
                    name: .analoguePersistentContainerDidChangeNotification,
                    object: nil
                    )
        NotificationCenter.default.addObserver(
                    self,
                    selector: #selector(saveContextNotification),
                    name: .analogueSaveContextDidChangeNotification ,
                    object: nil
                    )
    }
    
    @objc func applicationNotification() {
          print("---------application Notification слушает")
      }
    
    @objc func application2Notification() {
          print("---------application func 2 Notification слушает")
      }
    
    @objc func application3Notification() {
          print("---------application func 3 Notification слушает")
      }
    
    @objc func persistentContainerNotification() {
          print("---------persistentContainer Notification слушает")
      }
    
    @objc func saveContextNotification() {
          print("---------saveContext Notification слушает")
      }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}
