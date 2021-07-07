//
//  Notification.swift
//  Notification
//
//  Created by Harbros47 on 24.12.20.
//

import Foundation
extension Notification.Name {
    static let governmentTaxLevelDidChangeNotification =
        Notification.Name("governmentTaxLevelDidChangeNotification")
    static let governmentSalaryDidChangeNotification =
        Notification.Name("governmentSalaryDidChangeNotification")
    static let governmentPensionDidChangeNotification =
        Notification.Name("governmentPensionDidChangeNotification")
    static let governmentAveragePriceDidChangeNotification =
        Notification.Name("governmentaveragePriceDidChangeNotification")
    
    static let analogueDidChangeNotification =
        Notification.Name("governmentApplicationDidChangeNotification")
    static let analogueFunc2DidChangeNotification =
        Notification.Name("analogueApplicationFunc2DidChangeNotification")
    static let analogueFunc3DidChangeNotification =
        Notification.Name("analogueApplicationFunc3DidChangeNotification")
    static let analoguePersistentContainerDidChangeNotification =
        Notification.Name("analogueApplicationPersistentContainerDidChangeNotification")
    static let analogueSaveContextDidChangeNotification =
        Notification.Name("analogueApplicationSaveContextDidChangeNotification")
}

enum KeysUserInfo {
    static let governmentTaxLevelUserKey = "governmentTaxLevelDidChangeNotification"
    static let governmentSalaryUserKey = "governmentSalaryDidChangeNotification"
    static let governmentPensionUserKey = "governmentPensionDidChangeNotification"
    static let governmentaveragePriceUserKey = "governmentaveragePriceDidChangeNotification"
}
