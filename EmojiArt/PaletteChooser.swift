//
//  PaletteChooser.swift
//  EmojiArt
//
//  Created by Jakub Malinkiewicz on 20/12/2024.
//

import SwiftUI

struct PaletteChooser: View {
    @Environment(PaletteStore.self) private var store 
    
    var body: some View {
        HStack {
            chooser
            view(for: store.palettes[store.cursorIndex])
        }
        .clipped()
    }
    
    var chooser: some View {
        AnimatedActionButton(systemImage: "paintpalette") {
            store.cursorIndex += 1
        }
        .contextMenu {
            AnimatedActionButton("New", systemImage: "plus") {
                store.insert(name: "Math", emojis: "➕➖✖️➗")
            }
            AnimatedActionButton("Delete", systemImage: "minus.circle", role: .destructive) {
                store.palettes.remove(at: store.cursorIndex)
            }
        }
    }
    
    func view(for palette: Palette) -> some View {
        HStack {
            Text(palette.name)
            ScrollingEmojis(palette.emojis)
        }
        .id(palette.id)
        .transition(.asymmetric(insertion: .rollUp, removal: .rollUp))
    }
}

struct ScrollingEmojis: View {
    let emojis: [String]
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(emojis, id:  \.self) { emoji in
                    Text(emoji)
                        .draggable(emoji)
                }
            }
        }
    }
    
    init(_ emojis: String) {
        self.emojis = emojis.uniqued.map(String.init)
    }
}

#Preview {
    PaletteChooser()
}
