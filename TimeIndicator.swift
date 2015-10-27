//
//  TimeIndicator.swift
//  b478
//
//  Created by Yushi Nakai on 10/25/15.
//  Copyright © 2015 Yushi Nakai. All rights reserved.
//

import Cocoa

class TimeIndicator: NSLevelIndicator {
    var time: NSDate!
    var duration: Double!
    var finished: Bool!
    var next: TimeIndicator!
    func resetTime(){
        time = NSDate()
        intValue = 0
        finished = false
    }
    func update(){
        let elapsed = NSDate().timeIntervalSinceDate(time)
        let rate = 100 * elapsed / duration
        intValue = Int32(maxValue * rate / 100)
        if intValue > Int32(duration * 100) {
            finished = true
            intValue = 0
        }
    }
}