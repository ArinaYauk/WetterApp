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
    func weatherErrorWithMessage(message: String)
}

class WeatherService {
    
   var delegate: WeatherServiceDelegate?
   
   func getWetherForCity(city: String){
    
      let cityEscaped = city.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLHostAllowedCharacterSet())
      let appid = "e13e41d66381c0f77368a2bd478ce818"
    
     let weatherSwiftUrl = NSURL(string: "http://api.openweathermap.org/data/2.5/weather?q=\(cityEscaped!.replaceUmlauteToEnglish())&appid=\(appid)")
    
    let request = NSURLRequest(URL: weatherSwiftUrl!)
    let config = NSURLSessionConfiguration.defaultSessionConfiguration()
    let session = NSURLSession(configuration: config)
    
    session.dataTaskWithRequest(request, completionHandler:{
        ( data: NSData?, response: NSURLResponse?, error: NSError?) in
        
        /*guard data != nil else{
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
        */
        if let httpResponse = response as? NSHTTPURLResponse {
            print("*******")
            print(httpResponse.statusCode)
            print("*******")
        
        //print Daten
        let json = JSON(data: data!)
           
        // Get the code: 401 or 200
         var status = 0
            
            if let cod = json["cod"].int{
              status = cod
            }else if let cod = json["cod"].string {
                status = Int(cod)!
            }
            //check status
            print("Weather satus: \(status)")
            
        if status == 200
        {
        let name = json ["name"].string
        let temp = json ["main"]["temp"].double
        let min = json ["main"]["temp_min"].double
        let max = json ["main"]["temp_max"].double
        let desc = json["weather"][0]["description"].string
        let image = json ["weather"][0]["icon"].string
    
        let weather = Weather(cityName: name!,
        temp: temp!,
        condition: desc!,
        tempMin: min!,
        tempMax: max!,
        image: image!)
        
        if self.delegate != nil {
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
            self.delegate?.setWeather(weather)
            })
         }
        }else if status == 404
        {
            //City not found
            
            if self.delegate != nil {
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.delegate?.weatherErrorWithMessage("City not found")
                })
            }
            
        }else {
            if self.delegate != nil {
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.delegate?.weatherErrorWithMessage("Something went wrong?")
                })
            }
        }
    }
                
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




