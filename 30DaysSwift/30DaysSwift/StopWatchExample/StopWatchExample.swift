//
//  StopWatchExample.swift
//  30DaysSwift
//
//  Created by LuzhiChao on 17/1/10.
//  Copyright © 2017年 LuzhiChao. All rights reserved.
//

import UIKit

class StopWatchExample: UIViewController {
   
  
    @IBOutlet weak var pauseBtn: UIButton!
    @IBOutlet weak var playBtn: UIButton!
    @IBOutlet weak var label: UILabel!
    
    var counter = 0.0
    var timer = Foundation.Timer()
    var isPlaying = false
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        timeReset()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = String(counter)
    }

    @IBAction func reset(_ sender: AnyObject) {
        timeReset()
    }
    
    func timeReset() {
        timer.invalidate()
        isPlaying = false
        counter = 0
        label.text = String(counter)
        playBtn.isEnabled = true
        pauseBtn.isEnabled = true
    }
    
    @IBAction func play(_ sender: AnyObject) {
        if isPlaying {
            return
        }
        playBtn.isEnabled = false
        pauseBtn.isEnabled = true
        timer = Foundation.Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(StopWatchExample.updateTime), userInfo: nil, repeats: true)
        isPlaying = true
    }
    
    func updateTime() {
        counter = counter + 0.1
        label.text = String(format: "%.1f", counter)
    }
    
    @IBAction func pause(_ sender: AnyObject) {
        playBtn.isEnabled = true
        pauseBtn.isEnabled = false
        timer.invalidate()
        isPlaying = false
    }


}
