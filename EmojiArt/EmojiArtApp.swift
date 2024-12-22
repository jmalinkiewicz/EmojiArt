//
//  EmojiArtApp.swift
//  EmojiArt
//
//  Created by Jakub Malinkiewicz on 09/12/2024.
//

import SwiftUI

@main
struct EmojiArtApp: App {
    @State private var document = EmojiArtDocument()
    @State private var paletteStore = PaletteStore(named: "Main")
    
    var body: some Scene {
        WindowGroup {
            EmojiArtDocumentView()
                .environment(document)
                .environment(paletteStore)
        }
    }
}
