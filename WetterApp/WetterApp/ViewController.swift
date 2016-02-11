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
    let dailyService   = DailyService()
    
    @IBOutlet weak var WelcomeLabel: UILabel!

    @IBOutlet weak var WeatherIcons: UIImageView!
    @IBOutlet weak var WeatherLabel: UILabel!
    @IBOutlet weak var CitynameLabel: UILabel!
    @IBOutlet weak var TempLabel: UILabel!
    @IBOutlet weak var HumidityLabel: UILabel!
    @IBOutlet weak var WindSpeedLabel: UILabel!
    
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
                self.HumidityLabel.hidden = false
                self.WindSpeedLabel.hidden = false
                self.WelcomeLabel.hidden = true
                //self.CitynameLabel.text = textField?.text
                let cityName = textField?.text
                self.weatherService.getWetherForCity(cityName!)
                self.dailyService.getDailyForecast(cityName!)
                
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
        print("City: \(weather.cityName) temp: \(weather.temp) cond: \(weather.condition) hum: \(weather.humid) wind: \(weather.windSpeed) image:  \(weather.image)")
       
            CitynameLabel.text = weather.cityName.replaceUmlauteFromEnglish()
        
        WeatherLabel.text = weather.condition
        TempLabel.text = "\(weather.getTempInCelsius())°"
        HumidityLabel.text = "Hum: \(weather.humid)%"
        WindSpeedLabel.text = "Wind: \(weather.windSpeed) km/h"
        WeatherIcons.image = UIImage(named: weather.image)
        }
    //display an error message from weather service
    func weatherErrorWithMessage(message: String){
        print("Weather Error Message: \(message)")
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .Alert)
        let cancel = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Default, handler: nil)
        alert.addAction(cancel)
        self.presentViewController(alert, animated: true, completion: nil)
        
    }
    
        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view, typically from a nib.
            CitynameLabel.hidden = true
            WeatherLabel.hidden = true
            WeatherIcons.hidden = true
            TempLabel.hidden = true
            HumidityLabel.hidden = true
            WindSpeedLabel.hidden = true

            self.weatherService.delegate = self
            
        }
        
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
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
