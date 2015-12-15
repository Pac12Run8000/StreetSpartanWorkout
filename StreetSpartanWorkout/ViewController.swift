//
//  ViewController.swift
//  StreetSpartanWorkout
//
//  Created by MIchelle Grover on 12/14/15.
//  Copyright © 2015 Norbert Grover. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblTimeDisplay: UILabel!
    @IBOutlet weak var btnStartStop: UIButton!
    @IBOutlet weak var btnReset: UIButton!
    @IBOutlet weak var tblExercise: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.btnStartStop.layer.borderWidth = 3
        self.btnStartStop.layer.borderColor = UIColor.blackColor().CGColor
        self.btnStartStop.layer.cornerRadius = self.btnStartStop.frame.size.width / 2
       
        self.btnReset.layer.borderWidth = 3
        self.btnReset.layer.borderColor = UIColor.blackColor().CGColor
        self.btnReset.layer.cornerRadius = self.btnReset.frame.size.width / 2
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

