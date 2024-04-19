//
//  ShuffleCapsuleView.swift
//  reusable-shuffle-card
//
//  Created by Leo Wirasanto Laia on 15/04/24.
//

import SwiftUI

struct SingleCapsuleView: View {
    var card: Card
    var style: CardStyle
    var onTap: (String?) -> ()
    
    var body: some View {
        Button {
            onTap(card.cardAction?.deeplink)
        } label: {
            VStack {
                Text(card.title.orEmpty)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(style.config.cardForegroundColor)
                .background {
                    if let url = URL(string: card.imageUrl.orEmpty) {
                        AsyncImage(url: url) { image in
                            image.image?.resizable()
                            image.image?.scaledToFill()
                        }
                    }
                }
                .padding(.vertical, 8)
                .padding(.horizontal)
            }
            .background(.gray.opacity(0.4))
            .clipShape(RoundedRectangle(cornerRadius: .infinity))
        }
    }
}

#Preview {
    SingleCapsuleView(
        card: Card(),
        style: .defaultStyle
        , onTap: { _ in })
}
