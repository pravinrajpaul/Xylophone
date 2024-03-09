//
//  ViewController.swift
//  Xylophone
//
//  Created by Pravin Raj Paul Raveendran on 09/03/24.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func keyTapped(_ sender: UIButton){
        playSound(fileName: (sender.titleLabel?.text)!)
    }
    
    
    func playSound(fileName:String) {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "wav") else
        {
            print("Unable to play the sound for \(fileName)")
            return
        }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.wav.rawValue)
            
            guard let player = player else {return}
            player.play()
            print("Played \(fileName)")
            
        } catch let error {
            print(error.localizedDescription)
        }
        
    }
}

