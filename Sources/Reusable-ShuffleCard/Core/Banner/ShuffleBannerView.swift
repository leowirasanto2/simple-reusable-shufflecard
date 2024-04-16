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
                            SingleBannerView(data: data, style: style, onActionTapped: cardModel.actionTapped)
                        }
                    }
                    .padding(.horizontal)
                }
            }
        } else {
            VStack {
                SingleBannerView(data: cardModel.card, style: style, onActionTapped: cardModel.actionTapped)
            }
            .padding()
        }
    }
}

#Preview {
    ShuffleBannerView(
        cardModel: CardModel(
            card: Card(
                id: UUID().uuidString,
                isParent: true,
                type: .banner,
                title: "Title",
                description: "Put your description here, as you expected. Do not hesitate to ask for help if any.",
                imageUrl: "https://picsum.photos/400/200",
                createdDate: "2024-04-15T07:20:00.617Z",
                expiredDate: "2024-04-22T07:20:00.617Z",
                action: CardAction(
                    text: "See All",
                    deeplink: "deeplink://"),
                cards: [
                    Card(
                        id: UUID().uuidString,
                        isParent: false,
                        type: .banner,
                        title: "Title",
                        description: "Put your description here, as you expected. Do not hesitate to ask for help if any.",
                        imageUrl: "https://picsum.photos/400/200",
                        createdDate: "2024-04-15T07:20:00.617Z",
                        expiredDate: "2024-04-22T07:20:00.617Z",
                        action: CardAction(
                            text: "Claim",
                            deeplink: "deeplink://"),
                        cards: []
                    ),
                    Card(
                        id: UUID().uuidString,
                        isParent: false,
                        type: .banner,
                        title: "Title",
                        description: "Put your description here, as you expected. Do not hesitate to ask for help if any.",
                        imageUrl: "https://picsum.photos/400/200",
                        createdDate: "2024-04-15T07:20:00.617Z",
                        expiredDate: "2024-04-22T07:20:00.617Z",
                        action: CardAction(
                            text: "Claim",
                            deeplink: "deeplink://"),
                        cards: []
                    ),
                    Card(
                        id: UUID().uuidString,
                        isParent: false,
                        type: .banner,
                        title: "Title",
                        description: "Put your description here, as you expected. Do not hesitate to ask for help if any.",
                        imageUrl: "https://picsum.photos/400/200",
                        createdDate: "2024-04-15T07:20:00.617Z",
                        expiredDate: "2024-04-22T07:20:00.617Z",
                        action: CardAction(
                            text: "Claim",
                            deeplink: "deeplink://"),
                        cards: []
                    )
                ]
            )
        ), style: .defaultStyle
    )
}
