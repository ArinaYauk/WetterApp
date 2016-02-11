//
//  DailyTableViewCell.swift
//  WetterApp
//
//  Created by student on 11.02.16.
//  Copyright © 2016 student. All rights reserved.
//

import Foundation
import UIKit

class DailyTableViewCell: UITableViewCell, DailyServiceDelegate  {
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var conditionLabel: UILabel!
    @IBOutlet weak var minTempLabel: UILabel!
    @IBOutlet weak var maxTepmLabel: UILabel!
    
 /*   func configureCellForDailyForecast(daily: Daily){
        dateLabel.text = date
        iconImage.text =
        conditionLabel.text =
        minTempLabel.text =
        maxTepmLabel.text =
    
       
}*/
    func setDailyForecast(daily: Daily){
        print("City: \(daily.date) cond: \(daily.condition) min: \(daily.tempMin) max: \(daily.tempMax) image:  \(daily.image)")
        dateLabel.text = daily.date
        iconImage.image = UIImage(named: daily.image)
        conditionLabel.text = daily.condition
        minTempLabel.text = "\(daily.getTempInCelsiusMin())°"
        maxTepmLabel.text = "\(daily.getTempInCelsiusMax())°"
    }
    
    func weatherErrorWithMessage(message: String){
        
    }
}