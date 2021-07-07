//
//  Retiree.swift
//  Notification
//
//  Created by Harbros47 on 24.12.20.
//

import Foundation
import UIKit

// MARK: - Retiree
class Retiree {
    var pension: Double
    var averagePrice: Double
    let percent: Double = 100
    
    init(pension: Double, averagePrice: Double) {
        self.pension = pension
        self.averagePrice = averagePrice
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(retireeNotofocationPension(notification:)),
            name: .governmentPensionDidChangeNotification,
            object: nil
        )
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(retireeNotofocationAveragePrice(notification:)),
            name: .governmentAveragePriceDidChangeNotification,
            object: nil
        )
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(backGraund),
            name: UIApplication.didEnterBackgroundNotification,
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
        print("Пенсионер пошёл спать")
    }
    
    @objc func noBackGraund() {
        print("Пенсионер проснулся")
    }
    
    @objc func retireeNotofocationPension(notification: Notification) {
        guard let newPension = notification.userInfo?[KeysUserInfo.governmentPensionUserKey] as? Double else {return}
        let oldPension = pension
        pension = newPension
        print("pension у пенсионеров теперь \(pension)")
        let changePension = ((pension * percent) / oldPension) - percent
        
        if changePension > 0 &&
            changePension < percent {
            print("pension у пенсионера поднялась на \(changePension)%")
        } else if changePension < percent {
            print("pension у пенсионера упала на \(-changePension)%")
        }
    }
    
    @objc func retireeNotofocationAveragePrice(notification: Notification) {
        guard let newAveragePrice =
                notification.userInfo?[KeysUserInfo.governmentaveragePriceUserKey] as? Double else {return}
        let oldAveragePrice = averagePrice
        averagePrice = newAveragePrice
        let changeAveragePrice = ((averagePrice * percent) / oldAveragePrice) - percent
        
        if pension / oldAveragePrice < pension / averagePrice {
            print("Ура! теперь на таблетки будет хватать")
        } else {
            print("О нет! Как я теперь буду лекарства покупать? Мне же денег не хватит(")
        }
        if changeAveragePrice > 0 {
            print("averagePrice вырос на \(changeAveragePrice) % \n")
        } else {
            print("averagePrice упал на \(-changeAveragePrice) % \n")
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}
