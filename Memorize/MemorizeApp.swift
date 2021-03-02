//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Vitalik Shuliak on 01/03/2021.
//

import SwiftUI

@main
struct MemorizeApp: App {
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: EmojiMemoryGame.init())
        }
    }
}
