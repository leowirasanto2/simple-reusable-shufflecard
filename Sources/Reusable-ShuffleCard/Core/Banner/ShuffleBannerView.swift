//
//  ShuffleBannerView.swift
//  reusable-shuffle-card
//
//  Created by Leo Wirasanto Laia on 15/04/24.
//

import SwiftUI

struct ShuffleBannerView: View {
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
                            SingleBannerView(card: data, style: style, onActionTapped: cardModel.actionTapped)
                        }
                    }
                    .padding(.horizontal)
                }
            }
        } else {
            VStack {
                SingleBannerView(card: cardModel.card, style: style, onActionTapped: cardModel.actionTapped)
            }
            .padding()
        }
    }
}

#Preview {
    ShuffleBannerView(
        cardModel: CardModel(), style: .defaultStyle)
}
