//
//  Doctor.swift
//  Notification
//
//  Created by Harbros47 on 24.12.20.
//

import Foundation
import UIKit

// MARK: - Doctor
class Doctor {
    var salary: Double
    var averagePrice: Double
    let percent: Double = 100
    
    init(salary: Double, averagePrice: Double) {
        self.salary = salary
        self.averagePrice = averagePrice
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(doctorNotofocationSalary(notification:)),
            name: .governmentSalaryDidChangeNotification,
            object: nil
        )
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(doctorNotofocationAveragePrice(notification:)),
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
        print("Доктор пошёл спать")
    }
    
    @objc func noBackGraund() {
        print("Доктор проснулся")
    }
    
    @objc func doctorNotofocationSalary(notification: Notification) {
        guard let newSalary = notification.userInfo?[KeysUserInfo.governmentSalaryUserKey] as? Double else { return }
        let oldSalary = salary
        salary = newSalary
        print("salary у доктора \(salary)")
        let changeSalary = ((salary * percent) / oldSalary) - percent
        
        if changeSalary > 0 &&
            changeSalary < percent {
            print("salary у доктора поднялась на \(changeSalary)%")
        } else if changeSalary < percent {
            print("salary у доктора упала на \(-changeSalary)%")
        }
    }
    
    @objc func doctorNotofocationAveragePrice(notification: Notification) {
        guard let newAveragePrice =
                notification.userInfo?[KeysUserInfo.governmentaveragePriceUserKey] as? Double else { return }
        let oldAveragePrice = averagePrice
        averagePrice = newAveragePrice
        let changeAveragePrice = ((averagePrice * percent) / oldAveragePrice) - percent
        
        if salary / oldAveragePrice < salary / averagePrice {
            print("Ура! Цены на товары упали")
        } else {
            print("О нет! Цены на товары поднялись(")
        }
        if (changeAveragePrice - percent) > 0 {
            print("averagePrice вырос на \(changeAveragePrice) % \n")
        } else {
            print("averagePrice упал на \(-changeAveragePrice) % \n")
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}
