//
//  EmojiArtDocument.swift
//  EmojiArt
//
//  Created by Jakub Malinkiewicz on 09/12/2024.
//

import SwiftUI

@Observable class EmojiArtDocument {
    typealias Emoji = EmojiArt.Emoji
    
    private var emojiArt = EmojiArt()
     
    var emojis: [Emoji] {
        emojiArt.emojis
    }
    
    var background: URL? {
        emojiArt.background
    }
    
    // MARK: - Intent(s)
    
    func setBackground(_ url: URL?) {
        emojiArt.background = url
    }
    
    func addEmoji(_ emoji: String, at position: Emoji.Position, size: CGFloat) {
        emojiArt.addEmoji(emoji, at: position, size: Int(size))
    }
    
    func move(_ emoji: Emoji, by offset:  CGOffset) {
        let existingPosition = emojiArt[emoji].position
        emojiArt[emoji].position = Emoji.Position(x: existingPosition.x + Int(offset.width), y: existingPosition.y - Int(offset.height))
    }
    
    func move(emojiWithId id: Emoji.ID, by offset: CGOffset) {
        if let emoji = emojiArt[id] {
            move(emoji, by: offset)
        }
    }
    
    func resize(_ emoji: Emoji, by scale: CGFloat) {
        emojiArt[emoji].size = Int(CGFloat(emojiArt[emoji].size) * scale)
    }
    
    func resize(emojiWithId id: Emoji.ID, by scale: CGFloat) {
        if let emoji = emojiArt[id] {
            resize(emoji, by: scale)
        }
    }
    
    func remove(_ emoji: Emoji) {
        emojiArt.remove(emoji)
    }
    
    func remove(emojiWithId id: Emoji.ID) {
        if let emoji = emojiArt[id] {
            emojiArt.remove(emoji)
        }
    }
    
    init() {
//        emojiArt.addEmoji("🚗", at: .init(x: -200, y: -150), size: 200)
//        emojiArt.addEmoji("🚖", at: .init(x: 250, y: 100), size: 80)
    }
}
 
extension EmojiArt.Emoji {
    var font: Font {
        Font.system(size: CGFloat(size))
    }
}

extension EmojiArt.Emoji.Position {
    func `in`(_ geometry: GeometryProxy) -> CGPoint {
        let center = geometry.frame(in: .local).center
        return CGPoint(x: center.x + CGFloat(x), y: center.y - CGFloat(y))
    }
}
 
