//
//  PlayerVC.swift
//  MusicApp
//
//  Created by Mitchell, Angel on 7/20/17.
//  Copyright © 2017 Britt&Gelly. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

class PlayerVC : UIViewController {
 
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var songTitleLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    
    var audioPlayer: AVAudioPlayer = AVAudioPlayer()
    
    @IBAction func playAction(sender: UIButton){
        audioPlayer.play()
    }
    
    @IBAction func pauseAction(sender: UIButton){
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            let audioPath = Bundle.main.path(forResource: "song", ofType: "mp3")
            try audioPlayer = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath!) as URL)
        } catch {
            //ERROR
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
