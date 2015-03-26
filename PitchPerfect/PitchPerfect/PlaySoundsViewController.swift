//
//  PlaySoundsViewController.swift
//  PitchPerfect
//
//  Created by Steve Davis on 3/17/15.
//  Copyright (c) 2015 Steve. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {

    var audioPlayer:AVAudioPlayer!
    var receivedAudio: RecordedAudio!
    var audioEngine: AVAudioEngine!
    var audioFile: AVAudioFile!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //setup audioPlayer and audioEngine
        audioPlayer = AVAudioPlayer(contentsOfURL: receivedAudio.filePathUrl, error: nil);
        audioPlayer.enableRate = true;
        
        audioEngine = AVAudioEngine();
        audioFile = AVAudioFile(forReading: receivedAudio.filePathUrl, error: nil)
    }
    
    @IBAction func playFastAudio(sender: UIButton) {
        //play audio fast
        //reset audio engine (Task 3)
        audioEngine.stop()
        audioEngine.reset()
        
        playAudioWithRate(2.0)
    }
    
    @IBAction func playSlowAudio(sender: UIButton) {
        //play audio slowly
        //reset audio engine (Task 3)
        audioEngine.stop()
        audioEngine.reset()

        playAudioWithRate(0.5)
        
    }
    
    @IBAction func playChipmunkAudio(sender: UIButton) {
        //play audio like a chipmunk
        playAudioWithVariablePitch(1000)
        }
    
    @IBAction func playDarthVaderAudio(sender: UIButton) {
        playAudioWithVariablePitch(-1000)
    }
    func playAudioWithVariablePitch(pitch: Float) {
        audioPlayer.stop()
        audioEngine.stop()
        audioEngine.reset()
        
        var audioPlayerNode = AVAudioPlayerNode()
        audioEngine.attachNode(audioPlayerNode)
        
        var changePitchEffect = AVAudioUnitTimePitch()
        changePitchEffect.pitch = pitch
        audioEngine.attachNode(changePitchEffect)
        
        audioEngine.connect(audioPlayerNode, to: changePitchEffect, format: nil)
        audioEngine.connect(changePitchEffect, to: audioEngine.outputNode, format: nil)
        
        audioPlayerNode.scheduleFile(audioFile, atTime: nil, completionHandler: nil)
        audioEngine.startAndReturnError(nil)
        
        audioPlayerNode.play()
        

    }
    func playAudioWithRate(rate: Float) {
        audioPlayer.stop()
        audioPlayer.rate = rate
        audioPlayer.currentTime = 0.0
        audioPlayer.play()
    }
    
    @IBAction func stopAudio(sender: UIButton) {
        //stop playing audio
        audioPlayer.stop()
        audioPlayer.currentTime = 0.0
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
