//
//  ShuffleGridView.swift
//  reusable-shuffle-card
//
//  Created by Leo Wirasanto Laia on 15/04/24.
//

import SwiftUI

struct ShuffleGridView: View {
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
                        
                        if let action = cardModel.card.cardAction {
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
                            SingleGridView(card: data, style: style, onTap: cardModel.actionTapped)
                        }
                    }
                    .padding(.horizontal)
                }
            }
        } else {
            SingleGridView(card: cardModel.card, style: style, onTap: cardModel.actionTapped)
        }
    }
}

#Preview {
    ShuffleGridView(cardModel: CardModel(), style: .defaultStyle)
}
