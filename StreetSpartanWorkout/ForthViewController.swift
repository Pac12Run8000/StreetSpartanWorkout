//
//  ForthViewController.swift
//  StreetSpartanWorkout
//
//  Created by MIchelle Grover on 12/26/15.
//  Copyright © 2015 Norbert Grover. All rights reserved.
//

import UIKit
import AVFoundation

class ForthViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var timer = NSTimer()
    var minutes:Int = 0
    var seconds:Int = 0
    var fractions:Int = 0
    var startStopWatch:Bool = true
    var stopWatchString:String = ""
    let arrayWorkout:[String] = ["8 Sets x 3 Chin Ups", "3 Sets x 5 Pull Ups", "8 Sets x 3 Stiff Legged Deadlifts", "8 Sets x 3 Dead Lifts", "8 Sets x 3 Military Press", "8 Sets x 3 Bench Press", "8 Sets x 3 Dips","", "", ""]
    
    
    //audio variable
    var audioPlayer: AVAudioPlayer!
    
    
    @IBOutlet weak var lblTimerOutPut: UILabel!
    @IBOutlet weak var btnStartStop: UIButton!
    @IBOutlet weak var btnReset: UIButton!
    @IBOutlet weak var tblExercise: UITableView!
    @IBAction func btnPressedStart(sender: AnyObject) {
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
        
        if (minutes == 1 && seconds == 30) {
            timer.invalidate()
            self.playVes()
            let myAlert = UIAlertController(title: "Workout Alert", message: "^0 seconds have passed. Times Up!", preferredStyle: UIAlertControllerStyle.Alert)
            let myAction = UIAlertAction(title: "Start your next set", style: UIAlertActionStyle.Cancel, handler: { (ACTION) -> Void in
                
                if (self.startStopWatch == false) {
                    self.btnStartStop.setTitle("Start", forState: UIControlState.Normal)
                    self.startStopWatch = true
                    self.audioPlayer.stop()
                    
                }
            })
            myAlert.addAction(myAction)
            self.presentViewController(myAlert, animated: true, completion: nil)
        }
        
        let fractionString = fractions > 9 ? "\(fractions)" : "0\(fractions)"
        let secondString = seconds > 9 ? "\(seconds)" : "0\(seconds)"
        let minutesString = minutes > 9 ? "\(minutes)" : "0\(minutes)"
        stopWatchString = "\(minutesString):\(secondString):\(fractionString)"
        self.lblTimerOutPut.text = stopWatchString
    }
    
    //Audio issues
    func playVes() {
        do {
            self.audioPlayer =  try AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("72244__benboncan__alarm", ofType: "wav")!))
            self.audioPlayer.play()
            
        } catch {
            print("Error")
        }
    }
    
    @IBAction func btnPressedReset(sender: AnyObject) {
        fractions = 0
        seconds = 0
        minutes = 0
        stopWatchString = "00:00:00"
        lblTimerOutPut.text = stopWatchString
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.layer.backgroundColor = UIColor(red:0.24, green:0.40, blue:0.69, alpha:1.0).CGColor
        self.tblExercise.layer.cornerRadius = 10
        self.btnStartStop.layer.borderWidth = 2
        self.btnStartStop.layer.borderColor = UIColor.blackColor().CGColor
        self.btnStartStop.layer.cornerRadius = self.btnStartStop.frame.size.width / 2
        
        self.btnReset.layer.borderWidth = 2
        self.btnReset.layer.borderColor = UIColor.blackColor().CGColor
        self.btnReset.layer.cornerRadius = self.btnReset.frame.size.width / 2
        lblTimerOutPut.text = "00:00:00"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "Cell")
        cell.textLabel!.text = arrayWorkout[indexPath.row]
        cell.detailTextLabel?.text = "[90 second rest]"
        cell.backgroundColor = UIColor(red:0.60, green:0.71, blue:0.14, alpha:1.0)
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayWorkout.count
    }

   

}
