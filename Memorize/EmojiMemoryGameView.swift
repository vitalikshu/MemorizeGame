//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Vitalik Shuliak on 01/03/2021.
// https://www.youtube.com/watch?v=jbtqIBpUG7g&t=1982s
//

import SwiftUI

struct EmojiMemoryGameView: View {
    
    var viewModel: EmojiMemoryGame
    
    var body: some View {
        
        HStack {
            ForEach(viewModel.cards) {card in
                CardView(card: card).onTapGesture {
                    viewModel.choose(card: card)
                }
            }
        }
        .padding()
        .foregroundColor(.orange)
        .font(Font.largeTitle)
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}


// MARK - CardView
struct CardView: View {
    var card:MemoryGame<String>.Card
    //var isFaceUp: Bool
    var body: some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
                RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3.0)
                Text (card.content)//Text("👻")
                
            } else {
                RoundedRectangle(cornerRadius: 10.0).fill()
                
            }
        }
    }
}
// MARK - CardView

