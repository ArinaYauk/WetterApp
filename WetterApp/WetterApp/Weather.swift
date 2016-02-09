//
//  Weather.swift
//  WetterApp
//
//  Created by student on 09.02.16.
//  Copyright © 2016 student. All rights reserved.
//

import Foundation

struct Weather {
    let cityName: String
    let temp: Double
    let condition: String
    let tempMinMax: Double
    let image: String
    
    init(cityName: String, temp: Double, condition: String, tempMinMax: Double, image: String){
        self.cityName = cityName
        self.temp = temp
        self.condition = condition
        self.tempMinMax = tempMinMax
        self.image = image
        
        
    }
    
}