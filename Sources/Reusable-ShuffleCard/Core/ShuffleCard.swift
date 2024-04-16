//
//  ShuffleCard.swift
//  reusable-shuffle-card
//
//  Created by Leo Wirasanto Laia on 16/04/24.
//

import SwiftUI

public enum CardStyle {
    case defaultStyle
    case custom(style: CardStyleConfig)
    
    var config: CardStyleConfig {
        switch self {
        case .defaultStyle:
            return CardStyleConfig()
        case .custom(let style):
            return style
        }
    }
}

public struct CardStyleConfig {
    var groupTitleForegroundColor: Color
    var cardForegroundColor: Color
    var showGroupTitle: Bool
    
    public init(groupTitleForegroundColor: Color = .black, cardForegroundColor: Color = .white, showGroupTitle: Bool = true) {
        self.groupTitleForegroundColor = groupTitleForegroundColor
        self.cardForegroundColor = cardForegroundColor
        self.showGroupTitle = showGroupTitle
    }
}

public struct ShuffleCard: View {
    @EnvironmentObject var cardModel: CardModel
    private var style: CardStyle
    
    public init(_ style: CardStyle = .defaultStyle) {
        self.style = style
    }
    
    public var body: some View {
        HStack {
            switch cardModel.card.type {
            case .banner:
                ShuffleBannerView(cardModel: cardModel, style: style)
            case .capsule:
                ShuffleCapsuleView(cardModel: cardModel, style: style)
            case .grid:
                ShuffleGridView(cardModel: cardModel, style: style)
            }
        }
    }
}

#Preview {
    ShuffleCard(.defaultStyle)
        .environmentObject(
            CardModel(
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
                    cards: []
                )
            )
        )
}
