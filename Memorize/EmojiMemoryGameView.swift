//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Vitalik Shuliak on 01/03/2021.
// https://www.youtube.com/watch?v=jbtqIBpUG7g&t=1982s
//

import SwiftUI

struct EmojiMemoryGameView: View {
    
    @ObservedObject var viewModel: EmojiMemoryGame
    
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
        GeometryReader(content:  { geometry in
            ZStack {
                if card.isFaceUp {
                    RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                    RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
                    Text (card.content)//Text("👻")
                    
                } else {
                    RoundedRectangle(cornerRadius: cornerRadius).fill()
                }
            }
            .font(Font.system(size: min(geometry.size.width, geometry.size.height)*fontScaleFactor))

        })
      
    }
    // MARK - Drawing Constans
    let cornerRadius: CGFloat = 10.0
    let edgeLineWidth: CGFloat = 10.0
    let fontScaleFactor: CGFloat = 0.6
    
    
}
// MARK - CardView

