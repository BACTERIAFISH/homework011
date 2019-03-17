//
//  ViewController.swift
//  practice02
//
//  Created by FISH on 2019/3/10.
//  Copyright © 2019 FISH. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var setTimeLabel: UILabel!
    @IBOutlet weak var nowTimeLabel: UILabel!
    @IBOutlet weak var intervalTimeLabel: UILabel!
    
    var setTime = Date()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTimeLabel.text = timeFormatter(setTime)
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (_) in
            let nowString = self.timeFormatter(Date())
            self.nowTimeLabel.text = nowString
            
            let interval = Int(self.setTime.timeIntervalSinceNow)
            let second = interval % 60
            let minute = interval / 60 % 60
            let hour = interval / 3600 % 24
            let day = interval / (3600 * 24)
            self.intervalTimeLabel.text = "\(day)天 \(hour)小時 \(minute)分 \(second)秒"
        })
        
    }

    func timeFormatter(_ time: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy年MM月dd日 HH:mm:ss"
        return formatter.string(from: time)
    }
    
    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        setTime = sender.date
        setTimeLabel.text = timeFormatter(sender.date)
    }
    

}

