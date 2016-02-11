//
//  DailyViewController.swift
//  WetterApp
//
//  Created by student on 10.02.16.
//  Copyright © 2016 student. All rights reserved.
//


import UIKit

class DailyViewController: UITableViewController {
    

    private var forecast: [Daily] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forecast.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let daily = forecast[indexPath.row]
        let cell = tableView.dequeueReusableCellWithIdentifier("SecondCell") as! DailyTableViewCell
        cell.setDailyForecast(daily)
        cell.backgroundColor = UIColor.clearColor()
        return cell
    }
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }


    /*var dailies = [Daily]()


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
      //  self.dailies = [Daily(name: "Sonnig", temp: 23.0), Daily(name: "Wolkig", temp: 23.0), Daily(name: "Neblich", temp: 23.0), Daily(name: "Regen", temp: 22.0)]
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dailies.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
       let cell = self.tableView.dequeueReusableCellWithIdentifier("SecondCell", forIndexPath: indexPath) as UITableViewCell
        var daily : Daily
        
        daily = dailies[indexPath.row]
        
        cell.textLabel?.text = daily.name
       //cell.textLabel?.text = "\(daily.temp)"
        
        return cell
        
    }*/
}
    
