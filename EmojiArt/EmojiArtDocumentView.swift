//
//  EmojiArtDocumentView.swift
//  EmojiArt
//
//  Created by Jakub Malinkiewicz on 09/12/2024.
//

import SwiftUI

struct EmojiArtDocumentView: View {
    typealias Emoji = EmojiArt.Emoji
    @Environment(EmojiArtDocument.self) private var document
    
    private let paletteEmojiSize: CGFloat = 40
    
    var body: some View {
        VStack(spacing: 0) {
            documentBody
            PaletteChooser()
                .font(.system(size: paletteEmojiSize))
                .padding(.horizontal)
                .scrollIndicators(.hidden)
        }
    }
    
    private var documentBody: some View {
        GeometryReader { geometry in
            ZStack {
                Color.white
                documentContents(in: geometry)
                    .scaleEffect(zoom * (selectedEmojisIds.isEmpty ? gestureZoom : 1))
                    .offset(pan + gesturePan )
            }
            .gesture(panGesture.simultaneously(with: zoomGesture ))
            .dropDestination(for: Sturldata.self) { sturldatas, location in
                return drop(sturldatas, at: location, in: geometry)
            }
        }
    }
    
    @State private var zoom: CGFloat = 1
    @State private var pan: CGOffset = .zero
    
    @GestureState private var gestureZoom: CGFloat = 1
    @GestureState private var gesturePan: CGOffset = .zero
    
    private var zoomGesture: some Gesture {
        MagnificationGesture()
            .updating($gestureZoom) { inMotionPinchScale, gestureZoom, _ in
                gestureZoom = inMotionPinchScale
            }
            .onEnded { endingPinchValue in
                if (!selectedEmojisIds.isEmpty) {
                    selectedEmojisIds.forEach { id in
                        document.resize(emojiWithId: id, by: endingPinchValue)
                    }
                } else {
                    zoom *= endingPinchValue
                }
            }
    }
    
    private var panGesture: some Gesture {
        DragGesture()
            .updating($gesturePan) { value, gesturePan, _ in
                gesturePan = value.translation
            }
            .onEnded { value in
                pan += value.translation
            }
    }
    
    @ViewBuilder
    private func documentContents(in geometry: GeometryProxy) -> some View {
        AsyncImage(url: document.background)
            .onTapGesture {
                selectedEmojisIds.removeAll()
            }
            .position(Emoji.Position(x: 0, y: 0).in(geometry))
        ForEach(document.emojis) { emoji in
            Text(emoji.string)
                .font(emoji.font)
                .background((selectedEmojisIds.contains(emoji.id) && gestureDrag == .zero) ? .yellow.opacity(0.8) : .clear)
                .scaleEffect(selectedEmojisIds.contains(emoji.id) ? gestureZoom : 1)
                .position(emoji.position.in(geometry))
                .offset(selectedEmojisIds.contains(emoji.id) ? gestureDrag : .zero)
                .gesture(
                    tapGesture(emoji: emoji)
                        .simultaneously(with: dragGesture)
                )

        }
    }
    
    @GestureState private var gestureDrag: CGOffset = .zero
    
    private var dragGesture: some Gesture {
        DragGesture()
            .updating($gestureDrag) { value, gestureDrag, _ in
                gestureDrag = value.translation
            }
            .onEnded { value in
                selectedEmojisIds.forEach { id in
                    document.move(emojiWithId: id, by: value.translation)
                }
            }
    }
    
    private func tapGesture(emoji: Emoji) -> some Gesture {
        TapGesture()
            .onEnded {
                if gestureDrag == .zero {
                    print("tap")
                    select(emoji)
                }
            }
    }
    
    @State private var selectedEmojisIds: Set<Emoji.ID> = []
    
    private func select(_ emoji: Emoji) {
        if selectedEmojisIds.contains(emoji.id) {
            selectedEmojisIds.remove(emoji.id)
        } else {
            selectedEmojisIds.insert(emoji.id)
        }
    }
    
    private func drop(_ sturldatas: [Sturldata], at location: CGPoint, in geometry: GeometryProxy) -> Bool {
        for sturldata in sturldatas {
            switch sturldata {
            case .url(let url):
                document.setBackground(url)
                return true
            case .string(let emoji):
                document.addEmoji(emoji, at: emojiPosition(at: location, in: geometry), size: paletteEmojiSize / zoom  )
                print(document.emojis)
                return true
            default:
                break
            }
            
            return true
        }
        return false
    }
    private func emojiPosition(at location: CGPoint, in geometry: GeometryProxy) -> Emoji.Position {
        let center = geometry.frame(in: .local).center
        return Emoji.Position(
            x: Int((location.x - center.x - pan.width) / zoom ),
            y: Int(-(location.y - center.y - pan.height) / zoom )
        )
    }
}

#Preview {
    EmojiArtDocumentView()
}
