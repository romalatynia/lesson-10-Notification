//
//  Businessman.swift
//  Notification
//
//  Created by Harbros47 on 24.12.20.
//

import Foundation
import UIKit

// MARK: - Businessman
class Businessman {
    var taxLevel: Double
    var averagePrice: Double
    let percent: Double = 100
    
    init(taxLevel: Double, averagePrice: Double) {
        self.taxLevel = taxLevel
        self.averagePrice = averagePrice
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(businessmanNotofocationTaxLevel(notification:)),
            name: .governmentTaxLevelDidChangeNotification,
            object: nil
        )
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(businessmanNotofocationAveragePrice(notification:)),
            name: .governmentAveragePriceDidChangeNotification,
            object: nil
        )
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(backGraund),
            name: UIApplication.willResignActiveNotification,
            object: nil
        )
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(noBackGraund),
            name: UIApplication.didBecomeActiveNotification,
            object: nil
        )
    }
    
    @objc func backGraund() {
        print("Бизнесмен пошёл спать")
    }
    
    @objc func noBackGraund() {
        print("Бизнесмен проснулся")
    }
    
    @objc func businessmanNotofocationTaxLevel(notification: Notification) {
        guard let newTaxLevel = notification.userInfo?[KeysUserInfo.governmentTaxLevelUserKey] as? Double else {return}
        let oldTaxLevel = taxLevel
        taxLevel = newTaxLevel
        print("taxLevel у бизнесменов теперь \(taxLevel)")
        let changeTaxLevel = ((taxLevel * percent) / oldTaxLevel) - percent
        
        if changeTaxLevel > 0 {
            print("taxLevel вырос на \(changeTaxLevel) % \n")
        } else {
            print("taxLevel упал на \(changeTaxLevel) % \n")
        }
    }
    
    @objc func businessmanNotofocationAveragePrice(notification: Notification) {
        guard let newAveragePrice =
                notification.userInfo?[KeysUserInfo.governmentaveragePriceUserKey] as? Double else {return}
        let oldAveragePrice = averagePrice
        averagePrice = newAveragePrice
        print("averagePrice у бизнесменов taxLevel теперь \(averagePrice)")
        let changeAveragePrice = ((averagePrice * percent) / oldAveragePrice) - percent
        
        if changeAveragePrice > 0 {
            print("averagePrice вырос на \(changeAveragePrice)% \n")
        } else {
            print("averagePrice упал на \(-changeAveragePrice)% \n")
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}
