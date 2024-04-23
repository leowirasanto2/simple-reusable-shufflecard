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
        VStack {
            if cardModel.isCardGrouped() {
                VStack(alignment: .leading) {
                    if style.config.showGroupTitle {
                        GroupTitleView(title: cardModel.card.title.orEmpty, actionText: cardModel.card.cardAction?.text, style: style) {
                            cardModel.actionTapped(cardModel.card.cardAction?.deeplink)
                        }
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
}

#Preview {
    ShuffleBannerView(
        cardModel: CardModel(), style: .defaultStyle)
}
