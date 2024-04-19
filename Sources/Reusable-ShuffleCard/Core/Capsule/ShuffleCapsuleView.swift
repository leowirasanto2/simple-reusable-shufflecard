//
//  GroupedShuffleCapsuleView.swift
//  reusable-shuffle-card
//
//  Created by Leo Wirasanto Laia on 15/04/24.
//

import SwiftUI

struct ShuffleCapsuleView: View {
    @StateObject var cardModel: CardModel
    var style: CardStyle
    
    var body: some View {
        if cardModel.isCardGrouped() {
            VStack(alignment: .leading) {
                if style.config.showGroupTitle {
                    HStack {
                        Text(cardModel.card.title.orEmpty)
                            .font(.headline)
                            .fontWeight(.semibold)
                        
                        if let action = cardModel.card.action {
                            Spacer()
                            Button {
                                cardModel.actionTapped(action.deeplink)
                            } label: {
                                Text(action.text.orEmpty)
                                    .font(.headline)
                                    .fontWeight(.semibold)
                            }
                        }
                    }
                    .foregroundStyle(style.config.groupTitleForegroundColor)
                .padding(.horizontal)
                }
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(cardModel.card.cards, id: \.id) { data in
                            SingleCapsuleView(card: data, style: style, onTap: cardModel.actionTapped)
                        }
                    }
                    .padding(.horizontal)
                }
            }
        } else {
            SingleCapsuleView(card: cardModel.card, style: style, onTap: cardModel.actionTapped)
                .padding()
        }
    }
}

#Preview {
    ShuffleCapsuleView(
        cardModel: CardModel(), style: .defaultStyle
    )
    
}
