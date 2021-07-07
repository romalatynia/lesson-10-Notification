//
//  ViewController.swift
//  Notification
//
//  Created by Harbros47 on 23.12.20.
//

import UIKit

class ViewController: UIViewController {

   private let goverment = Government(taxLevel: 5, salary: 1000, pension: 500, averagePrice: 10)
    
    private let doctor = Doctor(salary: 900, averagePrice: 13)
    private let retiree = Retiree(pension: 500, averagePrice: 13)
    private let businessman = Businessman(taxLevel: 5, averagePrice: 13)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(govermentNotofocation(notification:)),
            name: .governmentSalaryDidChangeNotification,
            object: nil
            )
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(govermentNotofocation(notification:)),
            name: .governmentTaxLevelDidChangeNotification,
            object: nil
            )
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(govermentNotofocation(notification:)),
            name: .governmentPensionDidChangeNotification,
            object: nil
            )

        retiree.pension = goverment.pension
        retiree.averagePrice = goverment.averagePrice
        
        doctor.salary = goverment.salary
        doctor.salary = goverment.averagePrice
        
        businessman.taxLevel = goverment.taxLevel
        businessman.averagePrice = goverment.averagePrice
        
        goverment.taxLevel = 5.5
        goverment.salary = 1100
        goverment.averagePrice = 15
        goverment.pension = 550
        
        goverment.taxLevel = 5.5
        goverment.salary = 1050
        goverment.pension = 600
        goverment.averagePrice = 10
        
        goverment.taxLevel = 6.0
        goverment.salary = 1150
        goverment.pension = 50
        goverment.averagePrice = 20
        
        goverment.taxLevel = 7.0
        goverment.salary = 900
        goverment.pension = 700
        
    }
    
    @objc func govermentNotofocation(notification: Notification) {
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}
