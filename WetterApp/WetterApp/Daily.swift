//
//  Daily.swift
//  WetterApp
//
//  Created by student on 10.02.16.
//  Copyright © 2016 student. All rights reserved.
//

import Foundation

struct Daily{
    let date: String
    let condition: String
    let tempMin: Double
    let tempMax: Double
    let image: String
    
    init(date: String, condition: String, tempMin: Double, tempMax: Double, image: String){
        self.date = date
        self.condition = condition
        self.tempMin = tempMin
        self.tempMax = tempMax
        self.image = image
        
        
    }
    
    func getTempInCelsiusMin() -> Double {
        let format = NSNumberFormatter()
        format.numberStyle = NSNumberFormatterStyle.DecimalStyle
        format.maximumFractionDigits = 1
        let tempInCelsiusMin = self.tempMin - 273.15
        return Double(format.stringFromNumber(tempInCelsiusMin)!)!
    }
    func getTempInCelsiusMax() -> Double {
        let format = NSNumberFormatter()
        format.numberStyle = NSNumberFormatterStyle.DecimalStyle
        format.maximumFractionDigits = 1
        let tempInCelsiusMax = self.tempMax - 273.15
        return Double(format.stringFromNumber(tempInCelsiusMax)!)!
    }
}