//
//  TempInCelsius.swift
//  WetterApp
//
//  Created by student on 11.02.16.
//  Copyright © 2016 student. All rights reserved.
//

import Foundation

class TempInCelsius{
    let temp 

func getTempInCelsius() -> Double {
    let format = NSNumberFormatter()
    format.numberStyle = NSNumberFormatterStyle.DecimalStyle
    format.maximumFractionDigits = 1
    let tempInCelsius = self.temp - 273.15
    return Double(format.stringFromNumber(tempInCelsius)!)!
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