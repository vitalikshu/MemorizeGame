//
//  MemoryGameModel.swift
//  Memorize
//
//  Created by Vitalik Shuliak on 01/03/2021.
//

import Foundation

struct MemoryGame<CardContent> {
    
    var cards : Array<Card>  //говорим что эта переменная массив с  Card
    
    mutating func choose(card: Card) {
        print("card choen: \(card)")
        let chosenIndex: Int = self.index(of: card)
        self.cards[chosenIndex].isFaceUp = !self.cards[chosenIndex].isFaceUp
        
    }
    
    func index(of card: Card) -> Int{
        for index in 0..<self.cards.count {
            if self.cards[index].id == card.id {
                return index
            }
        }
        return 0 //TODO: bogus!
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
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
    }
    
    
    
}
