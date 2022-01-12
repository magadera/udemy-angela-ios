//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation // 시청각 기초 모듈

class ViewController: UIViewController {

    var soundPlayer: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func tabButton(_ sender: UIButton) {
        
        sender.alpha = 0.5
        print("start")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            // Bring's sender's opacity back up to fully opaque
            sender.alpha = 1.0
            print("end")
        }
        
        print(sender.currentTitle!)
//        print(sender.titleLabel?.text ?? "값 없음")
//        print(sender.title(for: .normal)!)
        playSound(title: sender.currentTitle!)
        print("sound")
        
    }
    
    func playSound(title: String) {
        let path = Bundle.main.path(forResource: "\(title).wav", ofType:nil)!
        let url = URL(fileURLWithPath: path)

        do {
            soundPlayer = try AVAudioPlayer(contentsOf: url)
            soundPlayer?.play()
        } catch {
            // couldn't load file :(
        }
    }
    
    

}

