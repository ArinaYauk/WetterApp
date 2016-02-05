

//  ViewController.swift
//  Application
//
//  Created by student on 11.12.15.
//  Copyright © 2015 student. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
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
        let weatherSwiftUrl = NSURL(string: "http://api.openweathermap.org/data/2.5/forecast?q=Wuerzburg,uk&appid=e13e41d66381c0f77368a2bd478ce818")
        //forecast, weather
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
}


