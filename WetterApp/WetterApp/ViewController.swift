//
//  ViewController.swift
//  WetterApp
//
//  Created by student on 08.02.16.
//  Copyright © 2016 student. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var WeatherIcons: UIImageView!
    @IBOutlet weak var WeatherLabel: UILabel!
    @IBOutlet weak var CitynameLabel: UILabel!
    @IBOutlet weak var TempLabel: UILabel!
    @IBOutlet weak var MinMaxLabel: UILabel!
    
    

        
        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view, typically from a nib.
        }
        
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
        
        override func viewDidAppear(animated: Bool) {
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
*/
}
