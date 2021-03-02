//
//  MemoryGameModel.swift
//  Memorize
//
//  Created by Vitalik Shuliak on 01/03/2021.
//

import Foundation

struct MemoryGame<CardContent> {
    var cards : Array<Card>  //говорим что эта переменная массив с  Card
    
    func choose(card: Card){
        print("card choen: \(card)")
    }
    
    init(numberOfPairsOffCards: Int, cardContentFactory: (Int) -> CardContent) {
    cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOffCards{
            let content = cardContentFactory(pairIndex)
            cards.append(Card.init(id: pairIndex*2, isMatched: false, content: content))
            cards.append(Card.init(id: pairIndex*2+1, isMatched: false, content: content))

        }
    }
    
    struct Card: Identifiable {
        var id: Int
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        var content: CardContent
    }
    
    
    
}
