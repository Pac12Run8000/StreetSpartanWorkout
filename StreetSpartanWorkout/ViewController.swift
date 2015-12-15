//
//  ViewController.swift
//  StreetSpartanWorkout
//
//  Created by MIchelle Grover on 12/14/15.
//  Copyright © 2015 Norbert Grover. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var timer = NSTimer()
    var minutes:Int = 0
    var seconds:Int = 0
    var fractions:Int = 0
    var startStopWatch:Bool = true
    var stopWatchString:String = ""
    //let arrayWorkout[String, String] = ["", ""]
    
    
    @IBOutlet weak var lblTimeDisplay: UILabel!
    @IBOutlet weak var btnStartStop: UIButton!
    @IBOutlet weak var btnReset: UIButton!
    @IBOutlet weak var tblExercise: UITableView!
    
    @IBAction func btnPressedStartStop(sender: AnyObject) {
        if(startStopWatch == true) {
            timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: Selector("UpdateStopWatch"), userInfo: nil, repeats: true)
            startStopWatch = false
            self.btnStartStop.setTitle("Stop", forState: UIControlState.Normal)
        } else {
            timer.invalidate()
            startStopWatch = true
            self.btnStartStop.setTitle("Start", forState: UIControlState.Normal)
        }
    }
    func UpdateStopWatch() {
        fractions += 1
        if (fractions == 100) {
            seconds += 1
            fractions = 0
        }
        
        if (seconds == 60) {
            minutes += 1
            seconds = 0
        }
        let fractionString = fractions > 9 ? "\(fractions)" : "0\(fractions)"
        let secondString = seconds > 9 ? "\(seconds)" : "0\(seconds)"
        let minutesString = minutes > 9 ? "\(minutes)" : "0\(minutes)"
        stopWatchString = "\(minutesString):\(secondString):\(fractionString)"
        self.lblTimeDisplay.text = stopWatchString
    }
    
    @IBAction func btnPressedReset(sender: AnyObject) {
        fractions = 0
        seconds = 0
        minutes = 0
        stopWatchString = "00:00:00"
        lblTimeDisplay.text = stopWatchString
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.btnStartStop.layer.borderWidth = 3
        self.btnStartStop.layer.borderColor = UIColor.blackColor().CGColor
        self.btnStartStop.layer.cornerRadius = self.btnStartStop.frame.size.width / 2
       
        self.btnReset.layer.borderWidth = 3
        self.btnReset.layer.borderColor = UIColor.blackColor().CGColor
        self.btnReset.layer.cornerRadius = self.btnReset.frame.size.width / 2
        lblTimeDisplay.text = "00:00:00"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "Cell")
        //cell.backgroundColor = self.view.backgroundColor
        cell.textLabel!.text = "3 sets of 10 reps [30 second rest]"
        cell.detailTextLabel?.text = "Diamond Push Up"
        return cell
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }


}

