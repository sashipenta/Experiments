//
//  ViewController.swift
//  Concentration
//
//  Created by Sashi Kumar Penta on 7/23/18.
//  Copyright © 2018 Sashi Kumar Penta. All rights reserved.
//

import UIKit

// Declaration of the class : Super Class
class ViewController: UIViewController {
    // methods and instances

    // in swift instance variables are called properties
    // 2 ways to initialize - initializers (little complicated), other just initialize here
    var flipCount = 0 {
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    // instead of var flipCount:Int = 0
    
    // Swift is extremely typed language (strongly typed language) - strong type inference
    
    // bang at the end : super important
    // doesn't have to be initialized
    @IBOutlet weak var flipCountLabel: UILabel!
    
    var emojis = ["👻", "🎃", "👻", "🎃", "🎃", "👻"]

    @IBOutlet var buttons: [UIButton]!
    // @IBAction is X
    // func swith method - okay to have global functions
    // type UIButton (comes after colon)
    // _ sender - external_name internal_name
    // each paramter has the name even when called
    // 2 names : external name and
    // return value -> Int
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        
        let index = buttons.index(of: sender)!
        
        print("index: \(index)\n")
        
        flipCard(withEmoji: emojis[index], on: sender)
    }
    
    func flipCard(withEmoji emoji: String, on button: UIButton) {
        if button.currentTitle == emoji {
            button.setTitle("", for: UIControlState.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
        } else {
            button.setTitle(emoji, for: UIControlState.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
    }

}

