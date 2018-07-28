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
    
    // gets free init as long as all of its vars are initialized
    
    // use of lazy
    // cannot have didSet // cannot have property observers
    lazy var game = Concentration(numberOfPairsOfCards: (buttons.count + 1) / 2)
    
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
        
        if let index = buttons.index(of: sender) {
            game.chooseCard(at: index)
            // update view from the model
            updateViewFromModel()
        } else {
            print("chosen card was not in buttons")
        }
        
    }
    
    func updateViewFromModel() {
        for index in buttons.indices {
            let button = buttons[index]
            let card = game.cards[index]
            
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControlState.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            } else {
                button.setTitle("", for: UIControlState.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
        }
    }
    
    var emojis = ["👻", "🎃", "👜", "⛑", "💀", "😱", "😸", "🙏", "🤡", "💩", "🤬"]

    var emoji = Dictionary<Int, String>()
    
    func emoji(for card : Card) -> String {
        
        if emoji[card.identifier] == nil , emojis.count > 0 {
            // Swift never automatically converts from one Int type to another Int type (such as uint)
            let randomIndex = Int(arc4random_uniform(UInt32(emojis.count)))
            emoji[card.identifier] = emojis.remove(at: randomIndex)
        }
        
        return emoji[card.identifier] ?? "?"
        
        /* the above is simplified version of the following
        if emoji[card.identifier] != nil {
            return emoji[card.identifier]!
        } else {
            return "?"
        }
        */
    }

}

