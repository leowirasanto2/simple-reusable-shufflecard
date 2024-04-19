//
//  GroupedShuffleGridView.swift
//  reusable-shuffle-card
//
//  Created by Leo Wirasanto Laia on 15/04/24.
//

import SwiftUI

struct SingleGridView: View {
    var card: Card
    var style: CardStyle
    var onTap: (String?) -> ()
    
    var body: some View {
        Button {
            onTap(card.cardAction?.deeplink)
        } label: {
            if let url = URL(string: card.imageUrl.orEmpty) {
                AsyncImage(url: url) { image in
                    image.resizable()
                    image.scaledToFit()
                } placeholder: {
                    ProgressView()
                }
                .clipped()
            } else {
                Rectangle()
                    .foregroundStyle(.gray.opacity(0.4))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
        .frame(width: 150, height: 150)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    SingleGridView(
        card: Card(),
        style: .defaultStyle
    ) { _ in }
}
