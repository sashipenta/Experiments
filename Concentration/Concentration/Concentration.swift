//
//  Concentration.swift
//  Concentration
//
//  Created by Sashi Kumar Penta on 7/27/18.
//  Copyright © 2018 Sashi Kumar Penta. All rights reserved.
//

import Foundation

class Concentration
{
    var cards = [Card]()
    
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    func chooseCard(at index: Int) {
        // Ignore all the matched cards
        if !cards[index].isMatched {
            // 3 possibilities
            // 1. No cards are face up
            // 2. 2 cards are face up
            // 3. 1 card face up
            
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                // 2. 2 cards are face up
                // check if cards match
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                
                // 3. Flip up the card (either 1 card up, 2 up)
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            } else {
                //1. No cards are face up
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
            

        }
    }
    
    init(numberOfPairsOfCards: Int) {
        // 0..<num
        // 1...num
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        // TODO: Shuffle the cards
    }
}
