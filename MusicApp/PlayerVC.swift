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
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var fowardButton: UIButton!
    @IBOutlet weak var rewindButton: UIButton!
    @IBOutlet weak var scrubber: UISlider!
    
    var audioPlayer: AVAudioPlayer = AVAudioPlayer()
    
    @IBAction func playAction(sender: UIButton){
        if (playButton.image(for: .normal) == #imageLiteral(resourceName: "pause")) {
            playButton.setImage(#imageLiteral(resourceName: "play"), for: .normal)
            audioPlayer.pause()
        } else {
            playButton.setImage(#imageLiteral(resourceName: "pause"), for: .normal)
            audioPlayer.prepareToPlay()
            scrubber.maximumValue = Float(audioPlayer.duration)
            scrubber.value = 0.0
            Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(PlayerVC.updateScrubber), userInfo: nil, repeats: true)
            audioPlayer.play()
        }
    }
    
    @IBAction func rewindAction(sender: UIButton){
        if (audioPlayer.isPlaying) {
            audioPlayer.currentTime = 0
            audioPlayer.play()
        } else {
            audioPlayer.currentTime = 0
        }
    }
    
    @IBAction func audioTimeSlider(_ slider: UISlider) {
        audioPlayer.stop()
        audioPlayer.currentTime = TimeInterval(scrubber.value)
        audioPlayer.prepareToPlay()
        audioPlayer.play()
    }
    
    func updateScrubber () {
        scrubber.value = Float(audioPlayer.currentTime)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //send choosen song to path
    
        do {
            let audioPath = Bundle.main.path(forResource: "song", ofType: "mp3")
            try audioPlayer = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath!) as URL)
            
            if (audioPlayer.isPlaying) {
                playButton.setImage(#imageLiteral(resourceName: "pause"), for: .normal)
                scrubber.maximumValue = Float(audioPlayer.duration)
                 Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(PlayerVC.updateScrubber), userInfo: nil, repeats: true)
            }
            
        } catch {
            //ERROR
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
