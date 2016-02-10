//
//  HourlyViewController.swift
//  WetterApp
//
//  Created by student on 09.02.16.
//  Copyright © 2016 student. All rights reserved.
//
import UIKit


class HourlyViewController: UITableViewController {

  var hourlies = [Hourly]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.hourlies = [Hourly(name: "Sonnig", temp: "23.0"), Hourly(name: "Wolkig", temp: "23.0"), Hourly(name: "Neblich", temp: "23.0"), Hourly(name: "Regen", temp: "22.0")]
        //self.hourlies = [Hourly(temp: 25.0), Hourly(temp: 23.0), Hourly(temp: 21.0), Hourly(name: 29.0)]
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.hourlies.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
        var hourly : Hourly
        
        hourly =  hourlies[indexPath.row]
        
        cell.textLabel?.text = hourly.name
     //  cell.textLabel?.text = hourly.image
        cell.textLabel?.text = hourly.temp
        
            return cell
        
    }
    
}