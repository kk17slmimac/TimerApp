//
//  ViewController.swift
//  timer
//
//  Created by 久保田慧 on 2018/10/30.
//  Copyright © 2018年 KeiKubota. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var timerLabel: UILabel!
    
    var timer: Timer!
    var timer_sec: Float = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //タイマーの作成、始動
        //Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @objc func updateTimer(_ timer:Timer){
        self.timer_sec += 0.1
        self.timerLabel.text = String(format: "%.1f", timer_sec)
        //format: 小数点第一位まで
    }

    //再生ボタン
    @IBAction func startTimer(_ sender: Any) {
        //再生ボタンを押すとタイマー作成、始動
        //self.timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
        // 動作中のタイマーを1つに保つために、 timer が存在しない場合だけ、タイマーを生成して動作させる
        if self.timer == nil {
            self.timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
    }
    }
    
    
    //一時停止
    @IBAction func pauseTimer(_ sender: Any) {
    //タイマーを破棄
      //  self.timer.invalidate()
        if self.timer != nil {
            self.timer.invalidate()
            // 現在のタイマーを破棄する
            self.timer = nil
            // startTimer() の timer == nil で判断するために、 timer = nil としておく
        }
    }
    
    
        
    //リセット
        
            
        
    @IBAction func resetTimer(_ sender: Any) {
    //リセットボタンを押すとタイマーの時間を0に
        //self.timer_sec = 0
        //self.timerLabel.text = String(format: "%.1f", self.timer_sec)
        self.timer_sec = 0
        self.timerLabel.text = String(format: "%.1f", self.timer_sec)
        
        if self.timer != nil {
            self.timer.invalidate()   // 現在のタイマーを破棄する
            self.timer = nil          // startTimer() の timer == nil で判断するために、 timer = nil としておく
        }
        
        
    }
    
    
    
}



