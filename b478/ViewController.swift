//
//  ViewController.swift
//  b478
//
//  Created by Yushi Nakai on 10/24/15.
//  Copyright © 2015 Yushi Nakai. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    var currentIndicator: TimeIndicator!
    @IBOutlet weak var breathIn: TimeIndicator!
    @IBOutlet weak var breathStop: TimeIndicator!
    @IBOutlet weak var breathOut: TimeIndicator!
    @IBOutlet weak var startStopButton: NSButton!
    var timer: NSTimer!
    override func viewDidLoad() {
        breathIn.duration = 4.0
        breathIn.next = breathStop

        breathStop.duration = 7.0
        breathStop.next = breathOut

        breathOut.duration = 8.0
        breathOut.next = breathIn
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func handleStartStop(sender: AnyObject) {
        print(startStopButton.stringValue)
        if startStopButton.title == "Start"{
            currentIndicator = breathIn
            breathIn.resetTime()
            timer = NSTimer.scheduledTimerWithTimeInterval(0.025, target: self, selector: "update", userInfo: nil, repeats: true)
            startStopButton.title = "Stop"
        }else{
            timer.invalidate()
            resetIndicator()
            startStopButton.title = "Start"
        }
    }
    func update(){
        if currentIndicator.finished == true{
            currentIndicator = currentIndicator.next
            currentIndicator.resetTime()
        }
        currentIndicator.update()
    }
    func resetIndicator(){
        breathIn.intValue = 0
        breathStop.intValue = 0
        breathOut.intValue = 0
    }
}

