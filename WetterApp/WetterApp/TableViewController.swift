//
//  TableViewController.swift
//  WetterApp
//
//  Created by student on 08.02.16.
//  Copyright © 2016 student. All rights reserved.
//

import UIKit

struct InfoBit {
    
    var Info1: String
    var Info2: String
    var Info3: String
}

class TableViewController: UITableViewController { //, UITableViewDataSource  { <- in Swift 2.0 nicht mehr erforderlich
    
    var InfoBits: [InfoBit] = [
        InfoBit(Info1: "Info 1", Info2: "Text 1.1", Info3: "Text 1.2"),
        InfoBit(Info1: "Info 2", Info2: "Text 2.1", Info3: "Text 2.2"),
        InfoBit(Info1: "Info 3", Info2: "Text 3.1", Info3: "Text 3.2"),
        InfoBit(Info1: "Info 4", Info2: "Text 4.1", Info3: "Text 4.2")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        //var cell = tableView.dequeueReusableCellWithIdentifier("cell") as BspCell
        let cell = tableView.dequeueReusableCellWithIdentifier("BspCell", forIndexPath: indexPath) as! BspCell
        
        cell.Label1.text = InfoBits[indexPath.row].Info1
        cell.Label2.text = InfoBits[indexPath.row].Info2
        cell.Label3.text = InfoBits[indexPath.row].Info3
        return cell
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return InfoBits.count
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

