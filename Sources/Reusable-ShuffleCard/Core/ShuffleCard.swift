//
//  ShuffleCard.swift
//  reusable-shuffle-card
//
//  Created by Leo Wirasanto Laia on 16/04/24.
//

import SwiftUI

public struct ShuffleCard: View {
    @EnvironmentObject var cardModel: CardModel
    public var body: some View {
        HStack {
            switch cardModel.card.type {
            case .banner:
                ShuffleBannerView(cardModel: cardModel)
            case .capsule:
                ShuffleCapsuleView(cardModel: cardModel)
            case .grid:
                ShuffleGridView(cardModel: cardModel)
            }
        }
    }
}

#Preview {
    ShuffleCard()
        .environmentObject(
            CardModel(
                card: Card(
                    id: UUID().uuidString,
                    isParent: true,
                    type: .grid,
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
                            isParent: true,
                            type: .capsule,
                            title: "Discount 10%",
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
                            title: "Discount 2220%",
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
                            title: "Off 10%",
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
                            title: "Cashback 5%",
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
            )
        )
}
