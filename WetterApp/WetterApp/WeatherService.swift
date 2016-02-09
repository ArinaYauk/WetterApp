//
//  WeatherService.swift
//  WetterApp
//
//  Created by student on 09.02.16.
//  Copyright © 2016 student. All rights reserved.
//

import Foundation

protocol WeatherServiceDelegate {
    
    func setWeather()
}


class WeatherService {
    
   var delegate: WeatherServiceDelegate?
   
   func getWetherForCity(city: String){
        print("Weather Service city: \(city)")
        //request weather data
        // wait...
        
        
        
        
    }
    
}
