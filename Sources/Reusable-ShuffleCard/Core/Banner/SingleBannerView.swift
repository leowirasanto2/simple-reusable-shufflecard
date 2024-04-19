//
//  SingleBannerView.swift
//  reusable-shuffle-card
//
//  Created by Leo Wirasanto Laia on 15/04/24.
//

import SwiftUI

struct SingleBannerView: View {
    var card: Card
    var style: CardStyle
    var onActionTapped: (String?) -> ()
    
    var body: some View {
        VStack {
            cardView
                .background {
                    if let url = URL(string: card.imageUrl.orEmpty) {
                        AsyncImage(url: url) { image in
                            image.image?.resizable()
                            image.image?.scaledToFill()
                        }
                    }
                }
        }
        .frame(width: 350, height: 180)
        .background(.gray.opacity(0.4))
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
    
    var cardView: some View {
        VStack {
            VStack(alignment: .leading, spacing: 16) {
                Group {
                    Text(card.title.orEmpty)
                        .font(.headline)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text(card.description.orEmpty)
                        .font(.subheadline)
                        .lineLimit(2)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .foregroundStyle(style.config.cardForegroundColor)
                if let action = card.action {
                    Button {
                        onActionTapped(action.deeplink)
                    } label: {
                        Text(action.text.orEmpty)
                            .font(.subheadline)
                            .foregroundStyle(style.config.cardForegroundColor)
                            .fontWeight(.semibold)
                            .colorInvert()
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 8)
                    .background(style.config.cardForegroundColor)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                }
            }
            .padding()
        }
    }
}

#Preview {
    SingleBannerView(
        card:  Card(),
        style: .defaultStyle
    ) { deeplink in
        print(deeplink)
    }
}
