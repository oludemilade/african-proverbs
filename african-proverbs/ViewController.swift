//
//  ViewController.swift
//  african-proverbs
//
//  Created by Oludemilade Raji on 6/4/20.
//  Copyright © 2020 DonRajon. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var background_image: UIImageView!
    @IBOutlet weak var proverb_label: UILabel!
    
    @IBOutlet weak var musicBottonLabel: UIButton!
    var audioPlayer = AVAudioPlayer()
    
    @IBAction func randomize_quote(_ sender: Any) {
        launch_image()
        launch_proverb()
    }
    
    @IBAction func musicButtonAction(_ sender: Any) {
        if musicBottonLabel.currentTitle! == "Play Music" {
            print("Playing Music")
            audioPlayer.play()
            audioPlayer.numberOfLoops = 3
            musicBottonLabel.setTitle("Stop Music", for: .normal)
        } else if musicBottonLabel.currentTitle! == "Stop Music" {
            print("Stopping Music")
            audioPlayer.stop()
            musicBottonLabel.setTitle("Play Music", for: .normal)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        musicBottonLabel.setTitle("Play Music", for: .normal) 
        launch_image()
        launch_proverb()
        
        // Setting up the sound
        let sound = Bundle.main.path(forResource: "africa_music", ofType: "mp3")
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
        }
        catch {
            print("Unable to play file")
        }
    }
    
    func randomize_image() -> String {
        let randomInt = Int.random(in: 1..<11)
        print("africa_\(randomInt)")
        return "africa_\(randomInt)"
    }
    
    func launch_image() {
        background_image.contentMode = .scaleAspectFill
        background_image.image = UIImage(named: randomize_image())
    }
    
    func launch_proverb() {
        proverb_label.text = randomize_text()
    }
    
    func randomize_text() -> String{
        let africanQuotes : [String] = [
        "Supposing doesn’t fill the grain basket ‘if’ doesn’t fill the larder. ~ Ovambo Proverb",
        "All monkeys cannot hang on the same branch. ~ Kenyan Proverb",
        "Those who are absent are always wrong. ~ Congolese Proverb",
        "There are no shortcuts to the top of the palm tree. ~ Cameroonian Proverb",
        "God has created lands with lakes and rivers for man to live. And the desert so that he can find his soul. ~  Tuareg Proverb",
        "Do not allow the belly to make you useless. ~ Maasai Proverb",
        "Little by little grow the bananas. ~ Congolese Proverb",
        "If you overtake a leader, you break your neck. ~ Ugandan Proverb",
        "The big game often appears when the hunter has given up the hunt for the day. ~ Igbo Proverb",
        "A clever king is the brother of peace. ~ South African Proverb",
        "Haste and hurry can only bear children with many regrets along the way. ~ Senegalese Proverb"]
        
        let randomInt = Int.random(in: 0..<africanQuotes.count)
        return africanQuotes[randomInt]
    }
    
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        print("Device was Shaken!")
        launch_image()
        launch_proverb()
    }


}

