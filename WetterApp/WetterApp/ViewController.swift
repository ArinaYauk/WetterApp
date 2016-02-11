//
//  ViewController.swift
//  WetterApp
//
//  Created by student on 08.02.16.
//  Copyright © 2016 student. All rights reserved.
//

import UIKit

class ViewController: UIViewController, WeatherServiceDelegate {
    
    
    let weatherService = WeatherService()
    
    
    @IBOutlet weak var BackslashLabel: UILabel!
    @IBOutlet weak var WelcomeLabel: UILabel!

    @IBOutlet weak var WeatherIcons: UIImageView!
    @IBOutlet weak var WeatherLabel: UILabel!
    @IBOutlet weak var CitynameLabel: UILabel!
    @IBOutlet weak var TempLabel: UILabel!
    @IBOutlet weak var MinLabel: UILabel!
    
    
    @IBOutlet weak var MaxLabel: UILabel!
    
    @IBAction func searchCity(sender: UIButton) {
        print("City Button Tepped")
        openCityAlert()
    }
    
    func openCityAlert(){
        //Create Alter Controller
        let alert =  UIAlertController(title: "City",
            message: "Enter city name",
            preferredStyle: UIAlertControllerStyle.Alert)
        
        //Create Cancel Action
        let cancel = UIAlertAction(title: "Cancel",
            style: UIAlertActionStyle.Cancel,
            handler: nil)
        
        alert.addAction(cancel)
        //Create Ok Action
        let ok = UIAlertAction(title: "OK",
            style: UIAlertActionStyle.Default) {
                (action: UIAlertAction) -> Void in
            print("OK")
                let textField = alert.textFields?[0]
                print(textField?.text!)
                self.CitynameLabel.hidden = false
                self.WeatherLabel.hidden = false
                self.WeatherIcons.hidden = false
                self.TempLabel.hidden = false
                self.MinLabel.hidden = false
                self.MaxLabel.hidden = false
                self.WelcomeLabel.hidden = true
                self.BackslashLabel.hidden = false
                self.CitynameLabel.text = textField?.text
                let cityName = textField?.text
                self.weatherService.getWetherForCity(cityName!)
                
        }
        alert.addAction(ok)
        
        
        //Add text field
        alert.addTextFieldWithConfigurationHandler {(textField: UITextField) -> Void in
            textField.placeholder = "City Name"
        }
        
        // Present Alert Controller
          self.presentViewController(alert, animated: true, completion: nil)
        }
    
    // Weather Service Delegate
    func setWeather(weather: Weather) {
        print("***Set Weather")
        print("City: \(weather.cityName) temp: \(weather.temp) cond: \(weather.condition) min: \(weather.tempMin) max: \(weather.tempMax) image:  \(weather.image)")
       
            CitynameLabel.text = weather.cityName.replaceUmlauteFromEnglish()
        
        WeatherLabel.text = weather.condition
       // WeatherIcons.image = weather.image
        TempLabel.text = "\(weather.getTempInCelsius())°"
        MinLabel.text = "\(weather.getTempInCelsiusMin())°"
        MaxLabel.text = "\(weather.getTempInCelsiusMax())°"
            WeatherIcons.image = UIImage(named: weather.image)
        }
    //display an error message from weather service
    func weatherErrorWithMessage(message: String){
        print("Weather Error Message: \(message)")
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .Alert)
        let cancel = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Default, handler: nil)
        alert.addAction(cancel)
        self.presentViewController(alert, animated: true, completion: nil)
        self.BackslashLabel.hidden = true
        
    }
    
    
    

    
        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view, typically from a nib.
            CitynameLabel.hidden = true
            WeatherLabel.hidden = true
            WeatherIcons.hidden = true
            TempLabel.hidden = true
            MinLabel.hidden = true
            MaxLabel.hidden = true
            BackslashLabel.hidden = true

            self.weatherService.delegate = self
            
        }
        
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
    
    
        
     /*   override func viewDidAppear(animated: Bool) {
            super.viewDidAppear(animated)
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
    /*func setLabels(weatherData:NSData){
        var jsonError: NSError?
        let json = NSJSONSerialization.JSONObjectWithData(weatherData, options:) as NSDictionary
        if let name = json["name"] as? String{
        CitynameLabel.text = name}
        
    }
    
        if let main = json["main"] as? NSDictionary {
        if let temp = main ["temp"] as? Double {
            TempLabel.text = String(format: "4.1f", temp)
        }
        }
    }
*/*/
}
extension String {
    func replaceUmlauteToEnglish() -> String {
        return self.stringByReplacingOccurrencesOfString("ä", withString: "ae")
            .stringByReplacingOccurrencesOfString("ö", withString: "oe")
            .stringByReplacingOccurrencesOfString("ü", withString: "ue")
            .stringByReplacingOccurrencesOfString("Ä", withString: "AE")
            .stringByReplacingOccurrencesOfString("Ö", withString: "OE")
            .stringByReplacingOccurrencesOfString("Ü", withString: "UE")
    }
    
    func replaceUmlauteFromEnglish() -> String {
        return self.stringByReplacingOccurrencesOfString("ae", withString: "ä")
            .stringByReplacingOccurrencesOfString("oe", withString: "ö")
            .stringByReplacingOccurrencesOfString("ue", withString: "ü")
            .stringByReplacingOccurrencesOfString("AE", withString: "Ä")
            .stringByReplacingOccurrencesOfString("OE", withString: "Ö")
            .stringByReplacingOccurrencesOfString("UE", withString: "Ü")
    }
    
}
