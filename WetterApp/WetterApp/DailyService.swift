//
//  DailyService.swift
//  WetterApp
//
//  Created by student on 11.02.16.
//  Copyright © 2016 student. All rights reserved.
//

import Foundation
protocol DailyServiceDelegate {
    
    func setDailyForecast(daily: Daily)
    func weatherErrorWithMessage(message: String)
}

class DailyService {
    
    var delegate: DailyServiceDelegate?
    
    func getDailyForecast(city: String){
        
        let cityEscaped = city.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLHostAllowedCharacterSet())
        let appid = "e13e41d66381c0f77368a2bd478ce818"
        
        let weatherSwiftUrl = NSURL(string: "http://api.openweathermap.org/data/2.5/forecast?q=\(cityEscaped!.replaceUmlauteToEnglish())&appid=\(appid)")
        print(weatherSwiftUrl)
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
                    let date = json ["list"][0]["dt_txt"].string
                    let min = json ["list"][0]["main"]["temp_min"].double
                    let max = json ["list"][0]["main"]["temp_max"].double
                    let desc = json ["list"][0]["weather"][0]["description"].string
                    let image = json ["list"][0]["weather"][0]["icon"].string
                    
                    let daily = Daily( date: date!, condition: desc!, tempMin: min!, tempMax: max!, image: image!)
                    if self.delegate != nil {
                        dispatch_async(dispatch_get_main_queue(), { () -> Void in
                            self.delegate?.setDailyForecast(daily)
                        })
                    }
                }else if status == 404
                {
                    //City not found
                    
                    if self.delegate != nil {
                        dispatch_async(dispatch_get_main_queue(), { () -> Void in
                            self.delegate?.weatherErrorWithMessage("Forecast for \(cityEscaped) not found")
                            
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
    
    func convertDateFormater(date: String) -> String
    {
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"//this your string date format
        dateFormatter.timeZone = NSTimeZone(name: "UTC")
        let date = dateFormatter.dateFromString(date)
        
        
        dateFormatter.dateFormat = "yyyy MMM EEEE HH:mm"///this is you want to convert format
        dateFormatter.timeZone = NSTimeZone(name: "UTC")
        let timeStamp = dateFormatter.stringFromDate(date!)
        
        
        return timeStamp
    }
}
