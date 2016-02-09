//
//  WeatherService.swift
//  WetterApp
//
//  Created by student on 09.02.16.
//  Copyright © 2016 student. All rights reserved.
//

import Foundation

protocol WeatherServiceDelegate {
    
    func setWeather(weather: Weather)
}

class WeatherService {
    
   var delegate: WeatherServiceDelegate?
   
   func getWetherForCity(city: String){
    

        let weatherSwiftUrl = NSURL(string: "http://api.openweathermap.org/data/2.5/weather?q=Wuerzburg,uk&appid=e13e41d66381c0f77368a2bd478ce818")
        
        let request = NSURLRequest(URL: weatherSwiftUrl!)
        let config = NSURLSessionConfiguration.defaultSessionConfiguration()
        let session = NSURLSession(configuration: config)
        
        session.dataTaskWithRequest(request, completionHandler:{
            ( data, response, error) in
            
            guard data != nil else{
                return
            }
            var jsonResult:NSDictionary!
            do{
                jsonResult = try (NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers) as? NSDictionary)!
            }catch{
                print(error)
            }
            guard let jsonResultUnwrapped = jsonResult else{
                return
            }
            print(jsonResultUnwrapped)
            
        }) .resume()
    }

    
    
    
       // print("Weather Service city: \(city)")
        //request weather data
        // wait...
        //process data
  /*  let weather = Weather(cityName: city, temp: 25, condition: "Cloudly", tempMinMax: 23.0,  image: "wolken")
    
    if delegate != nil {
        delegate?.setWeather(weather)
    }*/
        
        
        
    }
    

