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
                            SingleCapsuleView(cardModel: data, style: style, onTap: cardModel.actionTapped)
                        }
                    }
                    .padding(.horizontal)
                }
            }
        } else {
            SingleCapsuleView(cardModel: cardModel.card, style: style, onTap: cardModel.actionTapped)
                .padding()
        }
    }
}

#Preview {
    ShuffleCapsuleView(
        cardModel: CardModel(
            card:
                Card(
                    id: UUID().uuidString,
                    isParent: true,
                    type: .capsule,
                    title: "Discount & Cashback",
                    description: "",
                    imageUrl: "https://picsum.photos/400/200",
                    createdDate: "2024-04-15T07:20:00.617Z",
                    expiredDate: "2024-04-22T07:20:00.617Z",
                    action: CardAction(
                        text: "See all",
                        deeplink: "deeplink://"),
                    cards: [
                        Card(
                            id: UUID().uuidString,
                            isParent: true,
                            type: .capsule,
                            title: "Discount 20%",
                            description: "",
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
                            isParent: true,
                            type: .capsule,
                            title: "Discount 220%",
                            description: "",
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
                            isParent: true,
                            type: .capsule,
                            title: "Discount 11%",
                            description: "",
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
                            isParent: true,
                            type: .capsule,
                            title: "Discount 20%",
                            description: "",
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
                            isParent: true,
                            type: .capsule,
                            title: "Discount 20%",
                            description: "",
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
                            isParent: true,
                            type: .capsule,
                            title: "Discount 230%",
                            description: "",
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
