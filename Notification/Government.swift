//
//  State.swift
//  Notification
//
//  Created by Harbros47 on 23.12.20.
//


import UIKit

// MARK: - Government
class Government {
    
    var taxLevel: Double {
        didSet {
            NotificationCenter.default.post(
                name: .governmentTaxLevelDidChangeNotification,
                object: nil,
                userInfo: [KeysUserInfo.governmentTaxLevelUserKey: taxLevel]
            )
        }
    }
    
    var salary: Double {
        didSet {
            NotificationCenter.default.post(
                name: .governmentSalaryDidChangeNotification,
                object: nil,
                userInfo: [KeysUserInfo.governmentSalaryUserKey: salary]
            )
        }
    }

    var pension: Double {
        didSet {
            NotificationCenter.default.post(
                name: .governmentPensionDidChangeNotification,
                object: nil,
                userInfo: [KeysUserInfo.governmentPensionUserKey: pension]
            )
        }
    }
    
    var averagePrice: Double {
        didSet {
            NotificationCenter.default.post(
                            name: .governmentAveragePriceDidChangeNotification,
                            object: nil,
                            userInfo: [KeysUserInfo.governmentaveragePriceUserKey: averagePrice]
            )
        }
    }
    
    init(
        taxLevel: Double,
        salary: Double,
        pension: Double,
        averagePrice: Double
    ) {
        self.taxLevel = taxLevel
        self.salary = salary
        self.pension = pension
        self.averagePrice = averagePrice
    }
}
