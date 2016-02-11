//
//  Weather.swift
//  WetterApp
//
//  Created by student on 09.02.16.
//  Copyright © 2016 student. All rights reserved.
//

import Foundation

class Weather {
    let cityName: String
    let temp: Double
    let condition: String
    let humid: Int
    let windSpeed: Double
    let image: String
    
    init(cityName: String, temp: Double, condition: String, humid: Int, windSpeed: Double, image: String){
        self.cityName = cityName
        self.temp = temp
        self.condition = condition
        self.humid = humid
        self.windSpeed = windSpeed
        self.image = image
        
        
    }
    func getTempInCelsius() -> Double {
        let format = NSNumberFormatter()
        format.numberStyle = NSNumberFormatterStyle.DecimalStyle
        format.maximumFractionDigits = 1
        let tempInCelsius = self.temp - 273.15
        return Double(format.stringFromNumber(tempInCelsius)!)!
    }
    /*func getTempInCelsiusMin() -> Double {
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
    }*/
    
}