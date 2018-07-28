//
//  Card.swift
//  Concentration
//
//  Created by Sashi Kumar Penta on 7/27/18.
//  Copyright © 2018 Sashi Kumar Penta. All rights reserved.
//

import Foundation

struct Card {
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    static var identifierFactory = 0
    
    // static function : You cannot to send it to a card
    static func getUniqueIdentifier() -> Int {
        // You don't need to put Card.identifierFactory as it is inside static function
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
}
